<?php

    abstract class Quadrilatero{
        
        protected $lado1;
        
        //Mesmo a clase sendo abstrata ele pode conter um construtor.
        public function __construct($lado1){
            $this->lado1 = $lado1;
        }
        
        //Sentido do método abstrato é ser sobrescrito.
        public abstract function calcArea();
        
        public abstract function calcPerim();
    }
    class Quadrado extends Quadrilatero{
        
        public function calcArea(){
            return $this->lado1*$this->lado1;
        }
        
        public function calcPerim(){
            return 4*$this->lado1;
        }
    }
    
    class Retangulo extends Quadrilatero{
        protected $lado2;
        
        public function __construct($lado1, $lado2){
            $this->lado2 = $lado2;
            parent::__construct($lado1);
            //Java: super(lado1)
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
