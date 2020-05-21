<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

</head>

<body>
<%
Conexao = split("MySQL ODBC 3.51 Driver;dbmy0101.whservidor.com;3306;seremcena;seremcena;@fasia2017",";")

Dim Cn

set Rs = server.createObject("ADODB.Recordset")
Set Cn = Server.CreateObject("ADODB.Connection")
Cn.ConnectionString = ("DRIVER={"&Conexao(0)&"};SERVER="&Conexao(1)&";PORT="&Conexao(2)&";DATABASE="&Conexao(3)&";USER="&Conexao(4)&";PASSWORD="&Conexao(5)&";OPTION=3;") 
Cn.Open

If Request.Form("acao") = "passo-1" Then

	Nome		= Request.Form("nome")
	Tipo		= Request.Form("tipo")
	Documento	= Request.Form("documento")
	Email		= Request.Form("email")
	Valor		= Request.Form("valor")
	Valor 		= Replace(Valor,".","")
	Valor 		= Replace(Valor,",",".")
	
	Function GerarPedido(qtd_num,tipo_char)
		A = True
		' Selecionamos os tipos de caracteres a serem usados
		Select Case tipo_char
			Case 1 : caracteres = "1,0,0,2,0,3,0,4,0,5,0,6,0,0,7,0,8,0,9,0,1,2,3,4,5,6,7,8,9"
		End Select
		n_char = Split(caracteres,",")
		Randomize
		Do While len(chave) < qtd_num 'Looping enquanto a chave nao possuir a qtidade solicitada de caracteres
			If A = True Then
				num = n_char(Int(Ubound(n_char) * Rnd ))
				If num = 0 Then
					num = n_char(Int(Ubound(n_char) * Rnd ))
				End If
				A = False
			Else
				num = n_char(Int(Ubound(n_char) * Rnd ))
			End If
			chave = chave + num
		Loop 
		GerarPedido = Trim(chave) ' Retornando o valor para a Pagina
	End Function
	
	NumeroPedido = GerarPedido(8,1)

	
	SQL_Gravar = 	"Insert Into Doadores " &_
					"	(Nome, Tipo, Documento, Email, Valor, Pedido) " &_
					"Values " &_
					"	('" & Nome & "','" & Tipo & "','" & Documento & "','" & Email & "','" & Valor & "','" & NumeroPedido & "') "
	Rs.Open SQL_Gravar, Cn, 3, 3
	
	SQL_ID = "Select * From Doadores Order By ID_Doacoes Desc"
	Rs.Open SQL_ID, Cn, 3, 3
		If Not Rs.EOF Then
			NewID = Rs("ID_Doacoes")
		End If
	Rs.Close

	Response.Redirect("parte_2.asp?varid=" & NewID)

ElseIf Request("acao") = "passo-2" Then

	endereco	= Request.Form("endereco")
	bairro		= Request.Form("bairro")
	cep			= Request.Form("cep")
	cidade		= Request.Form("cidade")
	estado		= Request.Form("estado")

	SQL_ID = "Update Doadores Set endereco='" & endereco & "',bairro='" & bairro & "',cep='" & cep & "',cidade='" & cidade & "',estado='" & estado & "' Where ID_Doacoes = " & Request("varid")
	Rs.Open SQL_ID, Cn, 3, 3
	
	'Response.Redirect("pagamento.asp?varid=" & Request("varid"))
	
	dim codEmp, chave, pedido, valor, observacao, nomeSacado, codigoInscricao, enderecoSacado
	dim bairroSacado, cepSacado, cidadeSacado, estadoSacado, dataVencimento, urlRetorna, cripto
	
	SQL_ID = "Select * From Doadores Where ID_Doacoes = '" & Request("varid") & "'"
	Rs.Open SQL_ID, Cn, 3, 3
		If Not Rs.EOF Then
			Nome		= Rs("nome")
			Documento	= Rs("documento")
			Email		= Rs("email")
			Endereco	= Rs("endereco")
			Bairro		= Rs("bairro")
			Cep			= Rs("cep")
			Cidade		= Rs("cidade")
			Estado		= Rs("estado")
			Tipo_Doc	= Rs("tipo")
			Valor		= Rs("valor")
			Pedido		= Rs("pedido")			
			
		End If
	Rs.Close
	
	codEmp = "j0070519160001100000014514"
	chave = "2o1s0c7i2p0s0e4c"
	pedido = Pedido
	valor = Valor
	TipPag = ""
	observacao = ""
	nomeSacado = Nome
	codigoInscricao = Tipo_Doc
	numeroInscricao = Documento
	enderecoSacado = Endereco
	bairroSacado = Bairro
	cepSacado = Cep
	cidadeSacado = Cidade
	estadoSacado = Estado
	dataVencimento = ""
	urlRetorna = "/retorno.asp"
	obsAdicional1 = ""
	obsAdicional2 = ""
	obsAdicional3 = ""
	
	'REsponse.Write(codEmp &" <br> "& pedido &" <br> "& valor &" <br> "& observacao &" <br> "& chave &" <br> "& nomeSacado &" <br> "& codigoInscricao &" <br> "& numeroInscricao &" <br> "& enderecoSacado &" <br> "& bairroSacado &" <br> "& cepSacado &" <br> "& cidadeSacado &" <br> "& estadoSacado &" <br> "& dataVencimento &" <br> "& urlRetorna &" <br> "& obsAdicional1 &" <br> "& obsAdicional2 &" <br> "& obsAdicional3)
	'Response.End()	
	
	Set cripto = server.createobject("Itaucripto.cripto")
	dados = cripto.geraDados(codEmp, pedido, valor, observacao, chave, nomeSacado, codigoInscricao, numeroInscricao, enderecoSacado, bairroSacado, cepSacado, cidadeSacado, estadoSacado, dataVencimento, urlRetorna, obsAdicional1, obsAdicional2, obsAdicional3)
	Set cripto = nothing
	%>

<script src="scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>
var tempo 		= new Number();
var cronometro 	= new Number();

// Tempo em segundos
tempo 		= 3;
cronometro 	= 1000;

function startCountdown(){
    // Se o tempo não for zerado
    if((tempo - 1) >= 0){

        // Pega a parte inteira dos minutos
        var min = parseInt(tempo/60);

        // Calcula os segundos restantes
        var seg = tempo%60;

        // Formata o número menor que dez, ex: 08, 07, ...
        if(min < 10){
            min = "0"+min;
            min = min.substr(0, 2);
        }
        if(seg <=9){
            seg = "0"+seg;
        }
        // Cria a variável para formatar no estilo hora/cronômetro
        horaImprimivel = min + ':' + seg;
        //JQuery pra setar o valor
        $("#sessao").html(horaImprimivel);
        // Define que a função será executada novamente em 1000ms = 1 segundo
        var TimeOut = setTimeout('startCountdown()',cronometro);
        TimeOut;
        // diminui o tempo
        tempo--;
    // Quando o contador chegar a zero faz esta ação
    } else {
        document.getElementById('pagamento').submit();
    }
}
// Chama a função ao carregar a tela
startCountdown();
</script>

<table align="center" border="0" cellpadding="0" cellspacing="0" width="998" height="424">
	<tr>
		<td align="center">
		<div style="font-family:Tahoma, Geneva, sans-serif; font-size:12px; color:#000; text-align:justify; width:600px">

		Aguarde alguns segundos, Você está sendo direcionado para a tela de pagamento.<br><br>

		<b style="font-size: 14px;">Habilite seu pop-up para poder efetuar o pagamento.</b><br><br>

		Tempo para o redirecionamento: <span id="sessao" style="font-size: 16px; font-weight: 900">00:10</span>

		<FORM ACTION="https://shopline.itau.com.br/shopline/shopline.asp" method="post" name="pagamento" id="pagamento" target="SHOPLINE">
			<INPUT type="hidden" name="DC" value="<%= dados %>">
		</form>

		</div>
		
		</td>
	</tr>
</table>


<%
End If
%>
</body>
</html>