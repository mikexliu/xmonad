import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)

myTerminal = "gnome-terminal"

main = do
xmproc <- spawnPipe "/usr/bin/xmobar /home/mike/.xmonad/xmobarrc"
xmonad $ defaultConfig
    {
      terminal = myTerminal
    , manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts  $  layoutHook defaultConfig
    }
