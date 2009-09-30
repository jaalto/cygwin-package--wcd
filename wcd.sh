#
#  Copyright (C) 2004-2009 Jari Aalto; Licensed under GPL v2 or later
#
#  Define a shell alias for wcd. wcd(1) cannot itself change
#  directories, so it must be done in shell script.
#
#  This file should be source's from ~/.bashrc placed in
#  /etc/profile.d/

xxtmp=/usr/lib/wcd/wcd

if [ -x "$xxtmp" ] && [ "$HOME" ] && [ -d "$HOME" ]
then

    wcd ()
    {
	[ -d "$HOME/.wcd/bin" ] || mkdir -p "$HOME/.wcd/bin"

	go="$HOME/.wcd/bin/wcd.go"
	rm -f "$go" 2> /dev/null

	/usr/lib/wcd/wcd "$@"

	[ -f "$go" ] && . "$go"

	unset go
    }

fi

unset xxtmp

# End of file
