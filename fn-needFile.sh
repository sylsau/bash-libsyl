# path to file to test (string)
fn_needFile() {
	[ -f "$1" ] || fn_err "need '$1' (file not found)" {+ReturnCode+}
}
