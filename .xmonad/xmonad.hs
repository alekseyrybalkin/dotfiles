import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ICCCMFocus
import XMonad.Util.EZConfig
import XMonad.Util.Run(spawnPipe)

main = xmonad $ defaultConfig
    { terminal = "urxvt"
    , startupHook = setWMName "LG3D"
    , logHook = takeTopFocus
    , borderWidth = 1
    , normalBorderColor = "#555555"
    , focusedBorderColor = "#ffa522"
    } `additionalKeys` myKeys

myKeys =
    [ ((mod4Mask, xK_l), spawn "xlock"),
      ((controlMask .|. mod1Mask, xK_Delete), spawn "sudo reboot")
    ]
