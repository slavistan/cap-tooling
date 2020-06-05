#!/usr/bin/env zsh

# set -e

FILE=${0}

usage() {
  echo "Lightweight wrapper around the cds command-line. Usage:

  $FILE watch [ -d ] [ -e <FILE> ]
  $FILE watch -l | --watchlist"

  exit
}

# returns watchlist
watch/watchlist() {
  find '.' -type f                \
    -not -path '*/\.*'            \
    -not -path './node_modules/*' \
    -not -name '*.db'
}

case "$1" in
  help|-h|--help)
    usage ;;
  watch)

    # parse options
    shift
    local -a opts
    zparseopts -a opts -- l d
    params=$(echo "$opts" | tr -d ' -')

    if echo "$params" | grep -qF 'l'; then
      watch/watchlist
      exit
    else
      entrcmd="cds watch"
      if echo "$params" | grep -qF 'd'; then
        entrcmd="cds deploy && $entrcmd"
      fi
      watch/watchlist | entr -rs "$entrcmd"
    fi
  ;;
  *)
    usage
    ;;
esac
