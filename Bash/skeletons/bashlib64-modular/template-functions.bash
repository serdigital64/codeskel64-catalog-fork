#
# Functions
#

function X_APP_NAMESPACE_X_X_FUNCTION_COMMAND1_X() {
  local option="$1"
  local flag="$2"
  local -i status=1

  # Template # bl64_check_parameter 'option' || return 1
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
function X_APP_NAMESPACE_X_initialize() {
  local verbose="$1"
  local debug="$2"

  [[ -z "$X_APP_NAMESPACE_X_command" ]] && X_APP_NAMESPACE_X_help && return 1
  bl64_dbg_set_level "$debug" &&
    bl64_msg_set_level "$verbose" ||
    return $?

  # Template # bl64_check_command '' || return 1
  # Template # bl64_check_file '' || return 1

  return 0
}

function X_APP_NAMESPACE_X_help() {
  bl64_msg_show_usage \
    '-x|-w [-y X_OPT1_X] [-z] [-V Verbose] [-D Debug] [-h]' \
    'X_APP_INFO_X' \
    '
    -x         :
    -w         :
    ' '
    -z         :
    -h         : Show help
    ' '
    -y X_OPT1_X:
    -V Verbose : Set verbosity level. Format: one of BL64_MSG_VERBOSE_*
    -D Debug   : Enable debugging mode. Format: one of BL64_DBG_TARGET_*
    '
}
