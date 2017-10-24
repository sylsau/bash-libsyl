# is it werking? ($0 ?)
fn_cdToScriptDir() {
    cd "` dirname "$0" `" || fn_err "can't 'cd' to script dir" $ERR_WRONG_WORKING_DIR
}
