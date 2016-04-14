module Aula2 where

--Dia é chamado de data constructor. (Contrutor de data)
--E o lado direito são chamados de value constructors. (Construtor de valor)
--Este tipo de declaração é uma enumeração e só é utilizado quando se tem algo finito.
--Estes são um tipos (O | indica ou na sintax da linguagem). 
data Dia = Segunda | Terca | Quarta | Quinta | Sexta | Sabado | Domingo deriving Show
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving Show

{-
    Pattern Matching:
    Encontra um padrão especifico na(s) entrada(s) da funcao. Agi de acordo com os values constructors do tipo de entrada.
-}
diaDeBalada :: Dia -> Bool
diaDeBalada Sabado = True
diaDeBalada Sexta = True
diaDeBalada _ = False

diaSemana :: Int -> Dia
diaSemana 1 = Domingo 
diaSemana 2 = Segunda
diaSemana 3 = Terca
diaSemana 4 = Quarta
diaSemana 5 = Quinta
diaSemana 6 = Sexta
diaSemana 7 = Sabado

{-
    Faca uma funcao chamada salario que implemente a seguinte regra de negocio:
        Todo trabalhador aos domingos ganha o dobro do salario
        Aos sabados 75% a mais
        Qualquer outro dia nao ha um acrescimo
        Afuncao deve receber um Dia e o valor bruto do salario apor hora a ser calculado
-}

salario :: Dia -> Double -> Double
salario Domingo x  = x*2
salario Sabado x = x*0.75+x
salario _ x = x 

{-
    Faca o tipo Day que possua como value constructors os dias da semana em Inglês.
    Faca as funcoes traduzirIP que traduz os dias em Ingles para portugues e traduzirPI que traduz do Portugues para Ingles. 
-}

traduzirPI :: Dia -> Day
traduzirPI Domingo = Sunday
traduzirPI Segunda = Monday
traduzirPI Terca = Tuesday
traduzirPI Quarta = Wednesday
traduzirPI Quinta = Thursday
traduzirPI Sexta = Friday
traduzirPI Sabado = Saturday

traduzirIP :: Day -> Dia
traduzirIP Sunday = Domingo
traduzirIP Monday = Segunda
traduzirIP Tuesday = Terca
traduzirIP Wednesday = Quarta
traduzirIP Thursday = Quinta
traduzirIP Friday = Sexta
traduzirIP Saturday = Sabado


-- Uma das formas de utilizar reverse: reverse . show . traduzirIP $ Sunday

-- Tuplas
mult :: (Int, Int) -> Int 
mult x  = fst x * snd x

mult' :: (Int, Int) -> Int
mult' (x,y) = x*y

{-
    1) Faca uma funcao que recebe um inteiro e é retornado o dobro deste inteiro na primeira 
    coordenada de uma tupla e o triplo na segunda e o quadruplo na terceira.
    2) Faca o tipo pessoa pode ser fisico ou juridico e tipo imposto que pode ser ISS, IRPF ou ICMS. Faca a funcao devePagar
    Que recebe uma tupla de pessoa e imposto e informa se esta pessoa deve pagar ou nao este imposto.
-}

ex1 :: Int -> (Int, Int, Int)
ex1 x = (2*x, 3*x, 4*x)


data Pessoa = Fisica | Juridica deriving Show
data Imposto  = Iss | Irpf | Icms deriving Show

devePagar :: (Pessoa, Imposto) -> Bool
devePagar (Fisica, Irpf) = True
devePagar (Juridica, Irpf) = False
devePagar (Juridica, _) = True
devePagar (Fisica, _) = False