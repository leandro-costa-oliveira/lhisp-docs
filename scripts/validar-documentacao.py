#!/usr/bin/env python3
"""Valida metadados e destinos de links locais das páginas Wiki.js, sem rede."""

import re
import subprocess
import sys
from pathlib import Path
from urllib.parse import unquote, urlsplit


ROOT = Path(__file__).resolve().parents[1]
LINK = re.compile(r"!?\[[^\]]*\]\(([^\s)]+)(?:\s+[^)]*)?\)")
REQUIRED = ("title", "description", "published", "editor")


def main():
    names = subprocess.check_output(
        ["git", "ls-files", "--cached", "--others", "--exclude-standard", "-z", "--", "*.md"],
        cwd=ROOT,
    ).decode().split("\0")
    pages = sorted(
        {
            name
            for name in names
            if name
            and name != "README.md"
            and not any(part.startswith(".") for part in Path(name).parts)
            and Path(name).parts[0] != "tasks"
            and (ROOT / name).is_file()
        }
    )
    errors = []
    links = 0
    for name in pages:
        content = (ROOT / name).read_text(encoding="utf-8")
        metadata = re.match(r"\A---\n(.*?)\n---\n", content, re.DOTALL)
        if not metadata:
            errors.append(f"{name}: frontmatter ausente ou sem delimitador final")
        else:
            fields = dict(re.findall(r"^([\w]+):[ \t]*(.*)$", metadata[1], re.MULTILINE))
            for field in REQUIRED:
                if field not in fields:
                    errors.append(f"{name}: metadado ausente: {field}")
            if fields.get("published") not in ("true", "false"):
                errors.append(f"{name}: published deve ser true ou false")
            if fields.get("editor") != "markdown":
                errors.append(f"{name}: editor deve ser markdown")

        # Exemplos de código não são links renderizados da página.
        body = re.sub(r"^```[^\n]*\n.*?^```[^\n]*$", "", content, flags=re.MULTILINE | re.DOTALL)
        for match in LINK.finditer(body):
            target = match[1].strip("<>")
            parsed = urlsplit(target)
            if parsed.scheme or parsed.netloc or not parsed.path:
                continue
            links += 1
            path = unquote(parsed.path)
            base = ROOT if path.startswith("/") else (ROOT / name).parent
            destination = (base / path.lstrip("/")).resolve()
            if not destination.is_relative_to(ROOT):
                errors.append(f"{name}: link fora do repositório: {target}")
            elif not destination.is_file() and not Path(str(destination) + ".md").is_file():
                errors.append(f"{name}: destino ausente: {target}")

    for error in errors:
        print(error, file=sys.stderr)
    print(f"{len(pages)} páginas; {links} links locais; {len(errors)} erro(s).")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
