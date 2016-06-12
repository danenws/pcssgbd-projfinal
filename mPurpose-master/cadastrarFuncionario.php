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
    $matricula = pg_escape_string($_POST['Matricula']); 
    $nome = pg_escape_string($_POST['Nome']); 
    $data = pg_escape_string($_POST['Data de Nascimento']);
    $datanasc = "to_date('$data', "YYYY-MM-DD");
    $senha = pg_escape_string($_POST['Password']); 
    $end = pg_escape_string($_POST['Endereço']); 
    $tel = pg_escape_string($_POST['Telefone']); 
    $supervisor = pg_escape_string($_POST['Supervisor']); 
    $salmin = pg_escape_string($_POST['Salario Minimo']);
    $categ = pg_escape_string($_POST['Categoria']); 
    
    //Armazena as informações no banco
    $query = "INSERT INTO funcionario(matricula, nome, datanascimento, idendereco, idtelefone, idsupervisor, salariomin, idcategoria) 
    VALUES ('$matricula', '$nome', '$datanasc', '$end', '$tel', '$supervisor', '$salmin', '$categ')";

    $result = pg_query($dbcon, $query);
}

    
    
?>
