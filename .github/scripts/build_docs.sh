#!/usr/bin/env bash
set -euo pipefail

if [ -z "${PROJECT:-}" ]; then
  echo "Error: PROJECT environment variable is not set" >&2
  exit 1
fi

OS="$(uname -s)"
if [ "$OS" = "Linux" ]; then
    MAIN_FONT="DejaVu Serif"
    CJK_FONT="Noto Sans CJK SC"
elif [ "$OS" = "Darwin" ]; then
    MAIN_FONT="Times New Roman"
    CJK_FONT="PingFang SC"
else
    MAIN_FONT="Times New Roman"
    CJK_FONT="Noto Sans CJK SC"
fi

if [ -f "$PROJECT" ] && [[ "$PROJECT" == *.md ]]; then
  echo "Building single markdown file: $PROJECT"
  base="${PROJECT%.md}"
  pandoc "$PROJECT" -o "${base}.pdf" --pdf-engine=xelatex \
    -V mainfont="$MAIN_FONT" \
    -V CJKmainfont="$CJK_FONT" \
    -V sansfont="$MAIN_FONT" \
    -V monofont="$MAIN_FONT" \
    -V geometry:margin=1in -V fontsize=12pt || true
  pandoc "$PROJECT" -o "${base}.docx" -V mainfont="$MAIN_FONT" -V fontsize=12pt
  pandoc "$PROJECT" -o "${base}.html" -V mainfont="$MAIN_FONT" -V fontsize=12pt
  echo "Successfully built ${base}.pdf, ${base}.docx, and ${base}.html"
elif [ -d "$PROJECT" ]; then
  if make -C "$PROJECT" -n all >/dev/null 2>&1; then
    echo "Building 'all' target for directory $PROJECT"
    make -C "$PROJECT" all
  else
    echo "Building default target for directory $PROJECT"
    make -C "$PROJECT"
  fi
else
  echo "Error: PROJECT '$PROJECT' is neither a valid file nor directory" >&2
  exit 1
fi
