#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <commit>"
    exit 1
fi

commit="$1"

if [ ! -d /share/v8 ]; then
   pushd /share
     fetch v8
   popd
fi

pushd /share/v8
  git checkout "$commit"
  gclient sync
  ./build/install-build-deps.sh
popd
