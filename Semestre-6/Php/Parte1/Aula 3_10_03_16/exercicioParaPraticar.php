<?php

    // Um animal pode emitirSom e dormir
    // Um cachorro pode cavar, o gato pode arranhar e o urso hibernar.
    // Gato, cachorro e urso são animais.
    // Um transformer e um Idog são robos.
    // Ele podem recarregar e desligar.
    // Sabe-se também que o gato, o cachorro e o Idog podem brincar e o urso, cachorro e transformer podem matar.
    
    // Todos os métodos devem conter apenas echo.
    
   
    interface Acoes
    {
        function brincar();
        function matar();
    }
    
    class Animais implements Acoes{
        private $cachorro, $gato, $urso;
        
        public function __construct($cachorro, $gato, $urso){
            $this->cachorro = $cachorro;
            $this->gato = $gato;
            $this->urso = $urso;
        }
        
        public function emitirSom(){
            echo "Os animais emitiram som <br>";
        }
        
        public function dormir(){
            echo "Os animais dormiram <br>";
        }
        
        public function cavar(){
            echo"O cachorro ".$this->cachorro." cavou. <br>";
        }
        
        public function arranhar(){
            echo"O gato ".$this->gato." arranhou. <br>";
        }
        
        public function hibernar(){
            echo"O urso ".$this->urso." hibernou. <br>";
        }
        
        public function brincar(){
            echo"O gato ".$this->gato." Brincou. <br>";
            echo"O cachorro ".$this->cachorro." Brincou. <br>";
        }
        
        public function matar(){
            echo"O urso ".$this->urso." Matou. <br>";
            echo"O cachorro ".$this->cachorro." Matou. <br>";
        }
    }
    
    class Robos implements Acoes{
        private $transformer, $idog;
        
        public function __construct($transformer, $idog){
            $this->transformer = $transformer;
            $this->idog = $idog;
        }
        
        public function recarregar(){
            echo"Os robos foram recarregados <br>";
        }
        
        public function desligar(){
            echo"Os robos foram desligados <br>";
        }
        
        public function brincar(){
            echo"O iDog ".$this->idog." Brincou. <br>";
        }
        
        public function matar(){
            echo"O transformer ".$this->transformer." Matou. <br>";
        }
    }
    
    $animal = new Animais("Rex","Frajola","Zé");
    $robo = new Robos("Megatron","MiniDog");
    
    $animal->emitirSom();
    $animal->dormir();
    $animal->cavar();
    $animal->arranhar();
    $animal->hibernar();
    $animal->brincar();
    $animal->matar();
    
    $robo->recarregar();
    $robo->desligar();
    $robo->brincar();
    $robo->matar();
    