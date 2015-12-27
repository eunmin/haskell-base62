module Main where

import System.Environment
import System.Console.GetOpt
import Base62

data Flag = Encode | Decode deriving Show

options :: [OptDescr Flag]
options = [
  Option ['e'] ["encode"] (NoArg Encode) "encode base62",
  Option ['d'] ["decode"] (NoArg Decode) "decode base62"
  ]

header = "Usage: base62 [-e|-d] data"

main = do
  args <- getArgs
  case getOpt RequireOrder options args of
    ([Encode], (number:_), []) -> putStrLn (encode (read number))
    ([Decode], (code:_), []) -> print (decode code)
    _ -> error $ usageInfo header options
