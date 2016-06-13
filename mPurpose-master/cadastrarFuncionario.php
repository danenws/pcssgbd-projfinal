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
    $matricula = settype($_POST['Matricula'], "int"); 
    $nome = pg_escape_string($_POST['Nome']); 
    $datanasc = ($_POST['Data de Nascimento']);
    $senha = $_POST['Password']; 
    $end = settype($_POST['Endereço'], "int"); 
    $tel = settype($_POST['Telefone'], "int"); 
    $supervisor = settype($_POST['Supervisor'], "int"); 
    $salmin = settype($_POST['Salario Minimo'], "int");
    $categ = settype($_POST['Categoria'], "int"); 
    
    //Armazena as informações no banco
    $query = "INSERT INTO funcionario(matricula, nome, datanascimento, idendereco, idtelefone, idsupervisor, salariomin, idcategoria) 
    VALUES ('$matricula', '$nome', '$datanasc', '$end', '$tel', '$supervisor', '$salmin', '$categ', '$senha')";

    $result = pg_query($dbcon, $query);
}

    
    
?>
