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

if [[ "$ENV" == "prod" ]]; then
  API_BASE_URL="https://hodi.qnex.io"
else
  API_BASE_URL="https://hodi-test.qnex.io"
fi

echo "Building $ENV $FORMAT..."
echo "API base URL: $API_BASE_URL"

if [[ "$FORMAT" == "apk" ]]; then
  flutter build apk --split-per-abi \
    --obfuscate \
    --split-debug-info=build/debug-info \
    --dart-define=ENV="$ENV" \
    --dart-define=API_BASE_URL="$API_BASE_URL"
else
  flutter build appbundle \
    --obfuscate \
    --split-debug-info=build/debug-info \
    --dart-define=ENV="$ENV" \
    --dart-define=API_BASE_URL="$API_BASE_URL"
fi

echo ""
echo "Build complete ($ENV $FORMAT)"
echo ""
echo "NOTE: Archive build/debug-info/ after each release — those symbols are needed to decode obfuscated stack traces from crash reports."
