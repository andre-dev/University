<?php
class Navio{
    public $nome, $bandeira, $comandante;
    public function __Construct($nome,$bandeira,Comandante $c){
        $this->nome = $nome;
        $this->bandeira = $bandeira;
        $this->contratar($c);
    }
    public function mostrarInfo(){
        echo $this->nome;
        echo $this->bandeira;
        $this->comandante->info();
    }
    public function contratar(Comandante $c){
        $this->comandante = $c;
    }
}
class Comandante{
    public $nome, $mac;
    public function __Construct($n,$mac){
        $this->nome = $n;
        $this->mac = $mac;
    }
    public function info(){
        echo $this->nome;
        echo $this->mac;
    }
}

//Duas formas de garantir a associação de maneira adequada:
//1° Receber via parâmetro, os atributos necessários para o construtor da classe referida e insttânciar o objeto dentro do método. ||Composição.
//2° Type Hint. A instância ocorre fora do método. Ex: (Comandante $c). ||Agregação.
//Senha moodle: Si04 ou 4SI 