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

    if [ "$root" ] && [ -d "$root" ]; then

        # Change manual section to 7 (library)

	# find .inst -path "*man*"

	mandir=$root/usr/share/man/man1

	echo ">> Change manpage content: section 1 to 7 (library)"

        Cmd gzip -d $mandir/*.gz
        Cmd mv $mandir/wcd.1 $mandir/wcd.7

        Cmd sed --in-place \
                -e 's/TH wcd 1/TH wcd 7/' \
                $mandir/wcd.7

	echo ">> Change dir structure: section 1 to 7 (library)"
	Cmd mv $root/usr/share/man/man1 $root/usr/share/man/man7

	echo ">> rm extra doc directory"
	Cmd rm -rf .inst/usr/share/doc/wcd-*/

    fi
}

Main "$@"

# End of file
