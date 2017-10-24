fn_help() {
    cat << EOF
$PROGRAM_NAME {-Version-}
{-DescriptionShort-}

USAGE
    $PROGRAM_NAME {-ArgumentsList-}

{-OPTIONS-}
    {-Options-}

EXAMPLE
    $ $PROGRAM_NAME {-ExampleArgs-}
        {-ExplanationExample-}

AUTHOR
    Written by Sylvain Saubier (<http://SystemicResponse.com>)

REPORTING BUGS
    Mail at: <feedback@systemicresponse.com>
EOF
}
