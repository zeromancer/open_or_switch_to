open_or_switch_to
=================

A little script to switch between multiple instances of the same program

## Description ##
This little script does does following 3 things:
 * opens a <program> instance if it isn't already open
 * focus <program> instance if only 1 instance is active
 * switches between <program> instances, if multiple are open

## Dependencies ##
 * wmctrl
 * xprop

## How To Use ##
	Usage: open_or_switch_to.sh [Program name] [Optional: Program wm-class]
  Example: `open_or_switch_to.sh geany`

### How it's meant to be ##
	Give this script + <program> a shortcut

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
**don’t know the program name of your application ?**
 * execute "xprop" in terminal
 * click on the application
 * look for _OB_APP_CLASS,_OB_APP_NAME,WM_CLASS,WM_NAME in terminal output
	
## License ##
	GPL v3
