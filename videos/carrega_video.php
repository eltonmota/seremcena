<?php
header('Content-type: video/mp4');
//conexão
$conexao = mysql_connect('dbmy0101.whservidor.com','seremcena','@fasia2017');		   
$db = mysql_select_db('seremcena') or die(mysql_error());

$sql = "select * from site_videos where sv_arquivo = ".$_POST["video"]."";

$query = mysql_query($sql) or die(mysql_error());

$row = mysql_fetch_array($query);

$Rs .= '<div id="posts-list">
	        	
					<article class="format-standard">
						
						<div class="feature-image">
							<video width="100%" height="auto" controls>
							  <source src="videos/'.$row["sv_arquivo"].'.mp4" type="video/mp4">
							</video>
						</div>

						<h3>'.utf8_encode($row["sv_titulo"]).'</h3>
						
					</article>
	        		
	        		
	        	</div>
	        	<!-- ENDS posts list -->
	        	
	        	
	        	<!-- sidebar -->
	        	<aside id="sidebar">
	        		
	        		<div class="block">
		        		<h4>Informações</h4>
						<ul>
							<li class="cat-item"><strong>Ano de Gravação:</strong> '.$row["sv_ano"].'</li>
							<li class="cat-item"><strong>Idioma:</strong> '.utf8_encode($row["sv_idioma"]).'</li>
							<li class="cat-item"><strong>Formato:</strong> '.$row["sv_formato"].'</li>
						</ul>
	        		</div>
	        	
	        	</aside>';

echo $Rs;

?>