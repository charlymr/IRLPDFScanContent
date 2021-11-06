#!/usr/bin/env bash
export GITHUBNAME=charlymr
export SCHEME=IRLPDFScanContent

xcodebuild docbuild                     \
  -scheme "${SCHEME}"                   \
  -destination generic/platform=iOS     \
  -derivedDataPath DerivedData

rm -rf ${SCHEME}.doccarchive

find DerivedData                        \
  -name "${SCHEME}.doccarchive"         \
  -exec cp -R {} ./ \;

rm -rf DerivedData

mv docs docs_bck || true

mv "${SCHEME}.doccarchive" docs
cp -pr docs_bck/CNAME docs/ || true

mkdir -p docs/documentation
cp -pr docs/index.html docs/documentation/

mkdir -p docs/tutorial
cp -pr docs/index.html docs/tutorial/

echo '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">' > docs/index.html
echo '<html<head><META HTTP-EQUIV="refresh" content="0;URL=/documentation"></head></html>' >> docs/index.html

cp -pr docs/data/documentation/*.json docs/data/documentation.json

rm -rf docs_bck