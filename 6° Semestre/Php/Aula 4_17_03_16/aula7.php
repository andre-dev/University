<?php

//ROTA: /classe/metodo/argumentos
//Dessa forma toda página tera um asprecto dinâmico.

//.htaccess

//RewriteEngine On
//RewriteRule ^/?teste/([a-zA-Z_]+)$ aula7.php?param=$1 [L]

class Teste{
    
    public function ola(){
        echo "OLA<br>";
    }
    
    public function outro(){
        echo "Outro<br>";
    }
    
    public function __call($m, $args){
        echo "$m invalido<br>";
    }

}

$a = $_GET["param"];
$t = new Teste();
$t->$a();



//mysql-ctl start
//phpmyadmin-ctl install

?>