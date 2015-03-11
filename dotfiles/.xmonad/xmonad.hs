import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.EwmhDesktops
import System.IO
import XMonad.Hooks.ManageHelpers

startup :: X ()
startup = do
            spawn "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 5 --transparent 1 --alpha 0 --tint 0x000000 --height 12"
            spawn "nm-applet"
            spawn "pnmixer"
            spawn "setxkbmap hr"
            spawn "source $HOME/.fehbg"
main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
    --manage hooks defines special action to be performed on newly created
    --windows matching specific properties
        { manageHook = manageDocks <+> (isFullscreen --> doFullFloat) <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , handleEventHook = fullscreenEventHook --allows fullscreen
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "magenta" "" . shorten 50
                        }
        , startupHook = startup
        , focusedBorderColor = "magenta"
        , modMask = mod4Mask --rebind alt to win key 
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_t), spawn "xfce4-terminal")
        , ((mod4Mask .|. shiftMask, xK_w), spawn "firefox")
        , ((mod4Mask .|. shiftMask, xK_p), spawn "scrot")
        , ((mod4Mask .|. shiftMask, xK_f), spawn "thunar")
        ]
