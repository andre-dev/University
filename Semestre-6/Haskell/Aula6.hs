module Aula6 where

--Aula de hoje: Foco em recursao e guard's

-- Zero é um value construct de interger e nao uma condicao boleana.
fat :: Integer -> Integer
fat 0 = 1
fat k = k * fat (k-1)

fat' :: Integer -> Integer
fat' k
     | k <= 1 = 1 --if
     | otherwise = k * fat (k-1) -- else
     -- O pipeline se chama guard's: Serie de verificacoes boleanas executadas em ordem até chegar em otherwise
     -- Teste: fat' (-8)
     
{-----------------------------------------------//---------------------------------------------------------------}

fib :: Integer -> Integer
fib n
    | n <= 2 = 1
    | otherwise = fib (n-1) + fib (n-2) --fibona
    --Teste: map fib [1..10]

{-----------------------------------------------//---------------------------------------------------------------}    

eliminarVogais :: String -> String
eliminarVogais [] = [] --Condicao de parada, usar sempre que trablahar com listas.
eliminarVogais (x:xs)-- Se a palavra for FATEC retorna F + ATEC
               | elem x "AEIOUaeiou" = eliminarVogais xs
               | otherwise = x : eliminarVogais xs-- Os : vai na frente a lista.

{-----------------------------------------------//---------------------------------------------------------------}

-- Exercicio 1;
-- Faca recursivamente o que se pede:

-- a) Elimine todas as palavras de 4 Letras de uma lista de Strings e faca o teste de mesa.
e4 :: [String] -> [String]
e4 [] = []
e4 (x:xs)
   | length x == 4 = e4 xs
   | otherwise = x : e4 xs


-- b) Elimine todos os pares 'AA' de uma String e faca o teste de mesa.               
eA :: String -> String
eA [] = []
eA (x:y:xs)
    | elem x "A" && elem y "A" = eA xs
    | otherwise = x : eA (y:xs)
eA (x:xs) = x:xs

{-----------------------------------------------//---------------------------------------------------------------}

foo :: String -> String
foo [] = []
foo (x:y:z:xs)
    | x == 'A' && y == 'B' && z == 'C' = foo xs
    | otherwise = x : foo (y:z:xs)
foo x = x

{-----------------------------------------------//---------------------------------------------------------------}
-- fold1 (+) 0 [1,2,3,5,10]
-- Teste de mesa: fold1 (+) (0+1) [2,3,5,10]
-- Teste de mesa: fold1 (+) (0+1+2) [3,5,10]
-- Teste de mesa: fold1 (+) (0+1+2+3) [5,10]
-- Teste de mesa: fold1 (+) (0+1+2+3+4) [10]
-- Teste de mesa: fold1 (+) (0+1+2+3+4+5) []
-- Teste de mesa: Resultado = 21

-- fold1 (*) 1 [1,2,3,5,10]
-- Resultado: 300

-- fold1 (\x y -> x + length y) 0 ["FATEC","SANTOS","AMA","JAVA"]
-- fold1 (\x y -> Expressao Envolvendo x e ou y)inicial lista
-- x representa a acumulação do valor inicial com o resultado da expressao.
-- y é alguem da lista
-- (Você sempre pode ignorar, se necessario, x ou y do labda)
-- (\_ y -> Expressao)
-- (\x _ -> Expressao)
-- (\x y -> Expressao)
{-----------------------------------------------//---------------------------------------------------------------}

--Exercicio;

-- a) Faca um foldl para contar letras de uma palavra.
-- b) Faca um foldl para reverter uma string.

--a:)R

--foldl (\x _ -> x+1) 0 "ABA"

--b)R

-- foldl(\x y -> [y] ++ x ) "" "FATEC"
-- foldl(\x y -> y : x ) "" "FATEC"