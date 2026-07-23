#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update
sudo apt-get install -y texlive-xetex texlive-fonts-recommended texlive-lang-chinese fonts-noto-cjk fonts-dejavu
sudo apt-get install -y pandoc make
