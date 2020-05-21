<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
</head>

<body>
<%
Conexao = split("MySQL ODBC 3.51 Driver;mysql28.whodesigners.com.br;3306;whodesigners37;whodesigners37;S3remC3na",";")

Dim Cn

set Rs = server.createObject("ADODB.Recordset")
Set Cn = Server.CreateObject("ADODB.Connection")
Cn.ConnectionString = ("DRIVER={"&Conexao(0)&"};SERVER="&Conexao(1)&";PORT="&Conexao(2)&";DATABASE="&Conexao(3)&";USER="&Conexao(4)&";PASSWORD="&Conexao(5)&";OPTION=3;") 
Cn.Open

If Request.Form("acao") = "doador" Then

	Nome		= Request.Form("nome")
	Tipo		= Request.Form("tipo")
	Documento	= Request.Form("documento")
	Email		= Request.Form("email")
	
	SQL_Gravar = 	"Insert Into Doadores " &_
					"	(Nome, Tipo, Documento, Email) " &_
					"Values " &_
					"	('" & Nome & "','" & Tipo & "','" & Documento & "','" & Email & "') "
	Rs.Open SQL_Gravar, Cn, 3, 3
	
	SQL_ID = "Select * From Doadores Order By ID_Doacoes Desc"
	Rs.Open SQL_ID, Cn, 3, 3
		If Not Rs.EOF Then
			NewID = Rs("ID_Doacoes")
		End If
	Rs.Close

	Response.Redirect("pagamento.asp?varid=" & NewID)

ElseIf Request.Form("acao") = "pagamento" Then

	Valor		= Request.Form("valor")
	Valor 		= Replace(Valor,".","")
	Valor 		= Replace(Valor,",",".")
	Periodo		= Request.Form("periodo")
	Data		= Request.Form("data")
	Tipo		= Request.Form("tipo")
	Doador		= Request.Form("doador")
	
	SQL_Gravar = 	"Insert Into Pagamentos " &_
					"	(ID_Doador, Tipo, Valor, Periodo, Data) " &_
					"Values " &_
					"	('" & Doador & "','" & Tipo & "','" & Valor & "','" & Periodo & "','" & Data & "') "
	Rs.Open SQL_Gravar, Cn, 3, 3
	
	SQL_ID = "Select * From Pagamentos Order By ID_Pagamento Desc"
	Rs.Open SQL_ID, Cn, 3, 3
		If Not Rs.EOF Then
			NewID = Rs("ID_Pagamento")
		End If
	Rs.Close
	
	dim codEmp, chave, pedido, valor, observacao, nomeSacado, codigoInscricao, enderecoSacado
	dim bairroSacado, cepSacado, cidadeSacado, estadoSacado, dataVencimento, urlRetorna, cripto
	
	codEmp = "J0070519160001100000014514"				'Coloque aqui o código da empresa
	chave = "20130702af4sicos"							'Coloque aqui a chave de criptografia em maiúscula
	pedido = Request.Form("pedido")						'obtém o valor do campo "pedido"
	valor = Request.Form("valor")						'obtém o valor do campo "valor"
	observacao = Request.Form("observacao")				'obtém o valor do campo "observacao"
	nomeSacado = Request.Form("nomeSacado")				'obtém o valor do campo "nomeSacado"
	codigoInscricao = Request.Form("codigoInscricao")	'obtém o valor do campo "codigoInscricao"
	numeroInscricao = Request.Form("numeroInscricao")	'obtém o valor do campo "numeroInscricao"
	enderecoSacado = Request.Form("enderecoSacado")		'obtém o valor do campo "enderecoSacado"
	bairroSacado = Request.Form("bairroSacado")			'obtém o valor do campo "bairroSacado"
	cepSacado = Request.Form("cepSacado")				'obtém o valor do campo "cepSacado"
	cidadeSacado = Request.Form("cidadeSacado")			'obtém o valor do campo "cidadeSacado"
	estadoSacado = Request.Form("estadoSacado")			'obtém o valor do campo "estadoSacado"
	dataVencimento = Request.Form("dataVencimento")		'obtém o valor do campo "dataVencimento"
	urlRetorna = Request.Form("urlRetorna")	 			'obtém o valor do campo "urlRetorna"
	obsAdicional1 = Request.Form("obsAdicional1")		'obtém o valor do campo "obsAdicional1"
	obsAdicional2 = Request.Form("obsAdicional2")		'obtém o valor do campo "obsAdicional2"
	obsAdicional3 = Request.Form("obsAdicional3")		'obtém o valor do campo "obsAdicional3"
		
	
	'Set cripto = server.createobject("Itaucripto.cripto")
	'dados = cripto.geraDados(codEmp, pedido, valor, observacao, chave, nomeSacado, codigoInscricao, numeroInscricao, enderecoSacado, bairroSacado, cepSacado, cidadeSacado, estadoSacado, dataVencimento, urlRetorna, obsAdicional1, obsAdicional2, obsAdicional3)
	'Set cripto = nothing
	%>
	
	<FORM ACTION="https://shopline.itau.com.br/shopline/shopline.asp" method="post" name="form1" onsubmit=carregabrw() target="SHOPLINE">
		<INPUT type="hidden" name="DC" value="<%= dados %>">
		<BR>
		<INPUT type="submit" name="Shopline" value="Itaú Shopline">
	</form>
<%
End If
%>
</body>
</html>
