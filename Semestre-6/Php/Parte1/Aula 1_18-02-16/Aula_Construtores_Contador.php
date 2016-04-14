<?php
class Contador{
    public $numero;
    public function __Construct(){
        $this->resetar();
    }
    public function incrementar(){
        $this->numero++;
    }
    public function resetar(){
        $this->numero = 0;
    }
}

$k = new Contador();
$k->incrementar();
echo $k->numero;