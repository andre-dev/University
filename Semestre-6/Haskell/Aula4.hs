{-
    Toda String é um [CHAR], por isso que usamos [X], poi X é um Char.
-}
module Aula4 where
    
teste :: String -> String
teste (x:xs) = xs ++ [x] -- Retorno "ATECF"
--teste (x:_xs) = xs ++ [y]
teste(x:y:z:xs) = [z] ++ [x] ++ xs
teste _  = "ERRo"
-- x:y:[] indica duas letras

-- Crie uma funcao que troque a segunda pela quarta letra e a primeira pela terceira

ex1 :: String -> String
ex1 (x:y:z:w:xs) = [z] ++ [w] ++ [x] ++ [y] ++ xs

--currying
--data Pessoa  = Fisica String Int | Juridica String deriving Show

--REcord syntax
data Pessoa  = Fisica {pessoaNome :: String, pessoaIdade :: Int} | Juridica {pessoaNome :: String} deriving Show

somarIdades :: Pessoa -> Pessoa -> Int
somarIdades( Fisica _ i) (Fisica _ i1) = i+i1
somarIdades' x y = pessoaIdade x + pessoaIdade y

--eh possivel cria r um value construct com o mesmo nome do data constructor
data Sozinho = Sozinho{a :: String, b :: Char}



--Fca o tipo Ponto con dois campos Double representando a posicoes x e y na tela
--Faca as funcoes : moverX move um ponto dx unidades  na direcao x
-- A variavel dx eh um parametro
--moverY move um ponto dy unidades na direcao y A variavel dx eh um parametro
--mag Extrai a distancia da origem de um ponto


data Ponto = Ponto{x :: Double, y :: Double} deriving Show
moverX :: Ponto -> Double -> Ponto 
moverX(Ponto x y)dx = Ponto (x+dx) y
moverY :: Ponto -> Double -> Ponto
moverY(Ponto x y)dy = Ponto x (dy+y)

--Fisica nome  idade eh um pattern matching
-- que encaixa no tipo declarado. O variavel nome
--eh uma String e a variavel idade eh u, int
aniversario :: Pessoa -> Pessoa
aniversario (Fisica nome idade) = Fisica nome (idade+1)
aniversario (Juridica nome) =  Juridica nome
--combinabilidade:
--aniversario . aniversario . aniversario $ Fisica "Andressa" 22

--Exercicio: Faca a funcao fusao que concatene os campos nome e some os campos idade. A funcao deve funcionar para os dois value constructors.
-- ++ Concatena

fusao :: Pessoa -> Pessoa -> Pessoa
fusao (Fisica nome idade) (Fisica nome1 idade1) = Fisica  (nome ++ nome1) (idade+idade1)
fusao (Juridica nome2) (Juridica nome3) =  Juridica (nome2 ++ nome3)