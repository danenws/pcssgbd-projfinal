<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8"
    <title>Listar Funcionarios</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/icomoon-social.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,600,800' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="css/leaflet.css" />
		<link rel="stylesheet" href="css/main.css">

        <script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    
    
    <link rel="stylesheet" href="css/reset-table.css">

    
        <style>
            /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
            body {
            	background: #fafafa url(http://jackrugile.com/images/misc/noise-diagonal.png);
            	color: #444;
            	font: 100%/30px 'Helvetica Neue', helvetica, arial, sans-serif;
            	text-shadow: 0 1px 0 #fff;
            }
            
            strong {
            	font-weight: bold; 
            }
            
            em {
            	font-style: italic; 
            }
            
            table {
            	background: #f5f5f5;
            	border-collapse: separate;
            	box-shadow: inset 0 1px 0 #fff;
            	font-size: 12px;
            	line-height: 24px;
            	margin: 30px auto;
            	text-align: left;
            	width: 800px;
            }	
            
            th {
            	background: url(http://jackrugile.com/images/misc/noise-diagonal.png), linear-gradient(#777, #444);
            	border-left: 1px solid #555;
            	border-right: 1px solid #777;
            	border-top: 1px solid #555;
            	border-bottom: 1px solid #333;
            	box-shadow: inset 0 1px 0 #999;
            	color: #fff;
              font-weight: bold;
            	padding: 10px 15px;
            	position: relative;
            	text-shadow: 0 1px 0 #000;	
            }
            
            th:after {
            	background: linear-gradient(rgba(255,255,255,0), rgba(255,255,255,.08));
            	content: '';
            	display: block;
            	height: 25%;
            	left: 0;
            	margin: 1px 0 0 0;
            	position: absolute;
            	top: 25%;
            	width: 100%;
            }
            
            th:first-child {
            	border-left: 1px solid #777;	
            	box-shadow: inset 1px 1px 0 #999;
            }
            
            th:last-child {
            	box-shadow: inset -1px 1px 0 #999;
            }
            
            td {
            	border-right: 1px solid #fff;
            	border-left: 1px solid #e8e8e8;
            	border-top: 1px solid #fff;
            	border-bottom: 1px solid #e8e8e8;
            	padding: 10px 15px;
            	position: relative;
            	transition: all 300ms;
            }
            
            td:first-child {
            	box-shadow: inset 1px 0 0 #fff;
            }	
            
            td:last-child {
            	border-right: 1px solid #e8e8e8;
            	box-shadow: inset -1px 0 0 #fff;
            }	
            
            tr {
            	background: url(http://jackrugile.com/images/misc/noise-diagonal.png);	
            }
            
            tr:nth-child(odd) td {
            	background: #f1f1f1 url(http://jackrugile.com/images/misc/noise-diagonal.png);	
            }
            
            tr:last-of-type td {
            	box-shadow: inset 0 -1px 0 #fff; 
            }
            
            tr:last-of-type td:first-child {
            	box-shadow: inset 1px -1px 0 #fff;
            }	
            
            tr:last-of-type td:last-child {
            	box-shadow: inset -1px -1px 0 #fff;
            }	
            
            tbody:hover td {
            	color: transparent;
            	text-shadow: 0 0 3px #aaa;
            }
            
            tbody:hover tr:hover td {
            	color: #444;
            	text-shadow: 0 1px 0 #fff;
            }
    </style>

    
        <script src="js/prefixfree.min.js"></script>

    
  </head>

  <body>
      
       <!-- Navigation & Logo-->
        <div class="mainmenu-wrapper">
	        <div class="container">
	        	<div class="menuextras">
					<div class="extras">
						<ul>
							<li class="shopping-cart-items"><i class="glyphicon glyphicon-shopping-cart icon-white"></i> 
							<a href="page-shopping-cart.html"><b>0 items</b></a></li>
							<li>
								<!--<div class="dropdown choose-country">
									<a class="#" data-toggle="dropdown" href="#"><img src="img/flags/gb.png" alt="Great Britain"> UK</a>
									<ul class="dropdown-menu" role="menu">
										<li role="menuitem"><a href="#"><img src="img/flags/us.png" alt="United States"> US</a></li>
										<li role="menuitem"><a href="#"><img src="img/flags/de.png" alt="Germany"> DE</a></li>
										<li role="menuitem"><a href="#"><img src="img/flags/es.png" alt="Spain"> ES</a></li>
									</ul>
								</div>-->
							</li>
			        		<li><a href="page-login.html">Login</a></li>
			        	</ul>
					</div>
		        </div>
		        <nav id="mainmenu" class="mainmenu">
					<ul>
						<li class="logo-wrapper"><a href="index.html"><img src="img/mPurpose-logo.png" alt="Multipurpose Twitter Bootstrap Template"></a></li>
						<li>
							<a href="index.html">Home</a>
						</li>
						<li>
							<a href="features.html">Criar Cadastro</a>
						</li>
						<li>
							<a href="listarfuncionario3.php">Funcion&aacuterios</a>
						</li>
						<li class="has-submenu active">
							<a href="#">Fazer Pedido</a>
							<div class="mainmenu-submenu">
								<div class="mainmenu-submenu-inner"> 
											<div>
										<h4>Homepage</h4>
										<ul>
											<li><a href="index.html">Homepage (Sample 1)</a></li>
											<li><a href="page-homepage-sample.html">Homepage (Sample 2)</a></li>
										</ul>
										
									</div>
							</div>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		
		
      
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
            
                $sql = "SELECT matricula, nome, datanascimento, salariomin FROM funcionario";
                $result = pg_query($con,$sql);
                
                if(!$result){
                echo "Erro na query!";
                }
                
                else {
                    if (pg_affected_rows($result) > 0) {
                         echo " <table>
                                  <thead>
                                    <tr>
                                      <th>Matricula</th>
                                      <th>Nome</th>
                                      <th>Data de Nascimento</th>
                                      <th>Salario Minimo</th>
                                    </tr>
                                  </thead>
                                  <tbody>";
                         // data output de cada row
                         while($row = pg_fetch_assoc($result)) {
                             echo "<tr>
                             <td>" . $row["matricula"]. "</td>
                             <td>" .$row["nome"]. "</td> 
                             <td>" .$row["datanascimento"]. "</td>
                             <td>" .$row["salariomin"]. "</td>
                             </tr>";
                         }
                         echo " </tr>
                              </tbody>
                            </table>";
                    } else {
                         echo "0 results";
                    }
                }
                    
                pg_close($con);
            }
            
            ?>  


    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
                            
    <script src="js/index.js"></script>
    
    <!-- Footer -->
	    <div class="footer">
	    	<div class="container">
		    	<div class="row">
		    		<!--<div class="col-footer col-md-3 col-xs-6">
		    			<h3>Our Latest Work</h3>
		    			<div class="portfolio-item">
							<div class="portfolio-image">
								<a href="page-portfolio-item.html"><img src="img/portfolio6.jpg" alt="Project Name"></a>
							</div>
						</div>
		    		</div>-->
		    		
		    		
		    		<div class="col-footer col-md-4 col-xs-6">
		    			<h3>Contacts</h3>
		    			<p class="contact-us-details">
	        				<b>Address:</b> Av. Pasteur 458, Urca, Rio de Janeiro, Brasil<br/>
	        				<b>Phone:</b> +55 21 1234-5678<br/>
	        				<b>Email:</b> <a href="mailto:contato@purpose.com">contato@purpose.com</a></p>
		    		</div>
		    		<div class="col-footer col-md-2 col-xs-6">
		    			<h3>Stay Connected</h3>
		    			<ul class="footer-stay-connected no-list-style">
		    				<li><a href="#" class="facebook"></a></li>
		    				<li><a href="#" class="twitter"></a></li>
		    				<li><a href="#" class="googleplus"></a></li>
		    			</ul>
		    		</div>
		    	</div>
		    	<div class="row">
		    		<div class="col-md-12">
		    			<div class="footer-copyright">&copy; 2016 mPurpose. All rights reserved.</div>
		    		</div>
		    	</div>
		    </div>
	    </div>

        <!-- Javascripts -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/jquery-1.9.1.min.js"><\/script>')</script>
        <script src="js/bootstrap.min.js"></script>
        <script src="http://cdn.leafletjs.com/leaflet-0.5.1/leaflet.js"></script>
        <script src="js/jquery.fitvids.js"></script>
        <script src="js/jquery.sequence-min.js"></script>
        <script src="js/jquery.bxslider.js"></script>
        <script src="js/main-menu.js"></script>
        <script src="js/template.js"></script>

  </body>
</html>