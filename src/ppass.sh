#	ppass.sh - tiny shell for 'pass'
#	Copyright (C) 2021  Newpson
#	
#	This program is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	(at your option) any later version.
#	
#	This program is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#	
#	You should have received a copy of the GNU General Public License
#	along with this program.  If not, see <https://www.gnu.org/licenses/>.

notify ()
{
	notify-send -i password "Pass Shell" "$1"
}

if [ $# -lt 1 ] || [ $# -gt 2 ]
then
	notify "Syntax error. See <i>ppass(1)</i>"
	exit 1
fi

NSOD=0
store="$HOME/.password-store"
if ! filename=$(ls $store/$1); then NSOD=1; fi
primary=${filename%.*}

if [ $# -eq 1 ]
then
	if  [ $NSOD -eq 1 ]; then notify "$1: No such account"; exit 1; fi
	pass -c $1/$primary
	notify "$1: password copied for 45 s"
	exit 0
fi

case $2 in
	u)
		if [ $NSOD -eq 1 ]; then notify "$1: No such account"; exit 1; fi
		echo $primary | xclip -selection clipboard
		notify "$1: primary info copied for 45 s"
		;;
	a)
		pass generate -nc $1 16
		notify "$1: password generated and copied for 45 s"
		exit 0
		;;
	r)
		pass delete -rf $1
		;;
	*)
		notify "No such key. See ppass(1)"
		exit 3
		;;
esac
