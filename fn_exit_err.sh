# Exit with message and provided error code
# error message (string), return code (int)
fn_exit_err() {
    m_say "${FMT_BOLD}ERROR${FMT_OFF}: $1" >&2
    exit $2
}
