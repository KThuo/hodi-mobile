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
  flutter build apk --split-per-abi --dart-define=ENV="$ENV"
else
  flutter build appbundle --dart-define=ENV="$ENV"
fi

echo ""
echo "Build complete ($ENV $FORMAT)"
