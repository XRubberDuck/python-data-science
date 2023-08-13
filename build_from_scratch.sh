#!/bin/bash

set -e

# remove all intermediate files
rm -rf _build/rst _build/html
d2lbook build rst
cp static/frontpage.html _build/rst/
d2lbook build html
cp -r static/image/* _build/html/_images/

rm -rf docs
mkdir docs
touch docs/.nojekyll

rsync -av _build/html/* ./docs/