module Teste1 where

--foo :: String -> [String]
--foo x = [x]

-- import Data.Monoid

-- data Min m = Int deriving(Ord, Eq, Show)

-- instance (Monoid m) => Monoid (Min m) where

twice f x = f(f x)
