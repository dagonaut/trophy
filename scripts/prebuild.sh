#!/usr/bin/env bash
set -euo pipefail
cd ../trophy-site
rm -rf docs
mkdir -p docs
# EDIT this path to your Obsidian subfolder
rsync -av --delete "../bellmead/trophy/" docs/
