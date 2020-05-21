
<script src="scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="998" height="424">
	<tr>
		<td align="center">
		<div style="font-family:Tahoma, Geneva, sans-serif; font-size:12px; color:#FFF; text-align:justify; width:600px">
            <form action="gravar.asp?acao=pagamento" method="post" id="formulario" name="formulario">
            <input type="hidden" name="doador" value="<%=Request.QueryString("varid")%>">
            <script language="javascript">
            	function Periodo(valor){
					if(valor=="Doacao Mensal"){
						document.getElementById("escolha_data").style.display = "block";
					}else{
						document.getElementById("escolha_data").style.display = "none";
					}
				}
				
				function MascaraMoeda(objTextBox, SeparadorMilesimo, SeparadorDecimal, e){
					var sep = 0;
					var key = '';
					var i = j = 0;
					var len = len2 = 0;
					var strCheck = '0123456789';
					var aux = aux2 = '';
					var whichCode = (window.Event) ? e.which : e.keyCode;
					if (whichCode == 13) return true;
					key = String.fromCharCode(whichCode); // Valor para o código da Chave
					if (strCheck.indexOf(key) == -1) return false; // Chave inválida
					len = objTextBox.value.length;
					for(i = 0; i < len; i++)
						if ((objTextBox.value.charAt(i) != '0') && (objTextBox.value.charAt(i) != SeparadorDecimal)) break;
					aux = '';
					for(; i < len; i++)
						if (strCheck.indexOf(objTextBox.value.charAt(i))!=-1) aux += objTextBox.value.charAt(i);
					aux += key;
					len = aux.length;
					if (len == 0) objTextBox.value = '';
					if (len == 1) objTextBox.value = '0'+ SeparadorDecimal + '0' + aux;
					if (len == 2) objTextBox.value = '0'+ SeparadorDecimal + aux;
					if (len > 2) {
						aux2 = '';
						for (j = 0, i = len - 3; i >= 0; i--) {
							if (j == 3) {
								aux2 += SeparadorMilesimo;
								j = 0;
							}
							aux2 += aux.charAt(i);
							j++;
						}
						objTextBox.value = '';
						len2 = aux2.length;
						for (i = len2 - 1; i >= 0; i--)
						objTextBox.value += aux2.charAt(i);
						objTextBox.value += SeparadorDecimal + aux.substr(len - 2, len);
					}
					return false;
				}
				
				function Validar(){
					if(document.getElementById("valor").value==""){
						alert("Qual o valor que você pretende doar?");
						document.getElementById("valor").focus();
						return false;
					}
					
					document.formulario.submit();
					}
            </script>

              <table cellpadding="2" cellspacing="2" style="font-family:Tahoma, Geneva, sans-serif; font-size:12px; text-align:justify;">
                <tr>
                  <td width="40"></td>
                  <td style="text-align:right">Valor da doação:</td>
                  <td>
                  	<div style="float: left;"><input type="text" id="valor" name="valor" style="width:140px; height:30px; text-align:right; font-size:14px" title="Ex: 20,00" onKeyPress="return(MascaraMoeda(this,'.',',',event))"></div>
                    <div style="float: left; margin-left: 10px;">
                    	<input type="radio" id="periodo1" name="periodo" value="Doacao Unica" onclick="Periodo(this.value)" style="margin-left:10px;" title="Escolha esta opção caso deseje contribuir uma única vez" checked="checked">Doação Única<br>
                    	<input type="radio" id="periodo2" name="periodo" value="Doacao Mensal" onclick="Periodo(this.value)" style="margin-left:10px;" title="Escolha esta opção caso deseje contribuir mensalmente">Doação Mensal
                    </div>
                    <div style="float: left; margin-left: 15px; display: none" id="escolha_data">
                    	Escolha uma data:<br>
                    	<select name="data" id="data">
                        	<%
							For i = 1 To 30
							
							data = i
							
							If data < 10 Then
								data = "0" & data
							End If
							%>
                        	<option value="<%=data%>">Dia <%=data%></option>
                            <%
							Next
							%>
                        </select>
                    </div>
                  </td>
                </tr>
                 <tr>
                	<td width="40"></td>
                    <td width="70"></td>
                	<td style="padding-left:10px; padding-top:15px;"><p>Escolha a forma de pagamento:</p></td>
                </tr>
                <tr>
                	<td width="40" align="center"><input type="radio" id="tipo" name="tipo" value="2" checked="checked"></td>
                    <td width="70" align="center"><img src="http://www.seremcena.org.br/site/shopline/boleto_bancario.gif"></td>
                	<td width="440" style="padding:10px;">
                    <strong>Boleto bancário</strong><br>
                    Em caso de doação única, o boleto tem vencimento de 10 dias posteriores à data de sua emissão. Em caso de doação mensal, você escolhe a data de vencimento. 
                    </td>
                </tr>
                <tr>
                	<td width="40" align="center"><input type="radio" id="tipo" name="tipo" value="1"></td>
                    <td width="70" align="center"><img src="http://www.seremcena.org.br/site/shopline/financiamento.gif"></td>
                	<td width="440" style="padding:10px;">
                    	<strong>Débito em conta</strong><br>
                        Em caso de doações únicas por meio de débito automático, a doação e o débito em sua conta são feitos imediatamente.
                    </td>
                
                </tr>               
				<tr align="right">
                	<td width="40"></td>
                    <td width="70"></td>
                    <td style="padding:15px;"><input type="button" value="Enviar" onclick="Validar()"></td>
                </tr>               
              </table>
            </form>
            <br>


            <p>Para confirmar a doação, basta clicar no botão acima e você será direcionado para o site do Itaú Shopline para finalizar a operação.</p>
            <p>
            A Ser em Cena agradece a sua doação!
            </p>
		</div>
		
		</td>
	</tr>
</table>