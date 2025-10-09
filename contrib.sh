#!/bin/bash

ACTION=$1
BRANCH_NAME=$2

if [ -z "$BRANCH_NAME" ]; then
    echo "Usage: $0 <branch-name> [start|finish]"
    echo "  start: Start new contribution"
    echo "  finish: Restore upstream diff"
    exit 1
fi

case $ACTION in
    "start")
        echo "🔄 Synchronisation with upstream..."
        git checkout main
        git fetch origin

        git fetch upstream
        git diff upstream/main > diff-upstream.patch
        
        echo "🗑️ Deleting upstream diff before contrib..."
        git apply -R diff-upstream.patch
        echo "✅ Upstream diff deleted"
        
        echo "🌿 Creating branch $BRANCH_NAME..."
        git checkout -b "$BRANCH_NAME"

        echo "🌿 Prepare contrib by deleting diff"
        git add -A
        git reset HEAD diff-upstream.patch
        git commit -m "refactor(contrib): prepare contribution"
        git push origin "$BRANCH_NAME"
        
        echo "✅ Ready for contrib !"
        ;;
        
    "finish")
        echo "🔄 Return to main..."
        git checkout main
        
        echo "🔧 Restore upstream diff workflows..."
        git apply diff-upstream.patch
                
        echo "✅ Ready !"
        ;;
         
    *)
        echo "Unkown action: $ACTION"
        echo "Use start or finish"
        ;;
esac