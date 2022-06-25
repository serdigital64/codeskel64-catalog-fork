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
