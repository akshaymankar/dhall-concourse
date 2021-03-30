#!/usr/bin/env sh

set -eu

repo=${1:?"Please provide path to the repository"}

env="$(nix-build "$repo/direnv.nix" -A ciEnv)"
export PATH="$env/bin:$PATH"

for f in "$repo"/*/*.dhall; do
    echo "Checking $f"
    dhall type --quiet --file "$f"
done

echo "Checking if all the cache fingerprints are correct"
"$repo/scripts/freeze-package-dhalls.sh"
git -C "$repo" diff --color --exit-code

echo "Shellchecking all the scripts"
shellcheck "$repo"/**/*.sh
