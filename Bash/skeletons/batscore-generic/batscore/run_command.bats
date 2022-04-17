setup() {
  . "X_BATS_HELPER_PATH_X/bats-support/load.bash"
  . "X_BATS_HELPER_PATH_X/bats-assert/load.bash"
  . "X_BATS_HELPER_PATH_X/bats-file/load.bash"
}

@test "X_TEST_NAME_X: X_TEST_DESCRIPTION_X" {
  # Force container run
  # if [[ ! -f '/run/.containerenv' ]]; then
  #   skip 'this case can only be tested inside a container'
  # fi

  set +u # to avoid IFS missing error in run function
  run X_TEST_TARGET_FUNCTION_X

  # assert_success
  # assert_failure
  # assert_output --partial "X_EXPECTED_PARTIAL_OUTPUT_X"
  # assert_output "X_EXPECTED_OUTPUT_X"
}

teardown() {
  :
}
