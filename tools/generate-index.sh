#!/bin/bash

set -e

OUTFILE="index.md"
TMPFILE="toc.tmp"

# Kopfbereich mit Frontmatter (Platzhalter für Datum)
cat <<EOF > "$OUTFILE"
---
title: "Inhaltsverzeichnis"
created: AUTO
createdlink: AUTO
lastmod: AUTO
commitlink: AUTO
---

# Übersicht über alle Artikel

EOF

# Immer ganz oben: Willkommen.md
if [ -f "Willkommen.md" ]; then
  title=$(grep -m1 '^title:' Willkommen.md | cut -d ':' -f2- | sed 's/^ *//; s/"//g')
  [[ -z "$title" ]] && title="Willkommen"
  echo "- [${title}](./Willkommen)" >> "$OUTFILE"
  echo "" >> "$OUTFILE"
fi

# Hole alle .md-Dateien außer index.md und Willkommen.md
find . -maxdepth 1 -name "*.md" ! -name "index.md" ! -name "Willkommen.md" | while read file; do
  # Erstes Commit-Datum ermitteln
  date=$(git log --reverse --format="%ct" -- "$file" | head -n 1)
  printf "%s\t%s\n" "$date" "$file"
done | sort -n > "$TMPFILE"

# Liste einfügen
while IFS=$'\t' read -r timestamp file; do
  # Titel extrahieren
  title=$(grep -m1 '^title:' "$file" | cut -d ':' -f2- | sed 's/^ *//; s/"//g')
  [[ -z "$title" ]] && title=$(basename "$file" .md)
  link=$(basename "$file" .md)
  echo "- [${title}](./${link})" >> "$OUTFILE"
done < "$TMPFILE"

rm "$TMPFILE"

