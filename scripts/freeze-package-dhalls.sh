#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR=$(cd "$(dirname "$0")/.."; pwd -P)

find "$ROOT_DIR/lib" -name '*.dhall' -print0 \
    | xargs -0 -n 1 dhall freeze --cache --all --inplace

# The order is important because they depend on each other.
# A tree would be ideal, but it is bash ¯\_(ツ)_/¯
# TODO: Automatically figure this out
package_files=(types/package.dhall
               defaults/package.dhall
               schemas/package.dhall
               extractors/package.dhall
               helpers/package.dhall
               render/optionals/lists/package.dhall
               render/optionals/package.dhall
               render/package.dhall
               package.dhall
              )

for f in "${package_files[@]}"; do
    echo "Freezing $f"
    dhall freeze --cache --all --inplace "$ROOT_DIR/$f"
done
