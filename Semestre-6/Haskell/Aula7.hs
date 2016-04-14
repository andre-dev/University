module Aula7 where
{-
data Tipo = ValueC1 Char | ValueC2 Char Char deriving Show
-- ValueC1 x
-- ValueC2 y w
-}

import Data.Monoid

data Bolsa a = Vazio | Bolso a | Necessaire a a
-- a eh chamado de Type Parameter
data Item = Batom | Espelho | Celular | Chave deriving (Eq,Show) 

-- Eq é um type class logo, para cada tipo do Haskell vc deve criar uma instancia para definir o comportamento desejado.
-- (Eq a) => restringe aos tipos a que sejam comparaveis.
instance (Eq a) => Eq (Bolsa a) where
    (Bolso x) == (Bolso y) = x == y
    (Necessaire a b) == (Necessaire c d) = ((a == c) && (b == d)) || ((a == c) && (b == d))
    _ == _ = False
    
instance (Show a) => Show (Bolsa a) where
    show (Bolso x) = "Uma linda bolsa: " ++ show x
    show (Necessaire x y) = "Uma linda bolsa: " ++ show x ++" - "++ show y

-- Kind Item: Vou la e pego o item, tem uma estrutura de dimenção 1, Int, Char, Bool.
-- Kind Bolsa: Praticamente um universo paralelo. Lista, Array, Bolsa de inteiros, String(Pois é um array de caracters).

--Exercicio 1;

--

--a) Faca uma funcao trocar, que troca as posicoes (Contendo Item) de dentro da Necessaire para o Bolso nao acontece nada.

trocar :: Bolsa Item -> Bolsa Item --Um tipo de Kind 2 sempre devera ter especificado o que tem dentro(Item).
trocar (Necessaire x y) = Necessaire y x
trocar (Bolso x) = Bolso x

-- Execusão: trocar (Necessaire Espelho Celular)

-- Colocando deriving Eq estou dizendo que os itens são comparaveis; 
-- Ex: Batom == Batom ou Bolso Batom == Bolso Espelho ou Necessaire Celular Espelho == Necessaire Celular Espelho

---------------------------------------------------------Segunda parte da aula---------------------------------------------------

-- class (Show a ) where
-- show :: a -> String

class (Numero a) where
    numero :: a -> Int
--Instance de numero para Item 
instance Numero Item where
    numero Batom = 1
    numero Espelho = 3423
    numero Celular = 99
    numero Chave = 2
    
{-

MONOIDE (Data.Monoid)
def: dado um conjunto (m diferente de 0)qualquer e uma operação binaria <>.
Uma  monoide (m,<>) é uma estrutura que satisfaz: (neutro -mempty) (u<>m = m)
(associatividade) (a<>b)<>c = a <>(b<>c)
(<>) = mappend

-}

instance Monoid(a) => Monoid (Bolsa a) where
    mempty = Vazio
    mappend x Vazio = x
    mappend Vazio x = x
    mappend Vazio Vazio = Vazio
    mappend (Bolso x) (Bolso y) = Necessaire x y
    mappend (Necessaire x y ) (Bolso w) = Necessaire (x <> w) y
    mappend (Bolso w) (Necessaire x y) = Necessaire (x <> w) y
    mappend (Necessaire a b) (Necessaire c d) = Necessaire(a <> c) (b <> d)