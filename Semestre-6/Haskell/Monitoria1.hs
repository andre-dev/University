module Monitoria1 where
import Data.Char

-- foldr com record syntax
-- Estrutura de árvore, type parameter
-- ericshortcut@gmail.com

{-
    Para verificar a estrutura do fold: :t foldl
-}

data Pessoa = Pessoa{nome::String, idade::Int} deriving Show

maiusculo :: String -> String
maiusculo s = map toUpper s

mudaParaMaiusculo :: [Pessoa] -> [Pessoa]
mudaParaMaiusculo [] = []
mudaParaMaiusculo ps = foldl pessoaMaiusculo [] ps

pessoaMaiusculo :: [Pessoa] -> Pessoa -> [Pessoa]
pessoaMaiusculo ps (Pessoa n i) = [(Pessoa(maiusculo n)i)]++ps

filtro :: [Int] -> [Int]
filtro is = foldl (\a i -> if i > 7  then a else i:a) [] is

f :: [Int] -> Int -> [Int]
f is i
     | i > 7 = is
     | otherwise = i:is