#!/usr/bin/env bash
#
# Script name: Bash Script Template
# Author: Michał Kątnik
#
# Description:
#   A simple reusable Bash script template that follows
#   'Unofficial Bash Strict Mode' and advices from bash-hackers.org.
#
# Repository: https://github.com/rideee/bash-scripts/perfect-template


# Unofficial Bash Strict Mode settings. 
# (More info: http://redsymbol.net/articles/unofficial-bash-strict-mode/)
#
# Keep below settings to follow the strict mode rules.
set -euo pipefail
IFS=$'\n\t'

# Declaration of script-dependent constants.
readonly SCRIPT_RELATIVE_PATH=$0
readonly SCRIPT_PATH=$(/usr/bin/env readlink -f $SCRIPT_RELATIVE_PATH)
readonly SCRIPT_DIR=$(/usr/bin/env dirname $SCRIPT_PATH)

readonly SCRIPT_FULL_NAME=$(/usr/bin/env basename $0)
readonly SCRIPT_NAME="${SCRIPT_FULL_NAME%.*}"
[[ "$SCRIPT_NAME" != "${SCRIPT_FULL_NAME##*.}" ]] &&
  readonly SCRIPT_EXTENSION="${SCRIPT_FULL_NAME##*.}" ||
  readonly SCRIPT_EXTENSION=""

readonly SCRIPT_DEFAULT_TIME_FORMAT="+%Y-%m-%d %H:%M:%S"
readonly SCRIPT_EXECUTION_TIME=$(/usr/bin/env date $SCRIPT_DEFAULT_TIME_FORMAT)
readonly SCRIPT_EXECUTING_USER=$(/usr/bin/env whoami)


# Main function. 
function main() {
  
  # -- Put your code here --
  #
  # The main function will be executed at the end of the file and all script
  # arguments will be passed to this function.
  #
  # Try to avoid writing code outside functions to keep your code simple, clean
  # maintainable and readable.
 
  # -- Code example below --

  # TIP: Use "local" variables to keep visibility scope inside the function.
  local msg="[${SCRIPT_EXECUTION_TIME}] Script started by"
  msg="${msg} ${SCRIPT_EXECUTING_USER}."

  echo -e "\nHello ${SCRIPT_NAME}!\n"
  eval printf '=%.0s' {1..${#msg}}
  echo -e "\n$msg"
  eval printf '=%.0s' {1..${#msg}}
  echo

  help

} # -- end main --


# Print help message on stdout.
function help() {
  echo -e "
NAME
    ${SCRIPT_NAME} - Bash Script Template

AUTHOR
    Michał Kątnik (github.com/rideee)

DESCRIPTION
    A simple reusable Bash script template that follows
    'Unofficial Bash Strict Mode' and advices from bash-hackers.org.
  "
}


# Execute main function. Keep below line at the end of the file.
main "$@"
