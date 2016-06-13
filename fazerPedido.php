<?php


//String que armazena os parâmetros do banco de dados para estabelecer a conexão
$dbconString = "host = localhost dbname = roupasexclusivas user = postgres password = root";

//Estabelece a conexão com o bd 
$dbcon = pg_connect($dbconString); 

//Teste de conexão

if(!$dbcon){
    
    echo "Ops! Erro na conexão :( \n";
    exit;
}

else {
    
    //Armazena em variáveis  as informações digitadas no formulário
    
    $nome = pg_escape_string($_POST['Nome']); 
    $tel = settype($_POST['Telefone'], "int"); 
    $categ = settype($_POST['Categoria'], "int"); 
    $desc = settype($_POST['Descrição'], "int"); 
    $modelo = settype($_POST['Modelo'], "int"); 
    
    //Armazena as informações no banco
    $query = "INSERT INTO peca(modelo, descricao, categoria) 
    VALUES ('$modelo', '$desc', '$categ')";

    $result = pg_query($dbcon, $query);
}

    
    
?>
