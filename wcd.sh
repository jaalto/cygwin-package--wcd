#
#  Copyright (C) 2004-2011 Jari Aalto; Licensed under GPL v2 or later
#
#  Define a shell alias for wcd(1), which itself change
#  directories, so it must be done in a shell alias.
#
#  This file is in /etc/profile.d/ and it should be sourced from
#  a shell startup file: ~/.<shell>rc

if [ -x "/usr/lib/wcd/wcd" ] && [ "$HOME" ] && [ -d "$HOME" ]
then

    wcd ()
    {
	if [ -d "$WCDHOME" ]; then
	    # Custom
	    go="$WCDHOME/bin/wcd.go"

	    rm -f "$go" 2> /dev/null

	    /usr/lib/wcd/wcd "$@"

	    [ -f "$go" ] && . "$go"

	    unset go

	elif [ -d "$HOME/.treedata.wcd" ]; then
	    # Old user
	    go="$HOME/wcd.go"

	    rm -f "$go" 2> /dev/null

	    /usr/lib/wcd/wcd "$@"

	    [ -f "$go" ] && . "$go"

	    unset go
	else
	    # New installation. Use clean, separate directory

	    [ -d "$HOME/.wcd/bin" ] || mkdir -p "$HOME/.wcd/bin"

	    go="$HOME/.wcd/bin/wcd.go"

	    rm -f "$go" 2> /dev/null

	    /usr/lib/wcd/wcd -G "$HOME/.wcd" "$@"

	    [ -f "$go" ] && . "$go"

	    unset go
	fi
    }

fi

# End of file
