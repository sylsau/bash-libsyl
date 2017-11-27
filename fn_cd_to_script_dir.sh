# is it werking? ($0 ?)
fn_cd_to_script_dir() {
    cd "` dirname "$0" `" || fn_exit_err "can't 'cd' to script dir" $ERR_WRONG_WORKING_DIR
}
