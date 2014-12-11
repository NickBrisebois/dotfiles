import System.IO
import XMonad 
import XMonad.Prompt
-- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
-- Layouts
import XMonad.Layout.LayoutHints (layoutHints)
import XMonad.Layout.BinarySpacePartition hiding (Swap)
import qualified XMonad.Layout.BinarySpacePartition as BSP
import XMonad.Layout.IndependentScreens
import XMonad.Layout.Grid	
import XMonad.Layout.NoFrillsDecoration
import XMonad.Layout.Spacing (spacing)
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
import XMonad.Layout.SimplestFloat
-- Misc
import XMonad.Util.EZConfig ( additionalMouseBindings, additionalKeys )
import XMonad.Actions.Navigation2D
import qualified Data.Map as M
import qualified XMonad.StackSet as W

main :: IO ()
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig 

myBar = "xmobar"

myPP :: PP
myPP = xmobarPP { 
		  ppCurrent   = xmobarColor "#AFAC99" ""
		, ppTitle     = xmobarColor "#AFAC99" "" . shorten 200
        , ppVisible   = xmobarColor "#444444" ""
        , ppUrgent    = xmobarColor "red" "yellow"
		 }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_B)

myModMask :: KeyMask
myModMask = mod4Mask

myLayoutHook =  gaps [(U,5),(L,10),(R,10)] $ spacing 20 $ lessBorders OnlyFloat $ emptyBSP 
				||| GridRatio (1)
				||| simplestFloat
				||| Full
	where
	tiled   = Tall nmaster delta ratio
	nmaster = 1
	ratio   = 1/2
	delta   = 3/100

myStartup :: X ()
myStartup = do
	spawn "nitrogen --restore"
	spawn "volumeicon"
	spawn "compton --config ~/.config/compton.conf"
	spawn "sxhkd -c ~/.config/sxhkdrc"


myManageHook = composeAll 	[ 
				  resource =? "dmenu" --> doFloat
				, resource =? "skype" 	--> doFloat
				, resource =? "Steam"	--> doFloat
				, manageDocks]
newManageHook = myManageHook <+> manageHook defaultConfig 

myConfig = ewmh $ defaultConfig 
	{ 
	  terminal           = "urxvt"
	, modMask            = myModMask
	, borderWidth        = 2
	, workspaces         = withScreens 2 ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"] 
	, startupHook        = myStartup
	, manageHook         = myManageHook
	, layoutHook         = myLayoutHook
	, normalBorderColor  = "#222222"
	, focusedBorderColor = "#595959"
	}

	`additionalKeys` (
	[
		  ((myModMask, 				 xK_x     ), kill)
	    , ((myModMask, 				 xK_l     ), windowGo R False)
	    , ((myModMask, 				 xK_h     ), windowGo L False)
	    , ((myModMask, 				 xK_k     ), windowGo U False)
	    , ((myModMask, 				 xK_j     ), windowGo D False)

		, ((myModMask,               xK_Return), spawn "urxvt")

	    , ((myModMask .|. controlMask, xK_l     ), sendMessage $ MoveSplit R)
		, ((myModMask .|. controlMask, xK_h     ), sendMessage $ MoveSplit L)
		, ((myModMask .|. controlMask, xK_j     ), sendMessage $ MoveSplit D)
		, ((myModMask .|. controlMask, xK_k     ), sendMessage $ MoveSplit U) 
		
		, ((myModMask,               xK_s), sendMessage $ BSP.Rotate)
		, ((myModMask .|. shiftMask, xK_s), sendMessage $ BSP.Swap)
	]++
	[ ((m .|. myModMask, k), windows $ onCurrentScreen f i)
	 | (i, k) <- zip (workspaces' myConfig) [xK_1 .. xK_9]
	 , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)
	]]
	)

