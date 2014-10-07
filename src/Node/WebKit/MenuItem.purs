module Node.WebKit.MenuItem
  ( defaultMenuItemOptions
  , nwMenuItem
  , onClick
  ) where

  import Control.Events (Event(..), EventEff(), EventEmitter)
  import Control.Monad.Eff (Eff())

  import Data.Function (Fn0())
  import Data.Maybe (fromMaybe, Maybe(..))

  import Node.Events (on)

  import Node.WebKit.Types
    ( NW()
    , NWMenuItem()
    , NWMenuItemOptions()
    , nwMenuItemModNone
    , nwMenuItemNormal
    )

  instance eventEmitterNWMenuItem :: EventEmitter NWMenuItem

  defaultMenuItemOptions :: forall eff. NWMenuItemOptions eff Unit
  defaultMenuItemOptions =
    { checked: false
    , click: pure unit
    , enabled: true
    , icon: ""
    , key: ""
    , label: ""
    , modifiers: nwMenuItemModNone
    , selector: ""
    , submenu: Nothing
    , tooltip: ""
    , "type": nwMenuItemNormal
    }

  foreign import unsafeNWMenuItem
    "function unsafeNWMenuItem(fromMaybe) {\
    \  return function(opts) {\
    \    return function() {\
    \      var submenu = fromMaybe(null)(opts.submenu);\
    \      submenu == null ? delete opts.submenu : opts.submenu = submenu;\
    \      var defaults = ['icon', 'key', 'label', 'tooltip'];\
    \      for (var field in opts) {\
    \        if (opts.hasOwnProperty(field) && opts[field] == '') {\
    \          delete opts[field];\
    \        }\
    \      }\
    \      var MenuItem = require('nw.gui').MenuItem;\
    \      return new MenuItem(opts);\
    \    }\
    \  }\
    \}" :: forall eff eff' a b
        .  (b -> Maybe b -> b)
        -> NWMenuItemOptions eff' a
        -> Eff (nw :: NW | eff) NWMenuItem

  nwMenuItem :: forall eff eff' a
             .  NWMenuItemOptions eff' a
             -> Eff (nw :: NW | eff) NWMenuItem
  nwMenuItem = unsafeNWMenuItem fromMaybe

  onClick :: forall eff a
          .  Fn0 (Eff eff a)
          -> NWMenuItem
          -> Eff (event :: EventEff | eff) NWMenuItem
  onClick = on $ Event "click"
