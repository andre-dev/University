module Aula5 where

-- () -> Unidade (Unity)

teste :: () -> Int
teste x = 0

teste1 :: Int -> ()
teste1 x = ()

-- No Haskell todo tipo tem seu undefined próprio.

data Sozinho

teste2 :: Sozinho -> Int
teste2 x = 0

teste3 :: Int -> Sozinho
teste3 x = undefined

foo :: () -> Sozinho -> Int
foo x y = 0

foo1 :: [Sozinho] -> Int
foo1 x = 0

-- Segunda parte a Aula5

-- (\x -> 2*x) Lambda
-- Lambda: Função anonima, sem corpo.
-- \p1 p2 p3 ... pn -> EXPRESSÃO

-- High order function
-- eh uma funcao que recebe via parametro(s) funcoes e ou retorna funcoes

aplicar :: (Int -> Int) -> Int
aplicar f = 1 + f 6  --aplicar (\x -> 2*x)

-- Chama a função f com argumento 6 e soma 1

{-
    aplicar ((\x y -> x+y)10)
    = aplicar (\y -> 10 + y)
    = 1 + (\y -> 10+y)6
    = 1 + 16 
    = 17
-}

mult :: Int -> (Int -> Int) 
mult x = (\y -> x*y)

mult' :: Int -> Int -> Int
mult' x y = x*y

-- Função map

-- map (\x -> 2*x) [1,2,3,4,5]
-- map (\x -> "OLA" ++ x) ["Pedro","Bill","Math"]
-- map (2*) [1..5]

-- Função filter

-- Filter (\x -> lenght x == 5) ["ABCDE","FATEC","SANTOS","ABC"]
-- Filter (\x -> x>=4) [1..10]
-- Filter odd [1..15]
-- Filter even [1..15]
-- Filter (>=4) [1..10]
-- Filter (\x -> notElem x "AEIOU") (reverse "FATEC")
-- Filter (4>=) [1..10]

data Pessoa = Pessoa String Int deriving Show

maior :: Pessoa -> Bool
maior (Pessoa _ idade) = idade >= 18

filtrarMaiores :: [Pessoa] -> [Pessoa]
filtrarMaiores xs = filter maior xs

-- let ps = [Pessoa "Joao" 24, Pessoa "Pedro" 17]
-- filtrarMaiores ps

--Exer:

{-
 a-) faca  o tipo Metragem com os value construtors metro e kilometro
 b-) faca  o tipo Medida com os campos  double e metragem
 c-)Faca a funcao converter que onverte metros para kilometros
 d-) Faca a funcao converterTodos que onverte todos os elementos de uma lista de medida
 e-)Faca a funcao maior5 que filtra qualquer medida maior que 5 sem importar a Metragem
 
-}

data Metragem  = Metro | Kilometro  deriving Show
data Medida = Medida Double Metragem deriving Show

-- Medida carrega um double e uma metragem em sua declaracao
converter :: Medida -> Medida 
converter (Medida x Metro) =  Medida (x/1000) Kilometro 
converter (Medida x Kilometro) =  Medida (x*1000) Metro

converterTodos :: [Medida] -> [Medida]
converterTodos xs = map converter xs

-- let m = [Medida 1 Metro, Medida 1 kilometro]