fn_createTmpDir() {
    # Check if $TMP_DIR exists
    m_checkDir "$TMP_DIR" || fn_err "$TMP_DIR is not a directory or is weird" $ERR_WRONG_TMP_DIR

    #-------------------------------------------------------------------------------
    # Creates a particular temporary directory inside $TMPDIR.
    #-------------------------------------------------------------------------------
    DIR_TMP=$(mktemp -d "$DIR_TMP_TEMPL") || \
        fn_err "ERROR creating a temporary file" $ERR_WRONG_TMP_DIR

    #-------------------------------------------------------------------------------
    # When the program exits, it tries to remove the temporary folder.
    # This code is executed even if the process receives a signal 1,2,3 or 15.
    #-------------------------------------------------------------------------------
    trap '[ "$DIR_TMP" ] && rm --recursive --force --verbose "$DIR_TMP"' 0

    #touch $TEMPORARY_DIR/tempfile                   # new tempfile inside folder
    DIR_TMP_CREATED=1
}
