# Module Documentation

## Module Node.WebKit

### Values

    defaultManifestWindow :: ManifestWindow

    nwShell :: forall eff. Eff (nw :: NW | eff) NWShell

    openExternal :: forall eff. String -> NWShell -> Eff (nw :: NW | eff) NWShell

    openItem :: forall eff. String -> NWShell -> Eff (nw :: NW | eff) NWShell

    shellOpen :: forall eff. String -> String -> NWShell -> Eff (nw :: NW | eff) NWShell

    showItemInFolder :: forall eff. String -> NWShell -> Eff (nw :: NW | eff) NWShell


## Module Node.WebKit.Menu

### Values

    append :: forall eff. NWMenuItem -> NWMenu -> Eff (nw :: NW | eff) NWMenu

    createMacBuiltin :: forall eff. String -> NWMenuMacOptions -> NWMenu -> Eff (nw :: NW | eff) NWMenu

    defaultMacOptions :: NWMenuMacOptions

    insert :: forall eff. NWMenuItem -> Number -> NWMenu -> Eff (nw :: NW | eff) NWMenu

    items :: NWMenu -> [NWMenuItem]

    nwMenu :: forall eff. Eff (nw :: NW | eff) NWMenu

    nwWindowMenu :: forall eff. Eff (nw :: NW | eff) NWMenu

    popup :: forall eff. Number -> Number -> NWMenu -> Eff (nw :: NW | eff) NWMenu

    remove :: forall eff. NWMenuItem -> NWMenu -> Eff (nw :: NW | eff) NWMenu

    removeAt :: forall eff. Number -> NWMenu -> Eff (nw :: NW | eff) NWMenu

    setWindowMenu :: forall eff. NWMenu -> NWWindow -> Eff (nw :: NW | eff) NWWindow


## Module Node.WebKit.MenuItem

### Type Class Instances

    instance eventEmitterNWMenuItem :: EventEmitter NWMenuItem


### Values

    defaultMenuItemOptions :: forall eff. NWMenuItemOptions eff Unit

    nwMenuItem :: forall eff eff' a. NWMenuItemOptions eff' a -> Eff (nw :: NW | eff) NWMenuItem

    onClick :: forall eff a. Fn0 (Eff eff a) -> NWMenuItem -> Eff (event :: EventEff | eff) NWMenuItem


## Module Node.WebKit.Types

### Types

    data IFrame :: *

    type ManifestWindow  = { kiosk :: Boolean, show :: Boolean, frame :: Boolean, show_in_taskbar :: Boolean, fullscreen :: Boolean, "always-on-top" :: Boolean, resizable :: Boolean, as_desktop :: Boolean, max_height :: Number, max_width :: Number, min_height :: Number, min_width :: Number, position :: String, icon :: String, toolbar :: Boolean, height :: Number, width :: Number, title :: String }

    data NW :: !

    data NWMenu :: *

    data NWMenuItem :: *

    newtype NWMenuItemMod

    type NWMenuItemOptions eff a = { "type" :: NWMenuItemTy, tooltip :: String, submenu :: Maybe NWMenu, modifiers :: NWMenuItemMod, label :: String, key :: String, icon :: String, enabled :: Boolean, click :: Eff eff a, checked :: Boolean }

    newtype NWMenuItemTy

    type NWMenuMacOptions  = { hideWindow :: Boolean, hideEdit :: Boolean }

    data NWShell :: *

    data NWWindow :: *

    data WindowPolicy :: *

    data WindowPolicyEff :: !


### Type Class Instances

    instance monoidNWMenuItemMod :: Monoid NWMenuItemMod

    instance semigroupNWMenuItemMod :: Semigroup NWMenuItemMod


### Values

    nwMenuItemCheckbox :: NWMenuItemTy

    nwMenuItemModAlt :: NWMenuItemMod

    nwMenuItemModCmd :: NWMenuItemMod

    nwMenuItemModCtrl :: NWMenuItemMod

    nwMenuItemModNone :: NWMenuItemMod

    nwMenuItemModShift :: NWMenuItemMod

    nwMenuItemNormal :: NWMenuItemTy

    nwMenuItemSeparator :: NWMenuItemTy


## Module Node.WebKit.Window

### Type Class Instances

    instance eventEmitterNWWindow :: EventEmitter NWWindow


### Values

    closeWindow :: forall eff. Boolean -> NWWindow -> Eff (nw :: NW | eff) NWWindow

    forceCurrent :: forall eff. WindowPolicy -> Eff (policy :: WindowPolicyEff | eff) Unit

    forceDownload :: forall eff. WindowPolicy -> Eff (policy :: WindowPolicyEff | eff) Unit

    forceNewPopup :: forall eff. WindowPolicy -> Eff (policy :: WindowPolicyEff | eff) Unit

    forceNewWindow :: forall eff. WindowPolicy -> Eff (policy :: WindowPolicyEff | eff) Unit

    get :: forall eff. NWWindow -> Eff (nw :: NW | eff) NWWindow

    ignore :: forall eff. WindowPolicy -> Eff (policy :: WindowPolicyEff | eff) Unit

    nwWindow :: forall eff. Eff (nw :: NW | eff) NWWindow

    onBlur :: forall eff. Fn0 (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onCapturepagedone :: forall eff. Fn1 String (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onClose :: forall eff. Fn0 (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onClosed :: forall eff. Fn0 (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onDevtoolsClosed :: forall eff. Fn0 (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onDevtoolsOpened :: forall eff. Fn1 String (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onDocumentEnd :: forall eff. Fn1 (Maybe IFrame) (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onDocumentStart :: forall eff. Fn1 (Maybe IFrame) (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onEnterFullscreen :: forall eff. Fn0 (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onFocus :: forall eff. Fn0 (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onLeaveFullscreen :: forall eff. Fn0 (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onLoaded :: forall eff. Fn0 (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onLoading :: forall eff. Fn0 (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onMaximize :: forall eff. Fn0 (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onMinimize :: forall eff. Fn0 (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onMove :: forall eff. Fn2 Number Number (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onNewWinPolicy :: forall eff. Fn3 (Maybe IFrame) String WindowPolicy (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onResize :: forall eff. Fn2 Number Number (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onRestore :: forall eff. Fn0 (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onUnmaximize :: forall eff. Fn0 (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    onZoom :: forall eff. Fn1 Number (Eff eff Unit) -> NWWindow -> Eff (event :: EventEff | eff) NWWindow

    open :: forall eff. String -> ManifestWindow -> NWWindow -> Eff (nw :: NW | eff) NWWindow

    showDevTools :: forall eff. NWWindow -> Eff (nw :: NW | eff) NWWindow

    windowPolicy :: forall eff. String -> WindowPolicy -> Eff (policy :: WindowPolicyEff | eff) Unit



