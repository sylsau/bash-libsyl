# $1 = file to test (string)
fn_needFile() {
    if ! test -f "$1" > /dev/null 2>&1
    then fn_err "need '$1' (file not found)" $ERR_NO_FILE
    fi
}
