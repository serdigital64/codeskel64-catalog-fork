#
# Initialize bats-core test
#
# * Source this file from the first line of the setup() function in the test-case
#

test_batscore_root='X_BATS_HELPER_PATH_X'
. "${test_batscore_root}/assert/load.bash"
. "${test_batscore_root}/file/load.bash"
. "${test_batscore_root}/support/load.bash"

# Do not overwrite signals already set by bats-core
# ERR, DEBUG, EXIT

# Sets used by bats-core. Do not overwrite
set -o 'errexit'
set +o 'nounset'
# Do not set/unset: 'keyword', 'noexec'

# (Optional) Add shared settings. Available to all test-cases using this setup routine
