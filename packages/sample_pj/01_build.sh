#!/bin/bash
dart run build_runner build --delete-conflicting-outputs

if [ $? -eq 0 ]; then
  dart run annotation_indexer
else
  echo "build_runner failed"
  exit 1
fi
