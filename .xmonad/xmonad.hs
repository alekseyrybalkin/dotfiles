import XMonad
import XMonad.Hooks.SetWMName

main = xmonad defaultConfig
    { terminal = "urxvt"
    , startupHook = setWMName "LG3D"
    , borderWidth = 0
    , normalBorderColor = "#555555"
    , focusedBorderColor = "#55AA55"
    }
