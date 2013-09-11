open_or_switch_to
=================

A little script to switch between multiple instances of the same program

## What it does ##
This little script does does 3 things:
 * opens a <program> instance if it isn't already open
 * focus <program> instance if only 1 instance is active
 * switches between <program> instances, if multiple are open

## Dependencies ##
 * wmctrl
 * xprop

## How To Use ##

Usage: `open_or_switch_to.sh [Program name] [Optional: Program wm-class]`

Example: `~/Scripts/open_or_switch_to.sh geany`

## How it is meant to be ##

Give this script + program_name a shortcut

Openbox example:

```
<keybind key="W-w">
	<action name="Execute">
		<command>
	~/Scripts/open_or_switch_to.sh firefox Firefox</command>
	</action>
</keybind>
```
now press Super+w to switch between all open Firefox instances
	
please Note: 
 * for most programs the first argument is enough, 
 * but some programs, like Firefox, need the second argument as well
	
## FAQ ##
 1. don’t know the program name or wm-class of your application ?
  * execute "xprop" in terminal
  * click on the application
  * look for _OB_APP_CLASS, _OB_APP_NAME, WM_CLASS, WM_NAME in terminal output

## Authors ##
 * David Siewert (siewert /dot msc /at gmail /dot com)
 
## License ##

Copyright © 2013 David Siewert

FourTerm is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.
