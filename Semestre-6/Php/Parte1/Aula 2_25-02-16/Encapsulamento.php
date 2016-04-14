<?php 

// Encapsulamento: conceito que permite esconder o estado de um objeto. Há três modificadores de acesso, em php, que são;
// Public, private e protected.

//Public: Qualquer classe consegue acessar atributos ou métodos.
//Private: Apenas a propria classe acessa atributos ou métodos.
//Protected: Apenas a propria classe ou subclasses acessam atributos e métodos.

//Acessos;
//Atributos: Leitura e escrita.
//Métodos: Chamada.

//Exemplo; 
//Acesso de leitura a um atributo: echo $X->atributo, ou $b = $x->atributo+2.
//Acesso de escrita: $x->atributo = 56.
//Acesso de chamada: $x->metodo().

//A POO prega que uma classe deve ser feita de modo a esconder a sua implementação de outras classes.
//Moral da história: Atributo sempre privado e método quase (99% das vezes) público.

//Ler sobre: Data Hiding.

//Metodo SET: serve para dar acesso de escrita.
//Metodo GET: Serve para dar acesso de leitura.


//Exemplo 1 encapsulamento;
class Foo{
    public $x;
    private $y;
    
    public function ola1(){
        echo "Metodo Publico <br>";
    }
    private function ola2(){
        echo "Metodo Privado <br>";
    }
}

$fo = new Foo();
$fo->x = 3;
//$f->y = 5;        Erro não pode acessar escrita.
echo "$fo->x <br>";
//echo "$f->y <br>" Erro não pode acessar leitura.
$fo->ola1();
//$f->ola2();       Erro não pode realizar a chamada ao metodo.


//Exemplo 2 GET e SET;
class Fii{
    private $atributo;
    
    public function getAtributo(){
        return $this->atributo;
    }
    
    public function setAtributo($atributo){
        $this->atributo = $atributo;
    }
}

$fi = new Fii();
$fi->setAtributo(8);
echo $fi->getAtributo();

//Exemplo 3 GET e SET da forma correta;

class Pessoa{
    private $nome, $idade, $estagio;
    public function __construct($nome, $idade, $estagio){
        $this->nome = $nome;
        $this->idade = $idade;
        $this->estagio = $estagio;
    }
    
    public function verFilmeProibido(){
        if($this->idade >= 18){
            echo "UHHHHH";
        }else{
            echo "Proibído para menores <br>";
        }
    }
    public function verEstagio(){
        echo $this->estagio;
    }
    public function aniversario(){ // Regra de negócio controlando as coisas e exercendo maior coeção com a classe.
        $this->idade++;
        if($this->idade > 13 && $this->idade < 18){
            $this->estagio = "Adolescente";
        }else if($this->idade <= 13){
            $this->estagio = "Criança";
        }else{
            $this->estagio = "Adulto";
        }
    }
    public function setIdade($idade){ //Quebra a regra de negócios. Dica* nunca usar o SET.
        $this->idade = $idade;
    }
}

//Fora da classe tudo é chamada de método.

$p = new Pessoa("Joaozinho",6,"Criança");
//$p->setIdade(21); Classe pessoa perde o controle do atributo idade. E Joaozinho passa a alterar a idade arbitrariamente.
$p->aniversario();
$p->verFilmeProibido();
$p->verEstagio();