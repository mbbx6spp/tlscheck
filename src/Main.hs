module Main where

import           Options.Applicative    (Parser, command, customExecParser,
                                         helper, idm, info, prefs, progDesc,
                                         showHelpOnError, subparser, (<**>),
                                         (<>))

import           Network.TLSCheck.Types

-- Subcommands:
--
-- * cert: issuer, chain, revocation
-- * cipher: strong/weak
-- * version: support assertions
-- * https: HSTS, upgrade, etc.

commands :: Parser Command
commands = subparser
  (  command "cert"     (info cert (progDesc "Make assertions about cert suite"))
  <> command "cipher"   (info cipher (progDesc "Make assertions about cipher suite"))
  <> command "version"  (info version (progDesc "Make assertions about TLS version"))
  <> command "https"    (info http (progDesc "Make assertions about HTTP headers/support"))
  )
  where
    cert = pure Cert
    cipher = pure Cipher
    version = pure Version
    http = pure HTTP

main = customExecParser p opts
  where
    opts = info (commands <**> helper) idm
    p = prefs showHelpOnError
