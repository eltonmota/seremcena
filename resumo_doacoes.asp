<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>

<%
Conexao = split("MySQL ODBC 3.51 Driver;mysql28.whodesigners.com.br;3306;whodesigners37;whodesigners37;S3remC3na",";")
'Conexao = split("MySQL ODBC 5.1 Driver;mysql28.whodesigners.com.br;3306;whodesigners37;whodesigners37;S3remC3na",";")

Dim Cn

set Rs = server.createObject("ADODB.Recordset")
Set Cn = Server.CreateObject("ADODB.Connection")
Cn.ConnectionString = ("DRIVER={"&Conexao(0)&"};SERVER="&Conexao(1)&";PORT="&Conexao(2)&";DATABASE="&Conexao(3)&";USER="&Conexao(4)&";PASSWORD="&Conexao(5)&";OPTION=3;") 
Cn.Open

If Request("pagamento") <> "" Then

	If Request("pagamento") = 1 Then
		Pago = "P"
	Else
		Pago = "N"
	End If

	'Response.Write("Update Doacoes Set Pago = '" & Pago & "' Where ID_Doacoes = " & Request("id"))

	Rs.Open "Update Doadores Set Pago = '" & Pago & "' Where ID_Doacoes = " & Request("id"), Cn, 3, 3


	%>
	<script>
		alert("Pagamento atualizado com sucesso!");
		window.location = "resumo_doacoes.asp";
	</script>
	<%

	Response.End

End If
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

</head>

<style>
@charset "utf-8";
/* CSS Document */

/*PAGINAÇÃO*/
#paginacao{float: left; width: 950px; text-decoration: none}
#ali_paginacao{float: right; width: 950px; margin: 15px 0 0 5px;}

.back_paginacao_2{float: left; padding: 5px 10px;}

.back_paginacao_sel_2{float: left; background: #cae1df; padding: 5px 10px; color: #b7b7b7}

.back_paginacao_4{float: left; background: #cae1df; color: #000;}

#ultima_on a{float: left; color: #333333; padding: 5px; text-decoration: none}
#primeira_on a{float: left; color: #333333; padding: 5px; text-decoration: none}
#anterior_on a{float: left; color: #333333; padding: 5px; text-decoration: none}
#proxima_on a{float: left; color: #333333; padding: 5px; text-decoration: none}
.paginacao_on a{float: left; color: #333333; background: #d6d6d6; padding: 5px; text-decoration: none}

#ultima_on a:hover{float: left; color: #000000; padding: 5px;}
#primeira_on a:hover{float: left; color: #000000; padding: 5px;}
#anterior_on a:hover{float: left; color: #000000; padding: 5px;}
#proxima_on a:hover{float: left; color: #000000; padding: 5px;}
.paginacao_on a:hover{float: left; color: #2b2b2b; background: #9e9e9e; padding: 5px;}

#ultima_off{float: left; color: #A8A8A8; padding: 5px;}
#primeira_off{float: left; color: #A8A8A8; padding: 5px;}
#anterior_off{float: left; color: #A8A8A8; padding: 5px;}
#proxima_off{float: left; color: #A8A8A8; padding: 5px;}
.paginacao_off{float: left; color: #A8A8A8; padding: 5px;}	
</style>

<body style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; padding: 20px">

<table style="font-family:Verdana, Geneva, sans-serif; font-size:12px;">
    <tr>
        <td colspan="2"><input type="button" onClick="document.location = 'http://seremcena.org.br/'" value="<< Voltar para o Site"></td>
    </tr>
</table>
<br>
<br>

<table width="100%">
	<tr>
		<td width="350" valign="top">
			<font style="font-size: 20px;"><b>RELATÓRIOS</b></font>
			<br><br>

			<a href="?tipo=1" style="color: black">Doações Realizadas</a> ou <a href="?tipo=2" style="color: black">Todos os Cadastros</a>

			<%
			Tipo_Lista = Request("tipo")

				If Tipo_Lista <> "" Then


					If Tipo_Lista = 1 Then
						Arquivo_Excel = "doacoes_" & day(now()) & month(now()) & year(now()) &".csv"
					Else
						Arquivo_Excel = "cadastros_" & day(now()) & month(now()) & year(now()) &".csv"
					End If
					
					Arquivo = server.mappath("doacoes/" & Arquivo_Excel)

					'Response.Write(Arquivo)
					'Response.End

					set fso = createobject("scripting.filesystemobject")
					Set act = fso.CreateTextFile(Arquivo, true)

					If Tipo_Lista = 1 Then
						act.WriteLine("Nome;Documento;Número;E-mail;CEP;Estado;Valor;Pagamento;Doacao")

						Rs.Open "Select * From Doadores Where retorno <> '' Order By ID_Doacoes", Cn, 3, 3
					Else
						act.WriteLine("Nome;Documento;Número;E-mail")

						Rs.Open "Select Distinct Nome,Tipo,Documento,Email,Estado From Doadores group by Nome Order By Nome, Email", Cn, 3, 3

					End If
						If Not Rs.Eof Then

							While Not Rs.Eof

								If Cstr(Rs("Tipo")) = "01" Then
									Documento = "CPF"
								Else
									Documento = "CNPJ"
								End If

								If Tipo_Lista = 1 Then

									If Cstr(Rs("retorno")) = "1" Then
										Tipo_Pagamento = "TEF ou CDC"
									ElseIf Cstr(Rs("retorno")) = "2" Then
										Tipo_Pagamento = "Boleto"
									ElseIf Cstr(Rs("retorno")) = "3" Then
										Tipo_Pagamento = "Cartão de Crétido"
									Else
										Tipo_Pagamento = "Desconhecido"
									End If

								End If

							If Tipo_Lista = 1 Then
								act.WriteLine("" & Rs("Nome") & ";" & Documento & ";'" & Rs("Documento") & ";" & Rs("Email") & ";" & Rs("cep") & ";" & Rs("estado") & ";R$ " & FormatNumber(Rs("valor"),2) & ";" & Tipo_Pagamento & ";'" & Rs("Pedido") & "")
							Else
								act.WriteLine("" & Rs("Nome") & ";" & Documento & ";'" & Rs("Documento") & ";" & Rs("Email") & "")
							End If

							Rs.MoveNext
							Wend

						End If
					Rs.Close

					set fso = nothing
					Set act = nothing
					%>
					<br><br>Clique no botão a baixo para fazer download:<br> <input type="button" onClick="document.location = 'http://seremcena.org.br/site/doacoes/<%=Arquivo_Excel%>'" value="Download do Arquivo">
				<%
				End If
			%>
		</td>
		<td valign="top">

			<font style="font-size: 20px;"><b>BOLETOS</b></font> <a href="resumo_doacoes.asp" style="color: black"><b><i>[ver todos]</i></b></a>
			<br></br>


			<form action="resumo_doacoes.asp" method="post">
			<table style="font-family:Verdana, Geneva, sans-serif; font-size:12px;">
			    <tr>
			        <td colspan="2">&nbsp;</td>
			    </tr>
			    <tr>
			        <td width="80">Nº Pedido:</td>
			        <td><input type="text" id="pedido" name="pedido" style="width: 250px"> <input type="submit" value="Buscar Pedido"></td>
			    </tr>
			</table>
			</form>
			<br>

			<table cellpadding="0" cellspacing="0" style="font-family: Arial, Helvetica, sans-serif; font-size: 12px;" width="100%">
				<tr bgcolor="#333333" style="color: #FFFFFF;">
			        <td align="center" width="30"><div style="padding: 10px;">Pago</div></td>
			    	<td align="center" width="50"><div style="padding: 10px;">Nº Pedido</div></td>
			        <td align="center" width="50"><div style="padding: 10px;">Valor</div></td>
					<td width="30"><div style="padding: 10px;">Documento</div></td>
					<td width="200"><div style="padding: 10px;">Número</div></td>
			        <td><div style="padding: 10px;">Nome</div></td>
			        <td width="30"><div style="padding: 10px;">Ação</div></td>
			    </tr>
			    <%
			    Cor = True

			    If Request("pedido") <> "" Then
			    	Where = " And Pedido like '%" & Request("pedido") & "%'"
			    Else
			    	Where = ""
			    End If

				cn.CursorLocation = 3
				Const NumPorPG = 20

				Rs.Open "Select * From Doadores Where retorno = '2' " & Where & " Order By ID_Doacoes", Cn, 3, 3
					If Not Rs.Eof Then

					i = 1
					cont = 1       


					IF Request.QueryString("PagAtual") = "" Then
						PagAtual = 1 'Primeira página
					Else
						PagAtual = Request.QueryString("PagAtual")
					End If
					
					Rs.CacheSize = 20 'Define o tamanho do Cache = para o número de registros
					Rs.MoveFiRst 'Move o RecoRset para o início 
					Rs.PageSize = 20 'Coloca a quantidade de páginas
					
					TotalPages = Rs.PageCount
					
					Rs.AbsolutePage = PagAtual 'Configura a página atual
					
					'############## paginacao Introdução - FIM #################
					primeiro = 1
					p = 0
					Count = 0 'Zera o contador
					DO WHILE NOT Rs.EOF And Count < Rs.PageSize

						If Cor = True Then
							Cor_Fundo = "FFFFFF"
						Else
							Cor_Fundo = "CCCCCC"
						End If

						Cor = Not Cor

						If Rs("Pago") = "P" Then
							Pedido_Atualizado = "#1a9620"
						Else
							Pedido_Atualizado = "#660000"
						End If

						If Cstr(Rs("Tipo")) = "01" Then
							Documento = "CPF"
						Else
							Documento = "CNPJ"
						End If

						%>
					<tr bgcolor="<%=Cor_Fundo%>" style="color: #000000;">
						<td align="center" bgcolor="<%=Pedido_Atualizado%>"><div style="padding: 10px;">&nbsp;</div></td>
						<td align="center"><div style="padding: 10px;"><%=Rs("Pedido")%></div></td>
						<td align="center"><div style="padding: 10px;"><%=FormatNumber(Rs("valor"),2)%></div></td>
						<td><div style="padding: 10px;"><%=Documento%></div></td>
						<td><div style="padding: 10px;"><%=Rs("Documento")%></div></td>
						<td><div style="padding: 10px;"><%=Rs("Nome")%></div></td>
						<td><div style="padding: 10px;">
							<%If Rs("Pago") = "N" Then%>
								<a href="resumo_doacoes.asp?pagamento=1&id=<%=Rs("ID_Doacoes")%>" title="Efetuar Pagamento"><img src="imagens/pagar.png" width="20"></a>
							<%Else%>
								<a href="resumo_doacoes.asp?pagamento=2&id=<%=Rs("ID_Doacoes")%>" title="Remover Pagamento"><img src="imagens/remover.png" width="20"></a>
							<%End If%>
						</div></td>
					</tr>
			   <%
					Count = Count + 1 
					Rs.MoveNext
					LOOP 

				%>
				<tr>
					<td colspan="7">
				<div id="paginacao">
				<%
				
				IF PagAtual > 1 THEN 
					Response.Write("<div id=""primeira_on""><a href='resumo_doacoes.asp?pag="&pag&"&PagAtual=" & 1 & "'>Primeira</a></div>") 
					Response.Write("<div id=""anterior_on""><a href='resumo_doacoes.asp?pag="&pag&"&PagAtual=" & PagAtual -1 & "'>Anterior</a></div>") 
				Else
					Response.Write("<div id=""primeira_off"">Primeira</div>") 
					Response.Write("<div id=""anterior_off"">Anterior</div>") 
				End If
				
				'------------------- numero -------------------------
				'---------- Numero de numeros para ser mostrados ----
				max_n_mostrados = 10
				
				intervalo = Int(max_n_mostrados /2)
				inicio = PagAtual - intervalo
				final = PagAtual + intervalo
				
				If CInt(inicio) <1 Then 
					inicio = 1
					final = 10
				END IF
				
				If CInt(final) > CInt(TotalPages) Then final = TotalPages
				
				For p = inicio To final
				
					If CInt(p)=CInt(PagAtual) Then
						Response.Write "<div class='paginacao_off' style='background: #333333; color: #fff'>" & p & "</div> "
					END IF
					
					If CInt(p) > CInt(PagAtual) Then
						Response.Write "<div class='paginacao_on'><a href='resumo_doacoes.asp?pag="&pag&"&PagAtual=" & p & "' style=' display: block'>" & p & "</a></div> "
					END IF

					If CInt(p) < CInt(PagAtual) Then
						Response.Write "<div class='paginacao_on'><a href='resumo_doacoes.asp?pag="&pag&"&PagAtual=" & p & "' style=' display: block'>" & p & "</a></div> "
					END IF
				
				Next

				IF CInt(PagAtual) <> CInt(TotalPages) THEN 
					Response.Write("<div id=""proxima_on""><a href='resumo_doacoes.asp?pag="&pag&"&PagAtual=" & PagAtual + 1 & "'>Pr&oacute;xima</a></div>") 
					Response.Write("<div id=""ultima_on""><a href='resumo_doacoes.asp?pag="&pag&"&PagAtual=" & TotalPages & "'>&Uacute;ltima</a></div>") 
				Else
					Response.Write("<div id=""proxima_off"">Pr&oacute;xima</div>") 
					Response.Write("<div id=""ultima_off"">&Uacute;ltima</div>") 
				End If 
				'################## fim paginacao 01 ########################
			%>
			</div>
					</td>
				</tr>
			<%

					End If
				Rs.Close


			Cn.Close
			    %>
			</table>
		</td>
	</tr>
</table>

</body>
</html>