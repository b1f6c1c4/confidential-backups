#!/bin/sh

set -e

T="$(mktemp)"

gpg -d -o- "$1" | gpg --encrypt --sign --armor -r 52BED143A92DBE962B83092B9BAC016496001E70 -o- >"$T"
cat "$T" >"$1"

rm -f "$T"
