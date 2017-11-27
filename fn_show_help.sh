# Print help
fn_show_help() {
    cat << EOF
$SCRIPT_NAME {-Version-}
    {-DescriptionShort-}

USAGE
    $SCRIPT_NAME {-ArgumentsList-}

OPTIONS
    {+flag+} {-ARG-}        {-Description-}

EXAMPLE
    $ ./$SCRIPT_NAME {-ExampleArgs-}
        {-ExplanationExample-}

AUTHOR
    Written by Sylvain Saubier (<http://SystemicResponse.com>)

REPORTING BUGS
    Mail at: <feedback@systemicresponse.com>
EOF
}
