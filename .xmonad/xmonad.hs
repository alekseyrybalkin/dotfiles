import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ICCCMFocus
import XMonad.Util.EZConfig
import XMonad.Util.Run(spawnPipe)
import XMonad.Layout.NoBorders

main = xmonad $ defaultConfig
    { terminal = "urxvt"
    , startupHook = setWMName "LG3D"
    , layoutHook = smartBorders $ layoutHook defaultConfig
    , logHook = takeTopFocus
    , borderWidth = 1
    , normalBorderColor = "#555555"
    , focusedBorderColor = "#ffa522"
    } `additionalKeys` myKeys

myKeys =
    [
      ((mod4Mask, xK_l), spawn "xlock"),
      ((mod4Mask, xK_p), spawn "mpc-toggle"),
      ((mod4Mask, xK_equal), spawn "amixer -q -c 0 set Master 1dB+"),
      ((mod4Mask, xK_minus), spawn "amixer -q -c 0 set Master 1dB-"),
      ((mod1Mask, xK_p), spawn "dmenu_run"),
      ((controlMask .|. mod1Mask, xK_Delete), spawn "sudo poweroff")
    ]
