# command to test (string)
fn_needCmd() {
    if ! command -v "$1" > /dev/null 2>&1
    then fn_err "need '$1' (command not found)" {+ReturnCodeNoCmd+}
    fi
}
