#  Define alias wcd()
#
#  wcd(1) cannot itself change directories, so it must be done
#  in shell script.
#
#  This file should be source's from ~/.bashrc placed in 
#  /etc/profile.d/

xxtmp=/usr/bin/wcd 

if [ -x $xxtmp ] && [ ! -z "$HOME" ] && [ -d "$HOME" ]
then

    dir=$HOME/bin

    if [ ! -d $dir ]; then
	mkdir -p $dir || return
    fi

    unset dir


    wcd()
    {
        local go=$HOME/bin/wcd.go
	rm -f $go 2> /dev/null

	/usr/bin/wcd $*

	[ -f $go ] && source $go
    }

fi

unset xxtmp

# End of file
