<!--
2) Crie um formulario contendo os campos baseados na classe
acima e dois botões com valores (XML e JSON). Ao clicar em
XML, mostre o formato XML e em JSON o formato JSON.
OBS: Você deve usar a classe acima já criada.
-->

<form method="POST" action="produto.php">
    <input type="text" name="nome"/>
    <input type="text" name="valor"/>
    <input type="submit" value="toXML" name="metodo"/>
    <input type="submit" value="toJSON" name="metodo"/>
</form>
<?= $data ?>