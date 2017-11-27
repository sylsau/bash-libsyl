# command to test (string)
fn_needCmd() {
	command -v "$1" > /dev/null 2>&1
	[ $? -eq 0 ] ||	fn_err "need '$1' (command not found)" {+ReturnCode+}
}
