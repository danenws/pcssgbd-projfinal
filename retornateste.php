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

    $result = pg_query($dbcon, "SELECT * FROM public.funcionario;");
}
if(!$result){
    
    echo "Erro na query!";
}
else {

    while($i = pg_fetch_assoc($result)){
        
        echo $i['Matricula'];
        echo "<br />\n";
    
    }

    
}


    
?>
