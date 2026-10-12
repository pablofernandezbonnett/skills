#!/usr/bin/env python3
"""Check skill metadata and local Markdown links."""

from __future__ import annotations

from pathlib import Path
import re


ROOT = Path(__file__).resolve().parent.parent
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

    return skills


def check_links() -> None:
    for markdown in ROOT.rglob("*.md"):
        if ".git" in markdown.parts:
            continue
        for match in LINK.finditer(markdown.read_text(encoding="utf-8")):
            target = match.group(1).split("#", 1)[0]
            if not target or "://" in target or target.startswith("mailto:"):
                continue
            assert (markdown.parent / target).exists(), (
                f"Broken link in {markdown.relative_to(ROOT)}: {target}"
            )


if __name__ == "__main__":
    found = check_skills()
    check_links()
    print(f"Validated {len(found)} skills and local Markdown links")
