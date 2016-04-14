<?php

    interface Quadrilatero{
        //Em uma interface tudo é publico e abstratro
        //Interface: Conjunto de métodos abstratos e constantes. Ex: Const PI = 3.14;
        
        Const PI = 3.14;
        
        function calcArea();
        
        function calcPerim();
    }
    
    class Quadrado implements Quadrilatero{
        private $lado1;
        
         //Mesmo a clase sendo abstrata ele pode conter um construtor.
        public function __construct($lado1){
            $this->lado1 = $lado1;
        }
        
        public function calcArea(){
            return $this->lado1*$this->lado1;
        }
        
        public function calcPerim(){
            return 4*$this->lado1;
        }
    }
    
    class Retangulo implements Quadrilatero{
        private $lado1, $lado2;
        
        public function __construct($lado1, $lado2){
            $this->lado1 = $lado1;
            $this->lado2 = $lado2;
        }
        
        
        public function calcArea(){
            return $this->lado1*$this->lado2;
        }
        
        public function calcPerim(){
            return 2*($this->lado1 + $this->lado2);
        }
        
    }
    
$quad = new Quadrado(1);
$ret = new Retangulo(2,3);

echo "AQ = ".$quad->calcArea()."<br>";
echo "PQ = ".$quad->calcPerim()."<br>";
echo "AR = ".$ret->calcArea()."<br>";
echo "PR = ".$ret->calcPerim()."<br>";

echo $quad::PI; //Chamando uma constante.