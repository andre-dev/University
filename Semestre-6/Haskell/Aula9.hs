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
mainw :: IO ()
mainw = putStrLn "Ola mundo"

--Segunda parte da aula---------------------------------------------------------

data Tipo = A | B deriving (Show, Read)  
-- As >> sempre vem depois de algo IO ()
main :: IO ()
main = putStrLn "Digite um nome: " >>
       getLine >>= \x -> putStrLn ("Ola " ++ x)

-- Na notacao do nao ha uso de operadores monadicos
-- >>, >>=, =<<, ...
main' :: IO ()
main' = do
      putStrLn "Digite um nome: "
      x <- getLine
      putStrLn ("Ola " ++ x)
      
main2 :: IO ()
main2 = do
      putStrLn "Digite um numero: "
      x <- readLn
      putStrLn ("O numero eh: " ++ show(x+1))
      
--main2'  = putStrLn "Digite um numero: " >> readLn >>= \x -> putStrLn("O numero eh " ++ x+1)
ex1 = do
       putStrLn "Digite um nome"
       x <- getLine
       putStrLn (reverse x)
ex2 