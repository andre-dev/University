<?php
/*
1) Crie a classe Produto. Esta classe possui dois atributos
nome e valor. Faca os métodos toXML() e toJSON() que mostra
um Produto em formato JSON e XML respectivamente.

Exemplo:
a) XML:
<Produto>
   <nome> Lapis </nome>
   <valor> 1.50 </valor>
</Produto>
b) JSON: {nome : "Lapis", valor : 1.50}

carl -- data "metodo=toXML&nome=Papel&valor=10 https://aulaphp2-romefeller.users.io/simu"
*/

class Produto{
    private $nome, $valor;
    
    public function __construct($nome, $valor){
        $this->nome = $nome;
        $this->valor = $valor;
    }
    
    
    public function toXML(){
        header('content-type: text/xml');
        echo "<Produto><nome>". $this->nome ."</nome><valor>". $this->valor ."</valor></Produto>";
    }
    public function toJSON(){
        header('content-type: application/json');
        echo json_encode($this);
        //Resposta do Garcia: O $this aqui pega tudo automatico do objeto.
        //echo"{nome: ".$this->nome.", valor: ".$this->valor."}";
    }
}

$a = $_POST["metodo"];
$p = new Produto($_POST["nome"],$_POST["valor"]);
$p->$a();
?>
