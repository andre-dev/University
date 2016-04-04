module Aula9 where
import Control.Monad

-- instance Monad Maybe where
--      return = Just
--      (Just x) >>= f = f x
--      Nothing >>= f = Nothing

-- Neste caso a transformacao natural
-- abaixo, pega um Int e o coloca
-- sob acao de um funtor Maybe.
tnf :: Int -> [Int]
tnf x = [x+1]

f :: Int -> Int
f x = x+1

tng :: Int -> [Int]
tng x = [x+2]

g :: Int -> Int
g x = x+2


expr :: Maybe Int
expr = Just 5 >>= \x -> Just (x+1) >>= \y -> Just(2+x) >>= \z -> Just (x+y+z) 

expr' :: Maybe Int
expr' = do
      x <- Just 5
      y <- Just (x+1)
      z <- Just (2+x)
      return (x+y+z)
      
-- data () = ()      
main :: IO ()
main = putStrLn "Ola mundo"      