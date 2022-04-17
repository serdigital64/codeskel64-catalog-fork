setup() {
  . "${X_APP_NAMESPACE_X_BATS_HELPER}/bats-support/load.bash"
  . "${X_APP_NAMESPACE_X_BATS_HELPER}/bats-assert/load.bash"
  . "${X_APP_NAMESPACE_X_BATS_HELPER}/bats-file/load.bash"
}

@test "hello_world: basic test" {
  run true
  assert_success
}
