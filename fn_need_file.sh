# Test if a file exists
# path to file to test (string)
fn_need_file() {
	[ -f "$1" ] || fn_exit_err "need '$1' (file not found)" {+ReturnCode+}
}
