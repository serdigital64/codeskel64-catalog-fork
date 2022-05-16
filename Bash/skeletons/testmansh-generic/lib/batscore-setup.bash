#
# Initialize bats-core test
#
# * Source this file from the first line of the setup() function in the test-case
#

. "${X_APP_NAMESPACE_X_BATS_HELPER_SUPPORT}/load.bash"
. "${X_APP_NAMESPACE_X_BATS_HELPER_ASSERT}/load.bash"
. "${X_APP_NAMESPACE_X_BATS_HELPER_FILE}/load.bash"

# Do not overwrite signals already set by bats-core (err,exit)

# Sets used by bats-core. Do not overwrite
set -o 'errexit'
set +o 'nounset'

# Do not set/unset: 'keyword', 'noexec'

#
# Application specific shared setup
#
