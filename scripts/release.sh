#!/bin/bash
# Release script for LibreFang

set -e

# Get version from command line or use timestamp
if [ -n "$1" ]; then
    TAG="v$1"
else
    TAG="v0.3.48"
fi

echo "Creating release tag: $TAG"

# Delete local and remote tag if exists
git tag -d $TAG 2>/dev/null || true
git push origin :refs/tags/$TAG 2>/dev/null || true

# Create and push tag
git tag $TAG
git push origin $TAG

echo "Release $TAG triggered! Check https://github.com/librefang/librefang/actions"
