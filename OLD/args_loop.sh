# Parse arguments
while [[ $# -ge 1 ]]; do
	case "$1" in
		"{+Condition1+}")
			{-Command-}
			;;
		"{+Condition2+}")
			{-Command-}
			;;
		*)
			{-Command-}
			;;
	esac	# --- end of case ---
	# Delete $1
	shift
done
