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
    $matricula = pg_escape_string($_POST['matricula']); 
    $nome = pg_escape_string($_POST['nome']); 
    $data = pg_escape_string($_POST['datanascimento']); 
    $senha = pg_escape_string($_POST['senha']); 
    $end = pg_escape_string($_POST['endereco']); 
    $tel = pg_escape_string($_POST['telefone']); 
    $supervisor = pg_escape_string($_POST['supervisor']); 
    $categ = pg_escape_string($_POST['categoria']); 
    $salmin = pg_escape_string($_POST['salariominimo']);
    
    
    //Armazena as informações no banco
    $query = "INSERT INTO funcionario(matricula, nome, datanascimento, idendereco, idtelefone, idsupervisor, salariomin, idcategoria) 
    VALUES ('$matricula', '$nome', '$data', '$end', '$tel', '$supervisor', '$salmin', '$categ')";

    $result = pg_query($dbcon, $query);
}

    
    
?>
