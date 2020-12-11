<%
Response.Charset = "UFT-8"
%>

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
		<script type="text/javascript">
			$(document).ready(function() {
				$("#valor").mask("00.000.000.000.000,00");
				$("#valor").css('text-align','right');
				$("#cel").mask("(99) 9 9999-9999");

				$("#cep").on("keyup", function(event) {
					var cep = $(this).val();
					if (cep.length == 8) {
						//Nova variável "cep" somente com dígitos.
						var cep = cep.replace(/\D/g, '');

						//Verifica se campo cep possui valor informado.
						if (cep != "") {

							//Expressão regular para validar o CEP.
							var validacep = /^[0-9]{8}$/;

							//Valida o formato do CEP.
							if(validacep.test(cep)) {

								//Preenche os campos com "..." enquanto consulta webservice.
								$("#endereco").val("...");
								$("#bairro").val("...");
								$("#cidade").val("...");
								$("#estado").val("...");

								//Consulta o webservice viacep.com.br/
								$.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

									if (!("erro" in dados)) {
										//Atualiza os campos com os valores da consulta.
										$("#endereco").val(dados.logradouro);
										$("#bairro").val(dados.bairro);
										$("#cidade").val(dados.localidade);
										$("#estado").val(dados.uf);
									} //end if.
									else {
										//CEP pesquisado não foi encontrado.
										limpa_formulario_cep();
										alert("CEP não encontrado.");
									}
								});
							} //end if.
							else {
								//cep é inválido.
								limpa_formulario_cep();
								alert("Formato de CEP inválido.");
							}
						} //end if.
						else {
							//cep sem valor, limpa formulário.
							limpa_formulario_cep();
						}
					}
				});
			});

			function limpa_formulario_cep() {
                // Limpa valores do formulário de cep.
                $("#endereco").val("");
				$("#bairro").val("");
				$("#cep").val("");
				$("#cidade").val("");
				$("#estado").val("");
            }
		</script>		

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
					
					<!-- form -->
					<script type="text/javascript" src="js/form-validation.js"></script>
					<form action="gravar.asp?varid=<%=Request("varid")%>" id="contactForm" name="passo2" method="post">
						<input type="hidden" name="acao" value="passo-2">
						<h3 class="heading">Preencha o Formulário.</h3>
						<div class="error"></div>
						<fieldset>
							<div>								
								<input id="cep" name="cep" maxlength="8" type="text" class="form-poshytip" title="Digite seu CEP" />
								<label>CEP&nbsp;</label>
								<a href="http://www.buscacep.correios.com.br/sistemas/buscacep/BuscaCepEndereco.cfm" style="color: blue" target="_blank">(Não sei meu cep)</a>
							</div>
							<div>
								<input id="endereco" name="endereco" maxlength="40" type="text" class="form-poshytip" title="Digite seu Endereço" />
								<label>Endereço</label>
							</div>
							<div>
								<input id="bairro" name="bairro" maxlength="15" type="text" class="form-poshytip" title="Digite seu Bairro" />
								<label>Bairro</label>
							</div>
							<div>								
								<input id="cidade" name="cidade" maxlength="15" type="text" class="form-poshytip" title="Digite sua Cidade" />
								<label>Cidade</label>
							</div>
							<div>								
								<input id="estado" name="estado" maxlength="15" type="text" class="form-poshytip" title="Digite seu Estado" />
								<label>Estado</label>
							</div>							
							<p>
								<ul class="list-buttons">
									<li><a href="javascript:ValidarInformacoes('passo-2');" class="link-button blue">Próxima Etapa</a></li>
								</ul>
							</p>
						</fieldset>
						
					</form>						
	        		
	        	</div>
	        	<!-- ENDS page content -->				
			
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
						<img class="all-brands-2021" src="img/rodape/all-brands-2021.jpg" style="width: 100%;"/>
						<img class="first-brands-2021-responsive" src="img/rodape/first-brands-2021-responsive.jpg" style="margin: 0 auto;"/>
						<img class="government-brands-responsive" src="img/rodape/gov-min-responsive.png" style="margin: 0 auto;"/>
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