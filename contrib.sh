#!/bin/bash

ACTION=$1
BRANCH_NAME=$2

if [ -z "$BRANCH_NAME" ]; then
    echo "Usage: $0 <branch-name> [start|finish|update]"
    echo "  start:  Start new contribution"
    echo "  finish: Restore private workflows"
    exit 1
fi

case $ACTION in
    "start")
        echo "🔄 Synchronisation with upstream..."
        git checkout main

        git fetch upstream
        git diff upstream/main -- .github/workflows/ > private-workflows.patch
        
        echo "🗑️ Deleting private workflows before contrib..."
        git apply -R private-workflows.patch
        echo "✅ Private workflows deleted"
        
        echo "🌿 Creating branch $BRANCH_NAME..."
        git checkout -b "$BRANCH_NAME"
        
        echo "✅ Ready for contrib !"
        ;;
        
    "finish")
        echo "🔄 Return to main..."
        git checkout main
        
        echo "🔧 Restore private workflows..."
        git apply private-workflows.patch
                
        echo "✅ Ready !"
        ;;
         
    *)
        echo "Action inconnue: $ACTION"
        echo "Utilisez: start or finish"
        ;;
esac