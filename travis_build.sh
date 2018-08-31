#!/bin/bash

set -e

ROOT_URL="https://github.com/byllyfish/homebrew-oftr/releases/download/$TRAVIS_TAG"

brew tap byllyfish/oftr
brew update

brew install -v --build-bottle oftr
brew bottle --no-rebuild --root-url="$ROOT_URL" oftr

# Homebrew introduced a change which puts "--" in the bottle name. Rename
# the bottle to something that homebrew expects to download/install.

for bottle in *.bottle.tar.gz; do
  mv "$bottle" "${bottle/--/-}"
done
