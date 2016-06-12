<!DOCTYPE html>
<html>
<head>
<style>
table, th, td {
     border: 1px solid black;
}
</style>
</head>
<body>

<?php
$servername = "localhost";
$username = "postgres";
$password = "root";
$dbname = "roupasexclusivas";

$dbconString = "host = localhost dbname = roupasexclusivas user = postgres password = root";

// Criar conexao
$con = pg_connect($dbconString); 
// Verificar conexao
if(!$con){
    
    echo "Ops! Erro na conexão :( \n";
    exit;
}

else {

    $sql = "SELECT matricula, nome, datanascimento FROM funcionario";
    $result = pg_query($con,$sql);
    
    if(!$result){
    echo "Erro na query!";
    }
    
    else {
        if (pg_affected_rows($result) > 0) {
             echo "<table>
             <tr><th>ID</th><th>Name</th><th>Data de Nascimento</th></tr>";
             // output data of each row
             while($row = pg_fetch_assoc($result)) {
                 echo "<tr>
                 <td>" . $row["matricula"]. "</td>
                 <td>" .$row["nome"]. "</td> 
                 <td>" .$row["datanascimento"]. "</td>
                 </tr>";
             }
             echo "</table>";
        } else {
             echo "0 results";
        }
    }
        
    pg_close($con);
}

?>  

</body>
</html>