-- xmonad configuration
-- Chih-Kang Huang
-- 05/03/2015

-- import modules
import XMonad  
import XMonad.Config.Azerty  
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import System.IO

-- Define variables
myWorkspaces= ["1: Euler","2: Lagrange","3: Poincaré","4: Kantorovich"]
myTerminal = "urxvt"
myModMask = mod1Mask -- Alt key
-- my ModMask = mod4Mask -- Win key
myBorderWidth = 2
-- Define workspaces for certain applications
myManageHook= composeAll
	[ className =? "Firefox" --> doShift "1: Euler"
	, className =? "Vlc" --> doShift "2: Lagrange"
	]

main = do
	xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
	xmonad $ azertyConfig  
		{ workspaces = myWorkspaces
		, modMask = myModMask
		, terminal = myTerminal
		, borderWidth = myBorderWidth
		, manageHook = myManageHook <+> manageHook defaultConfig
		, layoutHook = avoidStruts $ layoutHook defaultConfig
  		, startupHook = startup
		}

-- startup applications
startup :: X()
startup = do 
	spawn "exec --no-startup-id feh --bg-scale ~/Images/math_pictures/T-Gyroid.jpg"
	spawn "xsetroot -cursor_name left_ptr" -- fix the xcursor
