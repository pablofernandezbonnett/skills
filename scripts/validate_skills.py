#!/usr/bin/env python3
"""Check skill metadata, local links, and the installer in an isolated home."""

from __future__ import annotations

import os
from pathlib import Path
import re
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parent.parent
INSTALLER = ROOT / "install.sh"
LINK = re.compile(r"\[[^\]]+\]\(([^)]+)\)")


def check_skills() -> list[Path]:
    skills = sorted(path for path in ROOT.iterdir() if (path / "SKILL.md").is_file())
    assert skills, "No skills found"

    for skill in skills:
        content = (skill / "SKILL.md").read_text(encoding="utf-8")
        frontmatter = re.match(r"\A---\n(.*?)\n---\n", content, re.DOTALL)
        assert frontmatter, f"Missing frontmatter: {skill.name}"
        name = re.search(r"^name:\s*(.+)$", frontmatter.group(1), re.MULTILINE)
        description = re.search(
            r"^description:\s*(.+)$", frontmatter.group(1), re.MULTILINE
        )
        assert name and name.group(1).strip(' "\'') == skill.name, f"Bad name: {skill.name}"
        assert description and description.group(1).strip(' "\''), (
            f"Missing description: {skill.name}"
        )

        for markdown in skill.rglob("*.md"):
            for match in LINK.finditer(markdown.read_text(encoding="utf-8")):
                target = match.group(1).split("#", 1)[0]
                if not target or "://" in target or target.startswith("mailto:"):
                    continue
                assert (markdown.parent / target).exists(), (
                    f"Broken link in {markdown.relative_to(ROOT)}: {target}"
                )

    return skills


def check_installer(skills: list[Path]) -> None:
    with tempfile.TemporaryDirectory() as temporary:
        codex_home = Path(temporary) / "codex"
        environment = {**os.environ, "CODEX_HOME": str(codex_home)}

        def run(*arguments: str, succeeds: bool = True) -> subprocess.CompletedProcess[str]:
            result = subprocess.run(
                [str(INSTALLER), *arguments],
                cwd=ROOT,
                env=environment,
                text=True,
                capture_output=True,
                check=False,
            )
            assert (result.returncode == 0) == succeeds, result.stdout + result.stderr
            return result

        assert len(run("--list").stdout.splitlines()) == len(skills)
        run("--help")
        run("--dry-run", "--system", "signal-first")
        assert not codex_home.exists(), "Read-only installer commands wrote files"

        run("missing-skill", succeeds=False)
        run("../signal-first", succeeds=False)
        assert not codex_home.exists(), "Invalid skill created a target directory"

        run()
        for skill in skills:
            assert (codex_home / "skills" / skill.name / "SKILL.md").read_bytes() == (
                skill / "SKILL.md"
            ).read_bytes()
        assert not (codex_home / "skills" / ".system").exists(), (
            "Default install wrote to .system"
        )

        sentinel = codex_home / "skills" / "signal-first" / "local-note.txt"
        sentinel.write_text("keep me", encoding="utf-8")
        run("signal-first")
        assert sentinel.read_text(encoding="utf-8") == "keep me", (
            "Refresh removed an unrelated local file"
        )

        run("--system", "signal-first")
        assert (
            codex_home / "skills" / ".system" / "signal-first" / "SKILL.md"
        ).read_bytes() == (ROOT / "signal-first" / "SKILL.md").read_bytes()


if __name__ == "__main__":
    found = check_skills()
    check_installer(found)
    print(f"Validated {len(found)} skills and installer behavior")
