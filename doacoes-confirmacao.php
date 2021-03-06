<?php
    require $_SERVER['DOCUMENT_ROOT'] . '/MVC/Models/DonationsManager.php';

    date_default_timezone_set('UTC');
    $date = new DateTime('now');
    $orderId = $date->format('dis') . substr($_POST['documento'], 0, 2);

    $codEmp = "j0070519160001100000014514";
    $chave = "2o1s0c7i2p0s0e4c";
    $pedido = $orderId;
    $valor = $_POST['valor'];
    $emailSacado = $_POST['emailSacado'];
    $nomeSacado = $_POST['nomeSacado'];
    $codigoInscricao = $_POST['codigoInscricao'];
    $numeroInscricao = $_POST['documento'];
    $enderecoSacado = $_POST['endereco'] . "," . $_POST['numero'];
    $bairroSacado = $_POST['bairro'];
    $cepSacado = $_POST['cep'];
    $cidadeSacado = $_POST['cidade'];
    $estadoSacado = $_POST['estado'];
    $urlRetorna = "/retorno.html";
    $observacao = null;
    $obsAd1 = null;
    $obsAd2 = null;
    $obsAd3 = null;

    $donationData = array(
        'valor'        => $valor, 
        'nome'         => $nomeSacado, 
        'email'        => $emailSacado, 
        'documento'    => $numeroInscricao, 
        'due_date'     => "",
        'increment_id' => $pedido
    );

    $donationsManager = new DonationsManager();
    $donationsManager->save($donationData);
?>
<!doctype html>
<html class="no-js">

	<head>
		<meta charset="utf-8"/>
		<title>Ser em Cena</title>
		<!--[if lt IE 9]>
			<script src="js/css3-mediaqueries.js"></script>
		<![endif]-->
		<link rel="stylesheet" media="all" href="css/style.css"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<!-- Adding "maximum-scale=1" fixes the Mobile Safari auto-zoom bug: http://filamentgroup.com/examples/iosScaleBug/ -->
		
		
		<!-- JS -->
		<script src="js/jquery-1.6.4.min.js"></script>
		
		<!--  <script src="js/less-grid-4.js"></script> -->
		<script src="js/custom.js"></script>
		<script src="js/tabs.js"></script>
		<script src="js/moveform.js"></script>
		
		<!-- Masonry -->
		<script src="js/masonry.min.js" ></script>
		<script src="js/imagesloaded.js" ></script>
		<!-- ENDS Masonry -->
		
		<!-- Tweet -->
		<link rel="stylesheet" href="css/jquery.tweet.css" media="all"  /> 
		<script src="js/tweet/jquery.tweet.js" ></script> 
		<!-- ENDS Tweet -->
		
		<!-- superfish -->
		<link rel="stylesheet" media="screen" href="css/superfish.css" /> 
		<script  src="js/superfish-1.4.8/js/hoverIntent.js"></script>
		<script  src="js/superfish-1.4.8/js/superfish.js"></script>
		<script  src="js/superfish-1.4.8/js/supersubs.js"></script>
		<!-- ENDS superfish -->
		
		<!-- prettyPhoto -->
		<script  src="js/prettyPhoto/js/jquery.prettyPhoto.js"></script>
		<link rel="stylesheet" href="js/prettyPhoto/css/prettyPhoto.css"  media="screen" />
		<!-- ENDS prettyPhoto -->
		
		<!-- poshytip -->
		<link rel="stylesheet" href="js/poshytip-1.1/src/tip-twitter/tip-twitter.css"  />
		<link rel="stylesheet" href="js/poshytip-1.1/src/tip-yellowsimple/tip-yellowsimple.css"  />
		<script  src="js/poshytip-1.1/src/jquery.poshytip.min.js"></script>
		<!-- ENDS poshytip -->
		
		
		<!-- GOOGLE FONTS -->
		<link href='http://fonts.googleapis.com/css?family=Allan:700' rel='stylesheet' type='text/css'>
		
		<!-- Flex Slider -->
		<link rel="stylesheet" href="css/flexslider.css" >
		<script src="js/jquery.flexslider-min.js"></script>
		<!-- ENDS Flex Slider -->
		
		
		<!--[if IE 6]>
		<link rel="stylesheet" href="css/ie6-hacks.css" media="screen" />
		<script type="text/javascript" src="js/DD_belatedPNG.js"></script>
			<script>
          		/* EXAMPLE */
          		DD_belatedPNG.fix('*');
        	</script>
		<![endif]-->
		
		<!-- Lessgrid -->
		<link rel="stylesheet" media="all" href="css/lessgrid.css"/>
		
		<!-- modernizr -->
		<script src="js/modernizr.js"></script>

		<!--Mascaras-->
		<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
        <script type="text/javascript" src="js/jquery.mask.min.js"></script>
    </head>
	
	<body lang="en">
	

		<!-- mobile-nav -->
		<div id="mobile-nav-holder">
			<div class="wrapper">
				<ul id="mobile-nav">
					<li>
						<a href="#">Ser em Cena</a>
						<ul>
							<li><a href="a-ong-ser-em-cena.html">A Associação</a></li>
							<li><a href="agenda-ser-em-cena.html">Agenda</a></li>
							<li><a href="equipe-ser-em-cena.html">Equipe</a></li>
							<li><a href="historico-ser-em-cena.html">Histórico</a></li>
							<li><a href="oficinas-ser-em-cena.html">Oficinas</a></li>
						</ul>
					</li>
					<li><a href="afasia-ser-em-cena.html">Afasia</a></li>
					<li><a href="#">Fotos e Vídeos</a>
						<ul>
							<li><a href="fotos-ser-em-cena.html">Fotos</a></li>
							<li><a href="videos-ser-em-cena.html">Vídeos</a></li>
							<li><a href="materias-ser-em-cena.html">Matérias</a></li>
						</ul>
					</li>
					<li><a href="doacoes-ser-em-cena.html">Doações</a></li>
					<li><a href="parceiros-ser-em-cena.html">Parceiros</a></li>
					<li class="current-menu-item"><a href="contato-ser-em-cena.html">Contato</a></li>
				</ul>
				<div id="nav-open"><a href="#">Menu</a></div>
			</div>
		</div>
		<!-- ENDS mobile-nav -->
			
		<header>
			
				
			<div class="wrapper">
					
				<a href="index.html" id="logo"><img  src="img/logo.png" alt="Tandem"></a>
				
				<nav>
					<ul id="nav" class="sf-menu">
						<li class="current-menu-item">
							<a href="#">Ser em Cena</a>
							<ul>
								<li><a href="a-ong-ser-em-cena.html">A Associação</a></li>
								<li><a href="agenda-ser-em-cena.html">Agenda</a></li>
								<li><a href="equipe-ser-em-cena.html">Equipe</a></li>
								<li><a href="historico-ser-em-cena.html">Histórico</a></li>
								<li><a href="oficinas-ser-em-cena.html">Oficinas</a></li>
							</ul>
						</li>
						<li><a href="afasia-ser-em-cena.html">Afasia</a></li>
						<li><a href="#">Fotos e Vídeos</span></a>
							<ul>
								<li>
									<a href="#">Fotos</a>
									<ul>
										<li><a href="fotos-espetaculos-ser-em-cena.html">Espetáculos</a></li>
										<li><a href="fotos-oficinas-ser-em-cena.html">Oficinas</a></li>
										<li><a href="fotos-passeios-ser-em-cena.html">Passeios Culturais</a></li>
									</ul>
								</li>
								<li><a href="videos-ser-em-cena.html">Vídeos</a></li>
								<li><a href="materias-ser-em-cena.html">Matérias</a></li>
							</ul>
						</li>
						<li class="current-menu-item"><a href="doacoes-ser-em-cena.html">Doações</span></a></li>
						<li><a href="parceiros-ser-em-cena.html">Parceiros</span></a></li>
						<li><a href="contato-ser-em-cena.html">Contato</span></a></li>						
					</ul>
				</nav>
				
				<div class="clearfix"></div>
				
			</div>
		</header>
	
	
	
	
		<!-- MAIN -->
		<div id="main">
				
			<!-- social -->
			<div id="social-bar">
				<ul>
					<li>
						<a href="http://www.facebook.com"  title="Facebook"><img src="img/social/facebook_32.png"  alt="Facebook" /></a>
					</li>
					<!--<li>
						<a href="http://www.twitter.com" title="Tweeter"><img src="img/social/twitter_32.png"  alt="Facebook" /></a>
					</li>
					<li>
						<a href="http://www.google.com"  title="Google +"><img src="img/social/google_plus_32.png" alt="Facebook" /></a>
					</li>-->
				</ul>
			</div>
			<!-- ENDS social -->
			
			
			
			<!-- Content -->
			<div id="content">
			
				<!-- masthead -->
		        <div id="masthead">
					<span class="head">Doações - Passo 2</span><span class="subhead">Faça sua Doação</span>
					<ul class="breadcrumbs">
						<li><a href="index.html">home</a></li>
						<li>/ doações</li>
					</ul>
				</div>
	        	<!-- ENDS masthead -->

	        	<div id="page-content-full">
	        		
					<p>
						Com o seu cadastro em nosso banco de dados, você também receberá informativos sobre as atividades da Ser em Cena para que acompanhe nossas ações.
					</p>

				</div>
	        	
	        	
	        	
	        	<!-- page content -->
	        	<div id="page-content">										
                    <p>Muito Obrigado <strong><?= $nomeSacado ?></strong>, clique em confirmar doação para ser redirecionado a página de pagameto.<br><br>
                    <b style="font-size: 14px;">Habilite seu pop-up para poder efetuar o pagamento.</b><br><br>
                    </p>
					<?php
						require 'Itaucripto.php';
                        $cripto = new Itaucripto();
                        $dados = $cripto->geraDados(
                            $codEmp, 
                            $pedido, 
                            $valor, 
                            $observacao, 
                            $chave, 
                            $nomeSacado, 
                            $codigoInscricao, 
                            $numeroInscricao, 
                            $enderecoSacado, 
                            $bairroSacado, 
                            $cepSacado, 
                            $cidadeSacado, 
                            $estadoSacado, 
                            $dataVencimento, 
                            $urlRetorna, 
                            $obsAd1, 
                            $obsAd2, 
                            $obsAd3
                        );
                    ?>

                    <form action="https://shopline.itau.com.br/shopline/shopline.aspx" method="post" id="pagamento" name="pagamento" onsubmit="carregabrw()" target="SHOPLINE">
                        <input type="hidden"name="DC" value="<?php echo $dados; ?>">
                        <input type="submit"name="Shopline" class="link-button blue" value="Confirma Doação">
                    </form>
	        	</div>
                <!-- ENDS page content -->

                <script language="JavaScript">
                    function carregabrw() {
                        window.open('', 'SHOPLINE', "toolbar=yes,menubar=yes,resizable=yes,status=no,scrollbars=yes,width=815,height=575");
                    }
                </script>
			
			</div>
			<!-- ENDS content -->
			
			<div class="clearfix"></div>
			<div class="shadow-main"></div>
			
			
		</div>
		<!-- ENDS MAIN -->
		
		<!-- Footer Start -->
		<footer>
			<div class="wrapper">			
				<ul id="footer-cols">					
					<li class="first-col">						
						<div class="widget-block">
							<h4>Contatos</h4>
							<p>seremcena@seremcena.org.br<br/>
							(11) 3801-8166<br/>
							(11) 3862-7018</p>
						</div>
					</li>					
					<li class="second-col">						
						<div class="widget-block">
							<h4>Endereço</h4>
							<p>Rua Doutor Costa Junior, 230<br/>
							São Paulo - SP<br/>
							CEP. 05002-000</p>
						</div>						
					</li>					
					<li class="third-col"></li>	
				</ul>				
				<div class="clearfix"></div>		
			</div>
			<div class="partners">
				<div class="wrapper">
					<div class="row">
						<div class="col1">
							<div class="brands">
								<img src="img/rodape/lei-de-incentivo.jpg"/>
							</div>
						</div>
						<div class="col2">
							<div class="row">
								<div class="brands">
									<img src="img/rodape/cultura.jpg"/>
								</div>
								<div class="brands">
									<img src="img/rodape/cidadania.jpg"/>
								</div>
								<div class="brands">
									<img src="img/rodape/governo.jpg"/>
								</div>
							</div>
						</div>
						<div class="col2-responsive">
							<img src="img/rodape/gov-min-responsive.png"/>
						</div>
					</div>
					<div class="row">
						<div class="author"><p>Desenvolvido por <strong>Logica W3</strong></p></div>
					</div>
				</div>
			</div>
		</footer>
		<!-- Footer End -->
		
	</body>
	
	
	
</html>