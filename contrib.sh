#!/bin/bash

BRANCH_NAME=$1

echo "🔄 Synchronisation with upstream..."
git checkout main
git fetch upstream

echo "🌿 Prepare contrib from upstream/main"
git checkout -b "$BRANCH_NAME" upstream/main

echo "✅ Ready for contrib !"