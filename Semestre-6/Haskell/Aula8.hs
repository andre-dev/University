module Aula8 where

data Humano = Bia | Pedro deriving Show

data Vampiro a = Vampiro a deriving Show

instance Functor Vampiro where
    fmap f (Vampiro x) = Vampiro (f x)
    
    

amor :: Humano -> Humano
amor Bia = Pedro
amor Pedro = Bia

-- fmap amor (Vampiro Pedro)

--------------------------------------- Parte 2

data Valido a = Sim a | 
--data MAybe a = Just a | Nothing
instance Functor Valido where
    fmap f (Sim x) = Sim (f x)
    fmap f Nao = Nao

instance (Show a) => Show (Valido a) where
    show (Sim x) = show x
    show Nao = "Erro..."

(/?) :: Double -> Double -> Maybe Double
(/?) x 0 = Nothing
(/?) x y = Just (x/y)

-- 10 /? 5

-- Transformacoes naturais
toJust :: a -> Maybe a
toJust x = Just x

toList :: a -> [a]
toList x = [x]

toList' :: Int -> [Int]
toList' x = [x+1]

-- toList' 3

f :: Int -> Int
f x = x+1

-- (f.f.f) 4