#!/usr/bin/env bash

set -euo pipefail

CI_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

config=$(mktemp)
dhall-to-json --file "$CI_DIR/pipeline.dhall" \
    | jq '.resources = (.resources|unique)' \
    | jq '.resource_types = (.resource_types|unique)' >"$config"

fly -t gdn set-pipeline -p dhall-concourse -c "$config"
