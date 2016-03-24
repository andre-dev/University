<?php
class Produto{
    public $nome, $valor;
    
    public function __construct($nome, $valor){
        $this->nome = $nome;
        $this->valor = $valor;
    }
    
    public function toXML(){
        //Seta o response para enxergar XML
        header('content-type: text/xml');
        echo "<Produto><nome>". $this->nome ."</nome><valor>". $this->valor ."</valor></Produto>";
    }
    
    public function toJSON(){
        header('content-type: application/json');
        echo json_encode($this);
    }
}

$a = $_POST["metodo"];
$p = new Produto($_POST["nome"],$_POST["valor"]);
$p->$a();
?>