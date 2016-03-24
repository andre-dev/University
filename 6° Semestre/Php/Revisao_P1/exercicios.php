<?php

/*
1) Crie a classe Produto. Esta classe possui dois atributos
nome e valor. Faca os métodos toXML() e toJSON() que mostra
um Produto em formato JSON e XML respectivamente.

Exemplo:
a) XML:
<Produto>
   <nome> Lapis </nome>
   <valor> 1.50 </valor>
</Produto>
b) JSON: {nome : "Lapis", valor : 1.50}

2) Crie um formulario contendo os campos baseados na classe
acima e dois botões com valores (XML e JSON). Ao clicar em
XML, mostre o formato XML e em JSON o formato JSON.
OBS: Você deve usar a classe acima já criada.

3) Crie uma classe chamada ProdutoDAO que contenha um método
chamado inserir. Este método recebe um parametro $p Produto
e o insere no banco de dados (Você deve criar uma Tabela com
os campos: id, nome e valor).

4)  Administrardor, Grupo e Comum são usuarios em um sistema.
    Sabe-se que o Administrador possui permissao para adicionar, modificar, pesquisar e deletar.
    Os usuarios do de Grupo podem adicionar, modificar e pesquisar.
    Os usuarios comuns podem apenas pesquisar.
    Cada ação representa apenas um echo na página para facilitar.
    Desenhe um diagrama de classes e implemente as classes usando o máximo dos conceitos de Programação orientada a objetos.



PARA PROVA:

~ Folha Individual
~ Uma folha A4 frente e verso de consulta.

1) Classes, objetos, métodos, atributos e estado.
2) Construtores
3) Associação entre classes
4) Herança
5) Encapsulamento
6) Abstração (Classes abstratas e interfaces).
7) Conexão com o banco de dados, request (GET e POST) e response.

*/

