#!/bin/bash
set -e

ENV="${1:-test}"
FORMAT="${2:-apk}"

if [[ "$ENV" != "test" && "$ENV" != "prod" ]]; then
  echo "Usage: ./scripts/build.sh [test|prod] [apk|appbundle]"
  exit 1
fi

if [[ "$FORMAT" != "apk" && "$FORMAT" != "appbundle" ]]; then
  echo "Usage: ./scripts/build.sh [test|prod] [apk|appbundle]"
  exit 1
fi

echo "Building $ENV $FORMAT..."

if [[ "$FORMAT" == "apk" ]]; then
  flutter build apk --split-per-abi \
    --obfuscate \
    --split-debug-info=build/debug-info \
    --dart-define=ENV="$ENV"
else
  flutter build appbundle \
    --obfuscate \
    --split-debug-info=build/debug-info \
    --dart-define=ENV="$ENV"
fi

echo ""
echo "Build complete ($ENV $FORMAT)"
echo ""
echo "NOTE: Archive build/debug-info/ after each release — those symbols are needed to decode obfuscated stack traces from crash reports."
