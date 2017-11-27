# Enable strict mode in debug mode
[[ "$DEBUG" ]] && set -o nounset -o errexit -o pipefail
