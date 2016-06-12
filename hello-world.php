<html><body>
<?php
// A simple web site in Cloud9 that runs through Apache
// Press the 'Run' button on the top to start the web server,
// then click the URL that is emitted to the Output tab of the console

//String que armazena os parâmetros do banco de dados para estabelecer a conexão
$dbconString = "host = localhost port = 5433 dbname = RoupasExclusivas user = postgres password = admin";

//Estabelece a conexão com o bd 
$dbcon = pg_connect($dbconString); 

//Teste

if(!$dbcon){
    
    echo "Ops! Erro...\n";
    exit;
}
else {

    $resul = pg_query($dbcon, "SELECT matricula, nome FROM funcionario");
}

while($i = pg_fetch_row($result)){
    
    echo "Matricula: $i[0]  Nome: $i[1]";
    echo "<br />\n";
}
    
    
    
?>
</body>
</html>