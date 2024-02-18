# Snippet: install-custom-package-4.0.0

# X_GLOBALS_PLACEHOLDER_X
export INST64_X_APP_NAME_CAPS_X_PLATFORM="${INST64_X_APP_NAME_CAPS_X_PLATFORM:-X_APP_PLATFORM_X}"
export INST64_X_APP_NAME_CAPS_X_SOURCE="${INST64_X_APP_NAME_CAPS_X_SOURCE:-X_APP_REPO_X}"
export INST64_X_APP_NAME_CAPS_X_TARGET="${INST64_X_APP_NAME_CAPS_X_TARGET:-${INST64_OPT_ROOT}/X_APP_NAME_X}"
export INST64_X_APP_NAME_CAPS_X_VERSION="${INST64_X_APP_NAME_CAPS_X_VERSION:-X_APP_VERSION_X}"
# Install system wide? Requires root privilege
export INST64_X_APP_NAME_CAPS_X_SYSTEM_WIDE="${INST64_X_APP_NAME_CAPS_X_SYSTEM_WIDE:-YES}"
# Installation method
export INST64_X_APP_NAME_CAPS_X_METHOD="${INST64_X_APP_NAME_CAPS_X_METHOD:-CUSTOM}"

export INST64_X_APP_NAME_CAPS_X_PACKAGE_URL=''
export INST64_X_APP_NAME_CAPS_X_INSTALLER=''

# X_STAND_ALONE_FUNCTIONS_X #
function inst64_X_APP_NAME_X_install_custom_package() {
  bl64_dbg_app_show_function
  local work_path=''
  local app_target_mode='0755'
  local app_target_owner='root'
  local app_cli_source="${INST64_X_APP_NAME_CAPS_X_CLI_NAME}"

  if bl64_lib_flag_is_enabled "$INST64_X_APP_NAME_CAPS_X_SYSTEM_WIDE"; then
    INST64_X_APP_NAME_CAPS_X_CLI_PATH="${INST64_LOCAL_BIN}/${INST64_X_APP_NAME_CAPS_X_CLI_NAME}"
  else
    INST64_X_APP_NAME_CAPS_X_CLI_PATH="${INST64_X_APP_NAME_CAPS_X_TARGET}/${INST64_X_APP_NAME_CAPS_X_CLI_NAME}"
    app_target_owner="$BL64_VAR_DEFAULT"
  fi

  bl64_msg_show_task 'download application'
  work_path="$(bl64_fs_create_tmpdir)" &&
  bl64_rxtx_web_get_file \
    "${INST64_X_APP_NAME_CAPS_X_PACKAGE_URL}/${INST64_X_APP_NAME_CAPS_X_PACKAGES}" "${work_path}/${INST64_X_APP_NAME_CAPS_X_PACKAGES}" &&
# example #    bl64_arc_open_tar "${work_path}/${INST64_X_APP_NAME_CAPS_X_PACKAGES}" "${work_path}" ||
# example #    bl64_arc_open_zip "${work_path}/${INST64_X_APP_NAME_CAPS_X_PACKAGES}" "${work_path}" ||
    return $?

  bl64_msg_show_task 'deploy application'
  bl64_fs_create_dir "$app_target_mode" "$app_target_owner" "$app_target_owner" "$INST64_X_APP_NAME_CAPS_X_TARGET" &&
    # delete-me # Modify the following line to match the custom installer path
    "${$INST64_X_APP_NAME_CAPS_X_TARGET}/${INST64_X_APP_NAME_CAPS_X_INSTALLER}" ||
    return $?

  bl64_msg_show_task "publish application to searchable path (${INST64_X_APP_NAME_CAPS_X_CLI_PATH})"
  bl64_fs_create_symlink \
      "${INST64_X_APP_NAME_CAPS_X_TARGET}/${app_cli_source}" "$INST64_X_APP_NAME_CAPS_X_CLI_PATH" "$BL64_VAR_ON" ||
    return $?

  bl64_msg_show_task 'cleanup temporary files'
  bl64_fs_rm_tmpdir "$work_path"
  return 0
}

# X_INSTALL_PLACEHOLDER_X
  if [[ "$INST64_X_APP_NAME_CAPS_X_METHOD" == 'CUSTOM' ]]; then
    inst64_X_APP_NAME_X_install_custom_package
  fi

# X_SELECT_PKG_PLACEHOLDER_X
  local package_prefix=''
  local package_sufix=''
  if [[ "$INST64_X_APP_NAME_CAPS_X_METHOD" == 'CUSTOM' ]]; then
    package_prefix='X_PACKAGE_PREFIX_X'
    package_sufix='X_PACKAGE_SUFIX_X'
    # delete-me # Modify the following line to properly form the package name
    INST64_X_APP_NAME_CAPS_X_PACKAGES="${package_prefix}${INST64_X_APP_NAME_CAPS_X_VERSION}${INST64_X_APP_NAME_CAPS_X_PLATFORM}${package_sufix}"
    # delete-me # Modify the following line to properly form the package url
    INST64_X_APP_NAME_CAPS_X_PACKAGE_URL="${INST64_X_APP_NAME_CAPS_X_SOURCE}/v${INST64_X_APP_NAME_CAPS_X_VERSION}"
  fi
  [[ -z "$INST64_X_APP_NAME_CAPS_X_PACKAGE_URL" ]] && bl64_msg_show_error 'unable to determine package download URL' && return 1

# X_PREPARE_PLACEHOLDER_X
  bl64_arc_setup

# X_INIT_PLACEHOLDER_X
  if bl64_lib_flag_is_enabled "$INST64_X_APP_NAME_CAPS_X_SYSTEM_WIDE"; then
    bl64_check_privilege_root ||
      return $?
  fi
  bl64_os_check_version \
    "${X_BL64_OS_ID_X}" &&
    bl64_fmt_check_value_in_list 'invalid installation method for the parameter INST64_X_APP_NAME_CAPS_X_METHOD' \
      "$INST64_X_APP_NAME_CAPS_X_METHOD" \
      'CUSTOM'