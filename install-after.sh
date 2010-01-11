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

        dir=$root/etc/profile.d

        Cmd install -m 755 -d $dir
        Cmd install -m 755 CYGWIN-PATCHES/wcd.sh $dir
        Cmd install -m 755 CYGWIN-PATCHES/wcd.csh $dir

        # Change manual section to 7 (library)

	mandir=$root/usr/share/man/man1

	echo ">> Change manpage content: section 1 to 7 (library)"

        Cmd mv $mandir/wcd.1 $mandir/wcd.7

        Cmd sed --in-place \
                -e 's/TH wcd 1/TH wcd 7/' \
                $mandir/wcd.7

	echo ">> Change dir structure: section 1 to 7 (library)"
	Cmd mv $root/usr/share/man/man1 $root/usr/share/man/man7

    fi
}

Main "$@"

# End of file
