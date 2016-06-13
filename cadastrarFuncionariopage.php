<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Purpose</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/icomoon-social.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,600,800' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="css/leaflet.css" />
		<!--[if lte IE 8]>
		    <link rel="stylesheet" href="css/leaflet.ie.css" />
		<![endif]-->
		<link rel="stylesheet" href="css/main.css">

        <script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    <body>
        

        <!-- Navigation & Logo-->
        <div class="mainmenu-wrapper">
	        <div class="container">
	        	<div class="menuextras">
					<div class="extras">
						<ul>
							<li class="shopping-cart-items"><i class="glyphicon glyphicon-shopping-cart icon-white"></i> <a href="page-shopping-cart.html"><b>0 items</b></a></li>
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
										
								</div><!-- /mainmenu-submenu-inner -->
							</div><!-- /mainmenu-submenu -->
						</li>
					</ul>
				</nav>
			</div>
		</div>

        <!-- Page Title -->
		<div class="section section-breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1>Cadastrar Funcionario</h1>
					</div>
				</div>
			</div>
		</div>
        
        <div class="section">
	    	<div class="container">
				<div class="row">
					<div class="col-sm-5">
						<div class="basic-login">
							<form action="cadastrarFuncionario.php" method="POST" role="form">
								<div class="form-group">
		        				 	<label for="register-username"><i class="icon-user"></i> <b>Matricula</b></label>
									<input class="form-control" name="matricula" id="matricula" type="number" placeholder="">
								</div>
								<div class="form-group">
		        				 	<label for="register-username"><i class="icon-user"></i> <b>Nome</b></label>
									<input class="form-control" name="nome" id="nome" type="text" placeholder="">
								</div>
								<div class="form-group">
		        				 	<label for="register-username"><i class="icon-user"></i> <b>Data de Nascimento</b></label>
									<input class="form-control" name="datanascimento" id="datanascimento" type="date" placeholder="">
								</div>
								<div class="form-group">
		        				 	<label for="register-password"><i class="icon-lock"></i> <b>Senha</b></label>
									<input class="form-control" name="senha" id="senha" type="password" placeholder="">
								</div>
								<div class="form-group">
		        				 	<label for="register-password"><i class="icon-lock"></i> <b>Endereço</b></label>
									<input class="form-control" name="endereco" id="endereco" type="number" placeholder="">
								</div>
								<div class="form-group">
		        				 	<label for="register-password"><i class="icon-lock"></i> <b>Telefone</b></label>
									<input class="form-control" name="telefone" id="telefone" type="number" placeholder="">
								</div>
								
								<div class="form-group">
		        				 	<select id="animal" name="animal">                      
									  <option value="0">--Select Animal--</option>
									  
									  <?php
									    $dbconString = "host = localhost dbname = roupasexclusivas user = postgres password = root";
									     // Criar conexao
							            $con = pg_connect($dbconString); 
							            // Verificar conexao
							            if(!$con){
							                
							                echo "Ops! Erro na conexão :( \n";
							                exit;
							            }
							            
							            else {
							            
							                $sql = "SELECT matricula, nome FROM funcionario";
							                $result = pg_query($con,$sql);
							                
										while ($row = pg_fetch_assoc($result)) {
										echo '<option value="'.htmlspecialchars($row['matricula']).'">'.htmlspecialchars($row['nome']).'</option>';}
										pg_close($con);
									  ?>
									</select>
								</div>
								
								
								<div class="form-group">
		        				 	<label for="register-password"><i class="icon-lock"></i> <b>Supervisor</b></label>
									<input class="form-control" name="supervisor" id="supervisor" type="number" placeholder="">
								</div>
								<div class="form-group">
		        				 	<label for="register-password"><i class="icon-lock"></i> <b>Categoria</b></label>
									<input class="form-control" name="categoria" id="categoria" type="text" placeholder="">
								</div>
								<div class="form-group">
		        				 	<label for="register-password"><i class="icon-lock"></i> <b>Salario Minimo</b></label>
									<input class="form-control" name="salariominimo" id="salariominimo" type="number" placeholder="">
								</div>
								<div class="form-group">
									<button type="submit" class="btn pull-right">Register</button>
									<div class="clearfix"></div>
								</div>
							</form>
						</div>
					</div>
				<!--	<div class="col-sm-6 col-sm-offset-1 social-login">
						<p>You can use your Facebook or Twitter for registration</p>
						<div class="social-login-buttons">
							<a href="#" class="btn-facebook-login">Use Facebook</a>
							<a href="#" class="btn-twitter-login">Use Twitter</a>
						</div>
					</div>-->
				</div>
			</div>
		</div>

	    <!-- Footer -->
	    <div class="footer">
	    	<div class="container">
		    	<div class="row">
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
		    			<div class="footer-copyright">&copy; 2016 Purpose. All rights reserved.</div>
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