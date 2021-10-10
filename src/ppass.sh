store="$HOME/.password-store"

notify ()
{
	notify-send -i password "Pass" "$1"
}

if [ $# -lt 2 ]
then
	notify "Use: ppass <account> <u/p> OR ppass add <account>"
	exit 1
fi

if ! ([ "$2" = "p" ] && [ "$2" = "u" ]) && [ "$1" = "add" ]
then
	pass generate -nc $2 16
	notify "$2: generated and copied for 45 s"
	exit 0
else
	if [ -e "$store/$1" ]
	then
		filename=$(ls $store/$1)
		username=${filename%.*}
	else
		notify "No such account name"
		exit 2
	fi
fi

if [ "$2" = "u" ]
then
	echo $username | xclip -selection clipboard
	notify "$1: username copied for 45 s"
else
	pass -c $1/$username
	notify "$1: password copied for 45 s"
fi
