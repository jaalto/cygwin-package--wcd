#!/bin/bash
#
# install-after.sh -- Custom installation
#
# The script will receive one argument: relative path to
# installation root directory. Script is called like:
#
#    $ ./install-after.sh .inst/
#
# This script is used to things after the [install] command.

Cmd()
{
    echo "$*"
    "$@"
}

Main()
{
    root=${1:-".inst"}

    if [ ! -z "$root"  ] && [ -d "$root" ]; then

        dir=$root/etc/profile.d

        Cmd install -m 755 -d $dir
        Cmd install -m 755 CYGWIN-PATCHES/wcd.sh $dir

    fi
}

Main "$@"

# End of file
