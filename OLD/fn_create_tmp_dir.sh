# Create temporary directory
# template for dir name (string)
# optional: TMP_DIR (string)
fn_create_tmp_dir() {
	TMP_DIR=${TMP_DIR:-/tmp} 			# Defaults to /tmp if unset 
	[ -d "$TMP_DIR" ] || fn_err "$TMP_DIR is not a directory" $ERR_WRONG_TMP_DIR
	# Make full path to actual temp dir
	DIR_TMP="${TMP_DIR}/${1}.$$"
	# Creates a particular temporary directory inside $TMP_DIR.
	mkdir "$DIR_TMP" || fn_err "can't create temporary file in $DIR_TMP" $ERR_WRONG_TMP_DIR
	# On exit, removes the temporary folder
	trap '[ "$DIR_TMP" ] && rm -rf --verbose "$DIR_TMP"' EXIT
	DIR_TMP_CREATED=1
}
