# arg value (string), error message (string), return code (int)
m_checkEmptyArg() {
    test -z "$1"
}
