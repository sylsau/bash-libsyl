#!/usr/bin/env bash - 
#===============================================================================
#  DESCRIPTION: Library of utilitarian variables and functions
# 		Functions are self-contained and **exit on error**.
#       AUTHOR: Sylvain S. (ResponSyS), mail@sylsau.com
#      CREATED: 04/09/2018 08:30:10 PM
#===============================================================================

[[ $DEBUG ]] && set -o nounset -o xtrace
set -o pipefail -o errexit -o errtrace
trap 'syl_exit_err "at ${FUNCNAME:-(top level)}:$LINENO"' ERR

readonly SCRIPT_NAME="${0##*/}"

# Format characters
readonly FMT_BOLD='\e[1m'
readonly FMT_UNDERL='\e[4m'
readonly FMT_OFF='\e[0m'
# Error codes
readonly ERR_WRONG_ARG=2
readonly ERR_NO_FILE=127
# Return value
RET=
# Temporary dir
readonly TMP_DIR="/tmp"

# Test if a file exists (dir or not)
# $1: path to file
syl_need_file() {
	[[ -e "$1" ]] || syl_exit_err "need '$1' (file not found)" $ERR_NO_FILE
}

# Test if a dir exists
# $1: path to dir
syl_need_dir() {
	[[ -d "$1" ]] || syl_exit_err "need '$1' (directory not found)" $ERR_NO_FILE
}

# Test if a command exists
# $1: command
syl_need_cmd() {
	command -v "$1" >/dev/null 2>&1 || {
        syl_exit_err "need '$1' (command not found)" $ERR_NO_FILE ; 
    }
}

# $1: message
syl_say() {
	echo -e "$SCRIPT_NAME: $1"
	#echo -e "$1"
}

# $1: debug message
syl_say_debug() {
	[[ ! "$DEBUG" ]] || echo -e "[DEBUG] $1"
}

# $1: error message
syl_say_err() {
	syl_say "${FMT_BOLD}ERROR${FMT_OFF}: $1" >&2
}

# Exit with message and provided error code
# $1: error message, $2: return code
syl_exit_err() {
	syl_say "${FMT_BOLD}ERROR${FMT_OFF}: $1" >&2
	exit $2
}

# Cd to script directory
syl_cd_workdir() {
	cd "$( dirname "$0" )" || syl_exit_err "Can't 'cd' into '$( dirname "$0" )'" $ERR_NO_FILE
	syl_say "cd '$(pwd)'"
}

# Create tmp file
# $1: prefix for tmp file, $2: suffix (opt)
syl_mktemp() {
	[[ $1 ]] || syl_exit_err "${FUNCNAME[0]}: please specify a prefix for temporary file name" $ERR_WRONG_ARG
	readonly local PATT="$1-$USER-XXXX$2"
	RET="$( mktemp "${TMP_DIR}/$PATT" )" || syl_exit_err "can't create temporary file '$PATT' in '$TMP_DIR'" $ERR_NO_FILE
}

# Create tmp dir
# $1: prefix for tmp dir
syl_mktemp_dir() {
	[[ $1 ]] || syl_exit_err "${FUNCNAME[0]}: please specify a prefix for temporary directory name" $ERR_WRONG_ARG
	readonly local PATT="$1-$USER-XXXX"
	RET="$( mktemp -d "${TMP_DIR}/$PATT" )" || syl_exit_err "can't create temporary directory '${PATT}/' in '$TMP_DIR'" $ERR_NO_FILE
}
