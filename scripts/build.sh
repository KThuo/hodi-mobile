#!/bin/bash
set -e

ENV="${1:-test}"
FORMAT="${2:-apk}"
URL_OVERRIDE="${3:-}"

usage() {
  cat <<'USAGE'
Usage: ./scripts/build.sh [test|prod|local] [apk|appbundle] [url]

  test   https://newhodi.qnex.io
  prod   https://hodi.qnex.io
  local  a backend you are running yourself — pass the URL as the third argument,
         or leave it out for the Android emulator's view of this machine.

The third argument overrides the URL for any environment, which is what an ngrok
tunnel wants:

  ./scripts/build.sh local apk https://abc123.ngrok-free.app

## Reaching a backend on this machine

"localhost" means the handset, not this Mac, so it never works from a device.

  Android emulator   http://10.0.2.2:8089     the emulator's alias for the host
  iOS simulator      http://localhost:8089    shares the host's network stack
  A real handset     http://<this-mac>:8089   same wifi, and the firewall must allow it
  Anything, anywhere https://<tunnel>         ngrok or similar

Prefer a tunnel for a real handset. A release build has no cleartext permission in
its manifest, so Android 9 and later refuse plain http:// outright — and they refuse
it silently, as a connection that simply fails. A debug build is exempt, which is
why "it works in debug and not in release" is the usual symptom. https from a tunnel
avoids the question.
USAGE
}

if [[ "$ENV" == "-h" || "$ENV" == "--help" ]]; then usage; exit 0; fi

if [[ "$ENV" != "test" && "$ENV" != "prod" && "$ENV" != "local" ]]; then
  usage; exit 1
fi

if [[ "$FORMAT" != "apk" && "$FORMAT" != "appbundle" ]]; then
  usage; exit 1
fi

case "$ENV" in
  prod)  API_BASE_URL="https://hodi.qnex.io" ;;
  test)  API_BASE_URL="https://newhodi.qnex.io" ;;
  local) API_BASE_URL="http://10.0.2.2:8089" ;;
esac

if [[ -n "$URL_OVERRIDE" ]]; then
  API_BASE_URL="${URL_OVERRIDE%/}"   # no trailing slash: paths already start with one
fi

echo "Building $ENV $FORMAT..."
echo "API base URL: $API_BASE_URL"

if [[ "$API_BASE_URL" == http://* ]]; then
  echo
  echo "  WARNING: that is plain http. A release build cannot use it on Android 9+ —"
  echo "  the manifest grants no cleartext permission, so requests fail with no message."
  echo "  Use a debug build for this, or an https tunnel for a release one."
  echo
fi

# Obfuscation is off for a local build: the point of one is to read the stack trace.
EXTRA=(--obfuscate --split-debug-info=build/debug-info)
if [[ "$ENV" == "local" ]]; then EXTRA=(); fi

if [[ "$FORMAT" == "apk" ]]; then
  flutter build apk --split-per-abi \
    "${EXTRA[@]}" \
    --dart-define=ENV="$ENV" \
    --dart-define=API_BASE_URL="$API_BASE_URL"
else
  flutter build appbundle \
    "${EXTRA[@]}" \
    --dart-define=ENV="$ENV" \
    --dart-define=API_BASE_URL="$API_BASE_URL"
fi

echo ""
echo "Build complete ($ENV $FORMAT) against $API_BASE_URL"
echo ""
if [[ "$ENV" != "local" ]]; then
  echo "NOTE: Archive build/debug-info/ after each release — those symbols are needed to decode obfuscated stack traces from crash reports."
fi
