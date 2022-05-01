#!/usr/bin/env bash
#######################################
# X_APP_INFO_X
#
# Author: X_AUTHOR_ALIAS_X (X_AUTHOR_GIT_URL_X)
# License: GPL-3.0-or-later (https://www.gnu.org/licenses/gpl-3.0.txt)
# Repository: X_PROJECT_GIT_URL_X
# Version: X_APP_VERSION_X
#######################################

source "${BASH_SOURCE[0]%/*}/bashlib64.bash" || { echo "Error: unable to load bashlib64" && exit 1; }
# Alternative when the lib path is fixed # source "${X_PATH_TO_LIB_X}/bashlib64.bash" || exit 1

#
# Globals
#
# Template # Use this section to declare global variables only. Settings are done in the function X_APP_NAMESPACE_X_setup_globals

export X_APP_NAMESPACE_X_X_EXPORT_RO_X
export X_APP_NAMESPACE_X_X_EXPORT_X

#
# Functions
#

function X_APP_NAMESPACE_X_X_FUNCTION_COMMAND1_X() {

  local option="$1"
  local flag="$2"
  local -i status=1

  :
  status=$?

  return $status

}

function X_APP_NAMESPACE_X_X_FUNCTION_COMMAND2_X() {

  local -i status=1

  :
  status=$?

  return $status

}

# Template # Use this function to set global values only.
function X_APP_NAMESPACE_X_setup_globals() {
  readonly X_APP_NAMESPACE_X_X_EXPORT_RO_X=''
  X_APP_NAMESPACE_X_X_EXPORT_X=''
}

# Template # Use this function for global requirements only.
function X_APP_NAMESPACE_X_check_requirements() {

  [[ -z "$X_APP_NAMESPACE_X_command" ]] && X_APP_NAMESPACE_X_help && exit 1
  #bl64_check_command '' || return 1
  #bl64_check_file '' || return 1
  return 0

}

function X_APP_NAMESPACE_X_help() {

  bl64_msg_show_usage \
    '-x|-w [-y X_OPT1_X] [-z] [-h]' \
    'X_APP_INFO_X' \
    '
    -x         :
    -w         :
    ' '
    -z         :
    -h         : Show help
    ' '
    -y X_OPT1_X:
    '

}

#
# Main
#

declare -i X_APP_NAMESPACE_X_status=1
declare X_APP_NAMESPACE_X_option=''
declare X_APP_NAMESPACE_X_command=''
declare X_APP_NAMESPACE_X_command_tag=''
declare X_APP_NAMESPACE_X_X_OPTION_X=''
declare X_APP_NAMESPACE_X_X_FLAG_X='0'

X_APP_NAMESPACE_X_setup_globals
(($# == 0)) && X_APP_NAMESPACE_X_help && exit 1
while getopts ':xwy:zh' X_APP_NAMESPACE_X_option; do
  case "$X_APP_NAMESPACE_X_option" in
  x)
    X_APP_NAMESPACE_X_command='X_APP_NAMESPACE_X_X_FUNCTION_COMMAND1_X'
    X_APP_NAMESPACE_X_command_tag='X_APP_NAMESPACE_X_X_FUNCTION_COMMAND1_TAG_X'
    ;;
  w)
    X_APP_NAMESPACE_X_command='X_APP_NAMESPACE_X_X_FUNCTION_COMMAND2_X'
    X_APP_NAMESPACE_X_command_tag='X_APP_NAMESPACE_X_X_FUNCTION_COMMAND2_TAG_X'
    ;;
  y) X_APP_NAMESPACE_X_X_OPTION_X="$OPTARG" ;;
  z) X_APP_NAMESPACE_X_X_FLAG_X='1' ;;
  h | \? | *) X_APP_NAMESPACE_X_help && exit 1 ;;
  esac
done
X_APP_NAMESPACE_X_check_requirements || exit 1

bl64_msg_show_batch_start "$X_APP_NAMESPACE_X_command_tag"
case "$X_APP_NAMESPACE_X_command" in
'X_APP_NAMESPACE_X_X_FUNCTION_COMMAND1_X') "$X_APP_NAMESPACE_X_command" "$X_APP_NAMESPACE_X_X_FLAG_X" "$X_APP_NAMESPACE_X_X_OPTION_X" ;;
'X_APP_NAMESPACE_X_X_FUNCTION_COMMAND2_X') "$X_APP_NAMESPACE_X_command" ;;
*) bl64_check_show_undefined "$X_APP_NAMESPACE_X_command" ;;
esac
X_APP_NAMESPACE_X_status=$?

bl64_msg_show_batch_finish $X_APP_NAMESPACE_X_status "$X_APP_NAMESPACE_X_command_tag"
exit $X_APP_NAMESPACE_X_status
