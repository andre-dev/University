<?php

    // Um animal pode emitirSom e dormir
    // Um cachorro pode cavar, o gato pode arranhar e o urso hibernar.
    // Gato, cachorro e urso são animais.
    // Um transformer e um Idog são robos.
    // Ele podem recarregar e desligar.
    // Sabe-se também que o gato, o cachorro e o Idog podem brincar e o urso, cachorro e transformer podem matar.
    
    // Todos os métodos devem conter apenas echo.
    
    class Animal{
        private $cachorro, $gato, $urso;
        
        public function __construct($cachorro, $gato, $urso){
            $this->cachorro = $cachorro;
            $this->gato = $gato;
            $this->urso = $urso;
        }
        
        public function emitirSom(){
            
        }
        
        public function dormir(){
            
        }
    }
    
    class Robos{
        private $transformer, $idog;
        
        public function __construct($transformer, $idog){
            $this->transformer = $transformer;
            $this->idog = $idog;
        }
    }