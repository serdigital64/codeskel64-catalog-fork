setup() {
  . "$X_APP_NAMESPACE_X_TEST_BATSCORE_SETUP"
}

@test "hello_world: basic test" {
  run true
  assert_success
}
