<?php

//ROTA: /classe/metodo/argumentos
//Dessa forma toda página tera um asprecto dinâmico.

//.htaccess

//RewriteEngine On
//RewriteRule ^/?teste/([a-zA-Z_]+)$ aula7.php?param=$1 [L]

//mysql-ctl start
//phpmyadmin-ctl install
// Username: andre_dev

class Teste{
    
    
    
    public function cadastro(){
        
        //Interpolacao
        //A pagina form.php é colocada aqui.
        //Então, aparecera o form e a variavel $data.
        //Como $data recebeu o valor teste, este apareceu na página.
        
        $data = "TESTE";
        require_once "form.php";
    }
    
    public function ola(){
        echo "<h3<OLA<br></h3>";
    }
    
    public function outro(){
        echo "Outro<br>";
    }
    
    public function __call($m, $args){
        echo "$m invalido<br>";
    }
    
    public function insert(){
        $nome = $_POST["nome"];
        $mysqli = new mysqli("127.0.0.1", "andre_dev", "", "teste");
        if ($mysqli->connect_errno) {
            echo "Falha no MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
        }
        $stmt = $mysqli->prepare("INSERT INTO User(name) VALUES (?)"); //Proteção SqlInjection
        $stmt->bind_param("s",$nome); //Passo "s" como string
        if (!$stmt->execute()) { //Se falso erro
            echo "Erro: (" . $stmt->errno . ") " . $stmt->error . "<br>";
        }else{
            echo $nome . " Inserido com sucesso <br>";
        }
        $stmt->close();
    }
    
    public function listar(){
        $mysqli = new mysqli("127.0.0.1", "andre_dev", "", "teste");
        $stmt = $mysqli->prepare("SELECT * FROM User");
        $stmt->execute();
        $row = $stmt->get_result()->fetch_all();//Tras todos os resultados em um vetor
        //var_dump($row);
        echo "<ul>";
        foreach($row as $usuario){
            echo "<li> $usuario[1] </li>";
        }
        echo "</ul>";
    }

}

$a = $_GET["param"];
$t = new Teste();
$t->$a();


?>