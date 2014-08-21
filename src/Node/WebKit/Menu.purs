module Node.WebKit.Menu
  ( append
  , createMacBuiltin
  , insert
  , items
  , nwMenu
  , nwWindowMenu
  , popup
  , remove
  , removeAt
  , setWindowMenu
  ) where

  import Control.Monad.Eff (Eff())

  import Node.WebKit.Types
    ( NW()
    , NWMenu()
    , NWMenuItem()
    , NWMenuMacOptions()
    , NWWindow()
    )

  defaultMacOptions :: NWMenuMacOptions
  defaultMacOptions = {hideEdit: false, hideWindow: false}

  foreign import unsafeNWMenu
    "function unsafeNWMenu(menubar) {\
    \  return function() {\
    \    var Menu = require('nw.gui').Menu;\
    \    return menubar ? new Menu({type: 'menubar'}) : new Menu();\
    \  }\
    \}" :: forall eff. Boolean -> Eff (nw :: NW | eff) NWMenu

  nwWindowMenu :: forall eff. Eff (nw :: NW | eff) NWMenu
  nwWindowMenu = unsafeNWMenu true

  nwMenu :: forall eff. Eff (nw :: NW | eff) NWMenu
  nwMenu = unsafeNWMenu false

  foreign import items
    "function items(menu) {\
    \  return menu.items;\
    \}" :: NWMenu -> [NWMenuItem]

  foreign import append
    "function append(item) {\
    \  return function(menu) {\
    \    return function() {\
    \      menu.append(item);\
    \      return menu;\
    \    }\
    \  }\
    \}" :: forall eff. NWMenuItem -> NWMenu -> Eff (nw :: NW | eff) NWMenu

  foreign import createMacBuiltin
    "function createMacBuiltin(name) {\
    \  return function(opts) {\
    \    return function(menu) {\
    \      return function() {\
    \        menu.createMacBuiltin(name, opts);\
    \        return menu;\
    \      }\
    \    }\
    \  }\
    \}" :: forall eff. String -> NWMenuMacOptions -> NWMenu -> Eff (nw :: NW | eff) NWMenu

  foreign import insert
    "function insert(item) {\
    \  return function(i) {\
    \    return function(menu) {\
    \      return function() {\
    \        menu.insert(item, i);\
    \        return menu;\
    \      }\
    \    }\
    \  }\
    \}" :: forall eff. NWMenuItem -> Number -> NWMenu -> Eff (nw :: NW | eff) NWMenu

  foreign import popup
    "function popup(x) {\
    \  return function(y) {\
    \    return function(menu) {\
    \      return function() {\
    \        menu.popup(x, y);\
    \        return menu;\
    \      }\
    \    }\
    \  }\
    \}" :: forall eff. Number -> Number -> NWMenu -> Eff (nw :: NW | eff) NWMenu

  foreign import remove
    "function remove(item) {\
    \  return function(menu) {\
    \    return function() {\
    \      menu.remove(item);\
    \      return menu;\
    \    }\
    \  }\
    \}" :: forall eff. NWMenuItem -> NWMenu -> Eff (nw :: NW | eff) NWMenu

  foreign import removeAt
    "function removeAt(i) {\
    \  return function(menu) {\
    \    return function() {\
    \      menu.removeAt(i);\
    \      return menu;\
    \    }\
    \  }\
    \}" :: forall eff. Number -> NWMenu -> Eff (nw :: NW | eff) NWMenu

  foreign import setWindowMenu
    "function setWindowMenu(menu) {\
    \  return function(win) {\
    \    return function() {\
    \      win.menu = menu;\
    \      return win;\
    \    }\
    \  }\
    \}" :: forall eff. NWMenu -> NWWindow -> Eff (nw :: NW | eff) NWWindow
