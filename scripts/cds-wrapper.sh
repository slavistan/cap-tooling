#!/usr/bin/env zsh

# debug
# set -- watch -d --pre="rm ./sqlite.db" --pre="cmd3 arg1 arg2"

FILE=${0}

usage() {
  echo "Lightweight wrapper around the cds command-line. Usage:

  $FILE watch [ -d ] [ --pre=<COMMAND> ]
  $FILE watch [ -l ]"

  exit
}

# return if a flag is set
isflagset() {
  echo "$FLAGS" | grep -qF "$1"
}

# returns watchlist
watch/watchlist() {
  find '.' -type f                \
    -not -path '*/\.*'            \
    -not -path '*/node_modules/*' \
    -not -name '*.db'
}

# parse cli options for watch subcommand
watch/parseopt() {
  shift
  local -a opts
  local -a precmds
  zparseopts -a opts -- l d -pre+:=precmds

  # concatenate all flags to a single string FLAGS
  FLAGS=$(echo "$opts" | tr -d ' -')
  echo "FLAGS=$FLAGS"

  # store precmds as array PRECMDS
  PRECMDS=()
  for ((ii = 2; ii <= ${#precmds}; ii += 2)); do
    PRECMDS+=$(echo $precmds[$ii] | sed 's/^=//g')
  done
}

case "$1" in
  help|-h|--help)
    usage ;;
  watch)
    watch/parseopt "$@"

    # -l | --watchlist: print watchlist end exit
    isflagset l && watch/watchlist && exit

    # -d | --pre=<cmd>: build command string and run
    entrcmd="cds watch"
    isflagset d && entrcmd="cds deploy && $entrcmd"
    for ((ii = ${#PRECMDS}; ii >= 1; ii -= 1)); do
      entrcmd="$PRECMDS[$ii] && $entrcmd"
    done
    watch/watchlist | entr -rs "$entrcmd"
  ;;
  *)
    usage
    ;;
esac
