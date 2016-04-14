<?php
//Uma lanterna só funciona com duas pilhas. Cada pilha deve possuir ao menos 10 pontos de durabilidade para manter a Lanterna acessa.
// Dependendo da pilha a durabilidade pode se esgotar com rapidez. É possivel checar i estado de uma pilha e de uma lanterna.

//Passos para visualizar regra de negócios de um código:

//1° classes
//2° Metodos
//3° Atributos


class Pilha{
    public $durabilidade, $qualidade;
    public function __construct($durabilidade, $qualidade){
        $this->durabilidade = $durabilidade;
        $this->qualidade = $qualidade;
    }
    
    public function checarEstado(){
       echo "Durabilidade: $this->durabilidade <br>";
    }
    public function reduzirDurabilidade(){
       $this->durabilidade -= $this->qualidade;
    }
    public function isFraca(){
        if($this->durabilidade < 10){
            return false;
        }else{
            return true;
        }
    }
}

class Lanterna{
    //Notem que as duas pilhas se referem a classe pilha.
    public $pilha1, $pilha2;
    public function __construct(Pilha $pilha1, Pilha $pilha2){ //A palavra pilha indica um Type hint ou seja dou uma dica ao interpretador.
        $this->pilha1 = $pilha1;
        $this->pilha2 = $pilha2;
    }
    
    //is_null checa se está nulo ou não.
    public function checarEstado(){
        $this->pilha1->checarEstado();
        $this->pilha2->checarEstado();
    }
    public function acender(){
        if(is_null($this->pilha1) || is_null($this->pilha2)){
            echo "Não há pilhas suficiente";
        }else if($this->pilha1->isFraca() || $this->pilha2->isFraca()){
            echo "Pilha fraca <br>";
        }else{
            echo "Acendeu <br>";
            $this->pilha1->reduzirDurabilidade();
            $this->pilha2->reduzirDurabilidade();   
        }
    }
}

$p1 = new Pilha(10,5);
$p2 = new Pilha(10,10);

$lanterna = new Lanterna($p1, $p2);
$lanterna->acender();
$lanterna->checarEstado();
