# template for temp dir name (string), optional: set TMP_DIR (string)
fn_createTmpDir() {
    TMP_DIR=${TMP_DIR:-/tmp}                          # Defaults to /tmp if unset 
    m_checkDir "$TMP_DIR" || fn_err "$TMP_DIR is not a directory or is weird" $ERR_WRONG_TMP_DIR

    # Make full path to actual temp dir
    DIR_TMP="${TMP_DIR}/${1}"

    #-------------------------------------------------------------------------------
    # Creates a particular temporary directory inside $TMP_DIR.
    #-------------------------------------------------------------------------------
    DIR_TMP="$(mktemp -d "$DIR_TMP")" || fn_err "ERROR creating a temporary file" $ERR_WRONG_TMP_DIR

    #-------------------------------------------------------------------------------
    # When the program exits, it tries to remove the temporary folder.
    # This code is executed even if the process receives a signal 1,2,3 or 15.
    #-------------------------------------------------------------------------------
    trap '[ "$DIR_TMP" ] && rm --recursive --force --verbose "$DIR_TMP"' 0

    #touch $TEMPORARY_DIR/tempfile                   # new tempfile inside folder
    DIR_TMP_CREATED=1
}
