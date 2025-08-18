#!/usr/bin/env bash
set -euo pipefail
rm -rf ./trophy-site/docs
mkdir -p ./trophy-site/docs
# EDIT this path to your Obsidian subfolder
rsync -av --delete "./bellmead/trophy/" ./trophy-site/docs/
