<?php
Class Ameba{
    public $name;
    public function __Construct($name){
        $this->name = $name;
    }
    public function mostrar(){
        echo $this->name."<br />";
    }
    public function clonar(){
        $c = new Ameba($this->name." Clone");
        return $c;
        //echo $this->name." Clone";  ||Desta forma também está correto no entanto a melhor utilização é a descrita acima.
    }
}

$ameba1 = new Ameba("web");
$ameba1->mostrar();
$ameba2 = $ameba1->clonar();
$ameba2->mostrar();

//Sempre quando falado em clonar ou criar um obejeto novo utilizar o new.