module Test.Node.WebKit where

  import Control.Bind ((>=>))

  import Data.Maybe (Maybe(..))

  import Node.WebKit (defaultManifestWindow)
  import Node.WebKit.Window (get, nwWindow, open)
  import Node.WebKit.Menu (append, nwMenu, nwWindowMenu, setWindowMenu)
  import Node.WebKit.MenuItem (defaultMenuItemOptions, nwMenuItem)

  main = do
    fileMenuItems <- nwMenu >>=
      (   (append ==<< nwMenuItem defaultMenuItemOptions {label = "Open"})
      >=> (append ==<< nwMenuItem defaultMenuItemOptions {label = "Save"})
      >=> (append ==<< nwMenuItem defaultMenuItemOptions {label = "Close"})
      >=> (append ==<< nwMenuItem defaultMenuItemOptions {label = "Exit"})
      )
    fileMenu <- nwMenuItem defaultMenuItemOptions {label = "File", submenu = Just fileMenuItems}
    editMenu <- nwMenuItem defaultMenuItemOptions {label = "Edit"}
    menu <- nwWindowMenu >>= (append fileMenu >=> append editMenu)
    nwWindow
      >>= get
      >>= setWindowMenu menu

  (>>==) :: forall m a b. (Bind m) => m a -> (a -> b -> m b) -> b -> m b
  (>>==) ma f b = ma >>= \a -> f a b

  (==<<) :: forall m a b. (Bind m) => (a -> b -> m b) -> m a -> b -> m b
  (==<<) = flip (>>==)
