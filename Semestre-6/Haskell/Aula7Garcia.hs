module Aula7Garcia where

import Data.Monoid

data Bolsa a = Vazio | Bolso a | Necessaire a a deriving Show
-- a eh chamado de Type Parameter
data Item = Batom | Espelho | Celular | Chave deriving (Eq, Show)

instance (Monoid a) => Monoid (Bolsa a) where
    mempty = Vazio
    mappend x Vazio = x
    mappend Vazio x = x
    mappend (Bolso a) (Bolso b) = Bolso (a <> b)
    mappend (Bolso a) (Necessaire b c) = Bolso (a <> b <> c)
    mappend (Necessaire b c) (Bolso a) = Bolso (a <> b <> c)
    mappend (Necessaire a b) (Necessaire c d) = Necessaire (a <> c) (b <> d)
    
    
--Execuçao: Bolso"Lapis" <> Bolso"Caneta" <> Necessaire"Choc" "Leite" 
--mconcat: soma todas as coisas caso tenha um vetor e monoides.
    
    
    









