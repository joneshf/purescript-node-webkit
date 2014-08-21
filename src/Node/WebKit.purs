module Node.WebKit where

  import Control.Monad.Eff (Eff())

  import Node.WebKit.Types

  defaultManifestWindow :: ManifestWindow
  defaultManifestWindow =
    { title: ""
    , width: 800
    , height: 600
    , toolbar: true
    , icon: ""
    , position: "center"
    , min_width: 800
    , min_height: 600
    , max_width: 800
    , max_height: 600
    , as_desktop: false
    , resizable: true
    , "always-on-top": false
    , fullscreen: false
    , show_in_taskbar: true
    , frame: true
    , show: true
    , kiosk: false
    }

  foreign import nwShell
    "function nwShell() {\
    \  return require('nw.gui').Shell;\
    \}" :: forall eff. Eff (nw :: NW | eff) NWShell

  foreign import shellOpen
    "function shellOpen(method) {\
    \  return function(url) {\
    \    return function(shell) {\
    \      return function() {\
    \        return shell[method](url);\
    \      }\
    \    }\
    \  }\
    \}" :: forall eff. String -> String -> NWShell -> Eff (nw :: NW | eff) NWShell

  openExternal :: forall eff. String -> NWShell -> Eff (nw :: NW | eff) NWShell
  openExternal = shellOpen "openExternal"

  openItem :: forall eff. String -> NWShell -> Eff (nw :: NW | eff) NWShell
  openItem = shellOpen "openItem"

  showItemInFolder :: forall eff. String -> NWShell -> Eff (nw :: NW | eff) NWShell
  showItemInFolder = shellOpen "showItemInFolder"

