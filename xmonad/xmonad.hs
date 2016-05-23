import XMonad
import XMonad.Hooks.DynamicLog
--import XMonad.Hooks.ManageDocks
--import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = xmonad =<< xmobar conf
conf = defaultConfig
     { modMask = mod4Mask     -- Rebind Mod to the Windows key
     } `additionalKeys`
     [ ((mod4Mask .|. shiftMask, xK_z), spawn "gnome-screensaver-command --lock")
     , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
     , ((0, xK_Print), spawn "scrot")
     , ((mod4Mask .|. shiftMask, xK_s), spawn "sudo halt")
     , ((mod4Mask .|. shiftMask, xK_h), spawn "sudo pm-hibernate")
     , ((mod4Mask .|. shiftMask, xK_r), spawn "sudo reboot")
     ]
