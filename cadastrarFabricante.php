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
    //$matricula = settype($_POST['Matricula'], "int"); 
    $nome = pg_escape_string($_POST['Nome']); 
    $end = settype($_POST['Endereço'], "int"); 
    $tel = settype($_POST['Telefone'], "int"); 
    $desc = ($_POST['Descrição']);
   
    
    //Armazena as informações no banco
    $query = "INSERT INTO fabricante(nome, idtelefone, idendereco, descricao) 
    VALUES ('$nome', ' '$tel', $end', '$desc')";

    $result = pg_query($dbcon, $query);
}

    
    
?>
