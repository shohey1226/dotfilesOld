# .bashrc
# function
#
#-----------------------------------------------
# for those who can't remember the file place
#-----------------------------------------------
dest_type()
{
        key=$1
        check_host=`ypmatch $key hosts 2> /dev/null`
        check_passwd=`ypmatch $key passwd 2> /dev/null`
        if [ "${check_host}X" != "X" ]; then
                echo host
        elif [ "${check_passwd}X" != "X" ]; then
                echo user
        else
                echo dir
        fi
}
to()
{
        mapfile="$HOME/.custom/dir_maps.txt"

        if [ ! -f $mapfile ]; then
                echo "directory map file doesn't exist"
        else

                if [ "${1}X" = "X" ]; then
                        echo "Please choose from the following 'to' destinations:"
                        echo ""
                        cat $mapfile | tr ':' '\t\t'
                else
                        key=$1
                        # the directory key takes precedence
                        line=`grep "^${key}:" $mapfile`
                        if [ "${line}X" = "X" ]; then
                                type=`dest_type $key`
                        else
                                type="dir"
                        fi

                        case $type in
                        'host')
                                echo "ssh $key"
                                ssh $key
                                ;;
                        'user')
                                echo "~$key"
                                $_user_dir=`/bin/echo ~$key`
                                cd $_user_dir
                                ;;
                        'dir')
                                dest=`echo $line | awk -F':' '{print $2}'`
                                echo "$dest"
                                cd $dest
                                ;;
                        *)
                                echo "Unknown key: \"$key\""
                                ;;
                        esac

                fi

        fi
}

# For tmux
case "$TERM" in
    screen*)
        PROMPT_COMMAND="printf '\033k$(pwd)\033\\';"${PROMPT_COMMAND}
        ;;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export LANG=en_US.utf8
export PS1='${USER}@${HOSTNAME}:${PWD}> '
alias rm='rm -i'
alias psg='ps -ef | grep -v grep | grep '

# Perlbrew
source /home/kamesho/perl5/perlbrew/etc/bashrc

