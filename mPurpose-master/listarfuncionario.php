<html><body>
<?php
// A simple web site in Cloud9 that runs through Apache
// Press the 'Run' button on the top to start the web server,
// then click the URL that is emitted to the Output tab of the console

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

    $resul = pg_query($dbcon, "SELECT * FROM funcionario");
}
if(!$resul){
    
    echo "Erro na query!";
}
else {

    //while($i = pg_fetch_row($result)){
        
        //echo "Matricula: $i[0]  Nome: $i[0]";
    //}
        //echo pg_fetch_row($result[1]);
        //echo pg_fetch_all_columns($result, 1);
        //pg_affected_rows ( resource $resul );
        //echo "<br />\n";
        
        $result = pg_query($dbcon, "SELECT * FROM funcionario");

        $arr = pg_fetch_all_columns($result, 1);

        var_dump($arr);
    }

    
    
    
?>
</body>
</html>