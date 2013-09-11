#!/bin/bash
: <<'END'
Copyright © 2013 David Siewert

FourTerm is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.
END


function usage { 
	echo "Usage: $0 [Program name] [Optional: Program class]"
	exit 1
}


if [ $# -eq 0 ] ; then
	usage
elif [ $# -eq 1 ] ; then
	program_cmd="$1"
	program_class=${program_cmd,}
elif [ $# -eq 2 ] ; then
	program_cmd="$1"
	program_class="$2"
elif [ $# -gt 2 ] ; then
	usage
fi


all_programs=$(wmctrl -xl | grep $program_class | awk '{print $1}' )

if [ "$all_programs" == "" ]; then
	#program not alive -> start new instance
	
	# start silent
	$program_cmd  > /dev/null 2>&1 &
	# or start normal:
	#$program_cmd &
	
	exit 0
fi

actual_program_id=$(xprop -root | grep '^_NET_ACTIVE_W' | sed s/'_NET_ACTIVE_WINDOW(WINDOW): window id # 0x'//g)

if [ "$(echo $all_programs | grep $actual_program_id)" == "" ]; then
	#program alive but not in focus -> switch to any program instance
	wmctrl -x -a $program_class
	
else #program is alive and in focus -> switch to next program instance
	
	next_program_id=$(echo $all_programs | sed s/.*$actual_program_id// | awk '{print $1}')
	
	if [ "$next_program_id" == "" ] ; then
		next_program_id=$(echo $all_programs | cut -f1 -d" ")
	fi
	
	wmctrl -i -a $next_program_id
	wmctrl -i -a $next_program_id
	
fi
