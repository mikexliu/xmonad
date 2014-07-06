import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.SetWMName
import System.IO

myTerminal = "gnome-terminal"

main = do
xmproc <- spawnPipe "/usr/bin/xmobar /home/mike/.xmonad/xmobarrc"
xmonad $ defaultConfig
    {
      terminal = myTerminal
    , manageHook = manageDocks <+> manageHook defaultConfig
    , startupHook = setWMName "LG3D"
    , layoutHook = avoidStruts  $  layoutHook defaultConfig
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_z), spawn "gnome-screensaver-command --lock") --mod4mask is the windows key
    , ((0, xK_Print), spawn "gnome-screenshot")
    ]
