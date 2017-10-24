# $1 = error message (string), $2 = return code (int)
fn_err() {
    m_say "${FMT_BOLD}ERROR${FMT_OFF}: $1" >&2
    exit $2
}
