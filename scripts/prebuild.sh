#!/usr/bin/env bash
set -euo pipefail

# Clear out the existing docs folder and copy over the latest from Obsidian
rm -rf ./trophy-site/docs
mkdir -p ./trophy-site/docs
# EDIT this path to your Obsidian subfolder
rsync -av --delete "./bellmead/trophy/" ./trophy-site/docs/

# Convert Obsidian image resize syntax to MkDocs-friendly syntax
find ./trophy-site/docs -type f -name '*.md' -print0 | xargs -0 perl -pi -e '
s/!\[\[([^|\]]+)\|(\d+)\]\]/![](trophy\/campaign\/images\/\1){ width=\2 }/g
'
