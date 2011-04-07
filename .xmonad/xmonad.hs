import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ICCCMFocus

main = xmonad defaultConfig
    { terminal = "urxvt"
    , startupHook = setWMName "LG3D"
    , logHook = takeTopFocus
    , borderWidth = 1
    , normalBorderColor = "#555555"
    , focusedBorderColor = "#ffa522"
    }
