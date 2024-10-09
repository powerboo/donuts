#!/bin/bash
export PATH="$HOME/development/flutter/bin:$PATH"
export PATH="$HOME/development/flutter/bin/cache/dart-sdk/bin:$PATH"

# Dartのパスを明示的に指定
DART_SDK="$HOME/development/flutter/bin/cache/dart-sdk"
DART_BIN="$DART_SDK/bin/dart"

# build_runnerを実行
$DART_BIN run build_runner build --delete-conflicting-outputs
