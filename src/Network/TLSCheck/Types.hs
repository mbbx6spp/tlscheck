module Network.TLSCheck.Types where

data Command =
    Cert
  | Cipher
  | Version
  | HTTP
  deriving (Eq, Show)
