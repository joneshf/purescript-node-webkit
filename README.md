# Module Documentation

## Module Node.Webkit

### Types

    data IFrame :: *

    data NW :: !

    data NWGUI :: *

    data NWShell :: *

    data NWWindow :: *

    data WindowPolicy :: *

    data WindowPolicyEff :: !


### Type Class Instances

    instance eventEmitterNWWindow :: EventEmitter NWWindow


### Values

    closeWindow :: forall eff. NWWindow -> Eff (nw :: NW | eff) NWWindow

    forceCurrent :: forall eff. WindowPolicy -> Eff (policy :: WindowPolicyEff | eff) Unit

    forceDownload :: forall eff. WindowPolicy -> Eff (policy :: WindowPolicyEff | eff) Unit

    forceNewPopup :: forall eff. WindowPolicy -> Eff (policy :: WindowPolicyEff | eff) Unit

    forceNewWindow :: forall eff. WindowPolicy -> Eff (policy :: WindowPolicyEff | eff) Unit

    guiShell :: forall eff. NWGUI -> Eff (nw :: NW | eff) NWShell

    guiWindow :: forall eff. NWGUI -> Eff (nw :: NW | eff) NWWindow

    ignore :: forall eff. WindowPolicy -> Eff (policy :: WindowPolicyEff | eff) Unit

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

    openExternal :: forall eff. String -> NWShell -> Eff (nw :: NW | eff) NWShell

    showDevTools :: forall eff. NWWindow -> Eff (nw :: NW | eff) NWWindow

    windowPolicy :: forall eff. String -> WindowPolicy -> Eff (policy :: WindowPolicyEff | eff) Unit



