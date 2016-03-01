{-
    Exercício 1.4 Faça uma função que simule o vencedor de uma partida de pedra,
    papel e tesoura usando tipos criados (você não poderá usar qualquer outro tipo
    que não seja criado usando o data). Casos de empate devem ser considerados em
    seu tipo.
-}

module Apresentacao where

data Jogo = Pedra | Papel | Tesoura deriving Show
data Resultado = Vitoria | Empate deriving Show

jogar :: (Jogo, Jogo) -> (Resultado, Jogo)
jogar (Pedra, Pedra) = (Empate, Pedra)
jogar (Pedra, Tesoura) = (Vitoria, Pedra)
jogar (Pedra, Papel) = (Vitoria, Papel)

jogar (Papel, Papel) = (Empate, Papel)
jogar (Papel, Pedra) = (Vitoria, Papel)
jogar (Papel, Tesoura) = (Vitoria, Tesoura)

jogar (Tesoura, Tesoura) = (Empate, Tesoura)
jogar (Tesoura, Papel) = (Vitoria, Tesoura)
jogar (Tesoura, Pedra) = (Vitoria, Pedra)

{-
    Exercício 1.5 Faça uma função que retorne uma string com todas as vogais
    maiúsculas e minúsculas eliminadas de uma string passada por parâmetro usando
    list compreenshion.
    Dica: procure informações sobre a função elem;
    elem. Ela pega um elemento e uma lista e vê se aquele elemento está na lista.
-}

todasVogais :: [Char] -> [Char]
todasVogais v = [x | x <- v, elem x "aeiouAEIOU"]
