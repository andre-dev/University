<html>
<body>
<?php

//POLIMORFISMO - DUCK TYPING

class Humano{
    
    public function nadar(){
        echo "Nadou...";
    }
    
    public function grasnar(){
        echo "Pegou a fantasia de pato e gritou quack quack";
    }
    
}

class Pato{
    
    public function nadar(){
        echo "Nadou como pato";
    }
    
    public function grasnar(){
        echo "Quack Quack";
    }
    
}

class Floresta{
    
    //NO PHP BASTA TER O METODO DEFINIDO
    //PARA A CHAMADA DO METODO ACONTECER
    //No java humano e pato teriam que ter o mesmo supertipo(Herança ou Interface). No java é chamado de polimorfismo de subtipos. Aqui é Duck Type.
    //Se $alguem for pato sera chamado nadar e grasnar do PATO.
    //Se $alguem for humano sera chamado nadar e grasnar do HUMANO.
    public function agir($alguem){
        $alguem->nadar();
        $alguem->grasnar();
    }
    
}

//PATO E HUMANO NAO POSUEM RELACAO
//HERANCA (OU INTERFACE), OU SEJA,
//UMA NAO EH SUBTIPO DA OUTRA.

$pato = new Pato();
$humano = new Humano();
$i = 9;

$floresta = new Floresta();

$floresta->agir($humano);


?>
</body>
</html>