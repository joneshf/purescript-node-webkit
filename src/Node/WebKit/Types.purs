module Node.WebKit.Types
  ( IFrame()
  , ManifestWindow()
  , NW()
  , NWMenu()
  , NWMenuItem()
  , NWMenuItemMod()
  , NWMenuItemOptions()
  , NWMenuItemTy()
  , NWMenuMacOptions()
  , NWShell()
  , NWWindow()
  , WindowPolicy()
  , WindowPolicyEff()
  , nwMenuItemCheckbox
  , nwMenuItemNormal
  , nwMenuItemSeparator
  , nwMenuItemModAlt
  , nwMenuItemModCmd
  , nwMenuItemModCtrl
  , nwMenuItemModNone
  , nwMenuItemModShift
  ) where

  import Control.Monad.Eff (Eff())

  import Data.Array (nub, sort)
  import Data.Maybe (Maybe())
  import Data.Monoid (Monoid)
  import Data.String (joinWith, split)

  foreign import data IFrame :: *
  foreign import data NW :: !
  foreign import data NWMenu :: *
  foreign import data NWMenuItem :: *
  foreign import data NWShell :: *
  foreign import data NWWindow :: *
  foreign import data WindowPolicy :: *
  foreign import data WindowPolicyEff :: !

  type ManifestWindow =
    { title           :: String
    , width           :: Number
    , height          :: Number
    , toolbar         :: Boolean
    , icon            :: String
    , position        :: String
    , min_width       :: Number
    , min_height      :: Number
    , max_width       :: Number
    , max_height      :: Number
    , as_desktop      :: Boolean
    , resizable       :: Boolean
    , "always-on-top" :: Boolean
    , fullscreen      :: Boolean
    , show_in_taskbar :: Boolean
    , frame           :: Boolean
    , show            :: Boolean
    , kiosk           :: Boolean
    }

  type NWMenuMacOptions =
    { hideEdit   :: Boolean
    , hideWindow :: Boolean
    }

  type NWMenuItemOptions eff a =
    { checked   :: Boolean
    , click     :: Eff eff a
    , enabled   :: Boolean
    , icon      :: String
    , key       :: String
    , label     :: String
    , modifiers :: NWMenuItemMod
    , submenu   :: Maybe NWMenu
    , tooltip   :: String
    , "type"    :: NWMenuItemTy
    }

  newtype NWMenuItemTy = NWMenuItemTy String

  nwMenuItemCheckbox  :: NWMenuItemTy
  nwMenuItemCheckbox  = NWMenuItemTy "checkbox"
  nwMenuItemNormal    :: NWMenuItemTy
  nwMenuItemNormal    = NWMenuItemTy "normal"
  nwMenuItemSeparator :: NWMenuItemTy
  nwMenuItemSeparator = NWMenuItemTy "separator"

  newtype NWMenuItemMod = NWMenuItemMod String

  nwMenuItemModAlt   :: NWMenuItemMod
  nwMenuItemModAlt   = NWMenuItemMod "alt"
  nwMenuItemModCmd   :: NWMenuItemMod
  nwMenuItemModCmd   = NWMenuItemMod "cmd"
  nwMenuItemModCtrl  :: NWMenuItemMod
  nwMenuItemModCtrl  = NWMenuItemMod "ctrl"
  nwMenuItemModNone  :: NWMenuItemMod
  nwMenuItemModNone  = NWMenuItemMod ""
  nwMenuItemModShift :: NWMenuItemMod
  nwMenuItemModShift = NWMenuItemMod "shift"

  instance semigroupNWMenuItemMod :: Semigroup NWMenuItemMod where
    (<>) (NWMenuItemMod "")  mod                  = mod
    (<>) mod                 (NWMenuItemMod "")   = mod
    (<>) (NWMenuItemMod mod) (NWMenuItemMod mod') = NWMenuItemMod $
      joinWith "-" $ nub $ sort $ split "-" mod ++ split "-" mod'

  instance monoidNWMenuItemMod :: Monoid NWMenuItemMod where
    mempty = nwMenuItemModNone
