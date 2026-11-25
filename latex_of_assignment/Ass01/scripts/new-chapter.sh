#!/usr/bin/env bash
# Create content/NN_<slug>/main.tex from templates/<template>.tex and link it
# into main.tex just above the "% @chapters-end" marker.
# Usage: scripts/new-chapter.sh <slug> [title] [template]
#   template: file name in templates/ without .tex (default: chapter)
set -euo pipefail
cd "$(dirname "$0")/.."

slug="${1:-}"
title="${2:-}"
template="${3:-chapter}"
[ -n "$slug" ] || { echo "usage: $0 <slug> [title] [template]"; exit 1; }
[[ "$slug" =~ ^[a-z0-9_-]+$ ]] || { echo "Error: slug must be lowercase [a-z0-9_-] (got '$slug')"; exit 1; }
[ -f "templates/$template.tex" ] || { echo "Error: templates/$template.tex not found"; exit 1; }
[ -n "$title" ] || title="${slug//[_-]/ }"

last=$(find content -mindepth 1 -maxdepth 1 -type d -name '[0-9][0-9]_*' -printf '%f\n' | cut -c1-2 | sort -n | tail -1)
next=$(printf '%02d' $((10#${last:-0} + 1)))
dir="content/${next}_${slug}"

[ -e "$dir" ] && { echo "Error: $dir already exists"; exit 1; }
grep -q '% @chapters-end' main.tex || { echo "Error: marker '% @chapters-end' missing in main.tex"; exit 1; }

mkdir -p "$dir"
tpl=$(<"templates/$template.tex")
tpl=${tpl//__DIR__/"$dir"}
tpl=${tpl//__TITLE__/"$title"}
tpl=${tpl//__SLUG__/"$slug"}
printf '%s\n' "$tpl" > "$dir/main.tex"

# Keep the marker's indentation so the new line lines up with its neighbours
awk -v path="$dir/main" '
  /% @chapters-end/ { match($0, /^[ \t]*/); print substr($0, 1, RLENGTH) "\\input{" path "}" }
  { print }' main.tex > main.tex.tmp
mv main.tex.tmp main.tex

echo "Created $dir/main.tex and added \\input{$dir/main} to main.tex"
