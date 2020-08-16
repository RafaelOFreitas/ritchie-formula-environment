#!/bin/sh

# shellcheck source=/dev/null
. "$(dirname "$0")"/formula/linux.sh --source-only

SYSTEM=$(uname -s)

runFormula() {
  # todo: Detect different versions of Linux
  case "$SYSTEM" in
  Linux*)
    runConfigLinux $SAMPLE_LIST $GIT_NAME $GIT_EMAIL
    ;;
  Darwin*)
    config "MacOS"
    # todo: add MacOS
    ;;
  CYGWIN*)
    config "CYGWIN"
    # todo: add CYGWIN
    ;;
  *)
    printf "Sistema operacional desconhecido.\n"
    ;;
  esac
}
