module Test.Node.Webkit where

  import Node.Webkit

  main = nwWindow
    >>= open "http://google.com" defaultManifestWindow
