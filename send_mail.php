<?php



/* informe os dados para onde o e-mail será enviado */







$destinatario = "seremcena@seremcena.org.br"; /* E-mail para onde vai o conteúdo do formulário. */



$nomeDestinatario = "seremcena";







/* informe os dados para autenticação do servidor */







$usuario = "webmaster@seremcena.org.br";



$senha = "afasia2014";



$servidor_de_saida = "200.147.36.31";







/* apartir daqui só alterar caso tenha conhecimentos técnicos na utilização do "phpmailer" */







$assunto = $_POST['assunto'];



$mensagem = nl2br("Nome:".$_POST['name']."



Telefone: ". $_POST['phone']."



Celular: ". $_POST['cel']."



E-mail: ". $_POST['email']."



Mensagem:". $_POST['mensagem']);







date_default_timezone_set('Etc/UTC');



include_once("phpmailer/PHPMailerAutoload.php");







$To = $destinatario;



$Subject = $assunto;



$Message = $mensagem;







$Host = "$servidor_de_saida";



$Username = $usuario;



$Password = $senha;



$Port = "587";







$mail = new PHPMailer();



$body = $Message;



$mail->IsSMTP(); 



$mail->Host = $Host; 



$mail->SMTPDebug = 0; 







$mail->SMTPAuth = true;



$mail->Port = $Port;



$mail->Username = $Username;



$mail->Password = $Password;







$mail->SetFrom($usuario, $nomeDestinatario);



$mail->Subject = $Subject;



$mail->MsgHTML($body);



$mail->AddAddress($To, "");







if($mail->Send()) {



	$msg = "Email Enviado com Sucesso!";



}else{



	$msg = "Erro ao Enviar Email.";



}



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



						</ul>



					</li>



					<li><a href="afasia-ser-em-cena.html">Afasia</a></li>



					<li><a href="#">Fotos e Vídeos</a>



						<ul>



							<li>



								<a href="fotos-ser-em-cena.html">Fotos</a>



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



						<li>



							<a href="#">Ser em Cena</a>



							<ul>



								<li><a href="a-ong-ser-em-cena.html">A Associação</a></li>



								<li><a href="agenda-ser-em-cena.html">Agenda</a></li>



								<li><a href="equipe-ser-em-cena.html">Equipe</a></li>



								<li><a href="historico-ser-em-cena.html">Histórico</a></li>



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



						<li><a href="doacoes-ser-em-cena.html">Doações</span></a></li>



						<li><a href="parceiros-ser-em-cena.html">Parceiros</span></a></li>



						<li class="current-menu-item"><a href="contato-ser-em-cena.html">Contato</span></a></li>						



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



						<a href="https://www.facebook.com/ser.emcena.3"  title="Facebook"><img src="img/social/facebook_32.png"  alt="Facebook" /></a>



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



					<span class="head">Contato</span><span class="subhead">Obrigado por entrar em contato.</span>



					<ul class="breadcrumbs">



						<li><a href="index.html">home</a></li>



						<li>/ contato</li>



					</ul>



				</div>



	        	<!-- ENDS masthead -->



	        	



	        	



	        	



	        	<!-- page content -->



	        	<div id="page-content-full">



	        		



					<p><h3><?= $msg ?></h3></p>







				</div>



			



			</div>



			<!-- ENDS content -->



			



			<div class="clearfix"></div>



			<div class="shadow-main"></div>



			



			



		</div>



		<!-- ENDS MAIN -->



		



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



					



					<li class="third-col">						



						<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3658.115413327435!2d-46.6723654!3d-23.528351!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce57f8d0389c7d%3A0x9300384040fe1708!2sR.+Dr.+Costa+J%C3%BAnior%2C+230+-+%C3%81gua+Branca%2C+S%C3%A3o+Paulo+-+SP!5e0!3m2!1spt-BR!2sbr!4v1413336359402" width="252" height="118" frameborder="0" style="border:0"></iframe>						



					</li>	



				</ul>				



				<div class="clearfix"></div>



				<div style="padding-left: 15px;">
					<img class="logos_rodape lei-incentivo" src="img/rodape/lei-de-incentivo-a-cultura-logo.png" alt="Alt text" />
					<img class="logos_rodape" src="img/rodape/ministerio-da-cultura.png" alt="Alt text" />
					<img class="logos_rodape" src="img/rodape/itau.png" alt="Alt text" />
					<img class="logos_rodape" src="img/rodape/ventil.png" alt="Alt text" />
					<img class="logos_rodape" src="img/rodape/brasil.png" alt="Alt text" />
					<p class="autor">
						Desenvolvido por <a href="http://www.colorpixcomunicacao.com.br"><strong>Color Pix.</strong></a>
					</p>
				</div>		



			</div>



			



			<div id="to-top"></div>



		</footer>



		



	</body>



	



</html>