<%
Dim Mail ' objeto mail 
Dim FromName ' nome do remetente
Dim FromEmail ' endereço de E-mail do remetente
Dim ToEmail ' endereço do destinatario
Dim Subject, strBody ' corpo da mensagem
Dim ThisPage ' o endereco do seu site
Dim RefPage ' a referencia URL 
Dim Val_Input ' variável Booleana usada na validação 
Dim meusmtp
Dim minhacontaautenticada
Dim minhasenhaparaenvio

'Abaixo seguem algumas definicoes de variaveis para o envio de seu formulario. Por favor preencha os campos abaixo.

meusmtp = "smtp.seremcena.org.br" ' Informacoes so seu servidor SMTP
minhacontaautenticada = "webmaster@seremcena.org.br" ' conta de e-mail utilizada para enviar
minhasenhaparaenvio = "afasia2014" ' senha da conta de e-mail
emaildestino = "seremcena@seremcena.org.br" ' e-mail que vai receber as mensagens do formulario


'Fim da definição manual de parâmetros.

' Retorna o nome do arquivo de script e a url da pagina
ThisPage = Request.ServerVariables("SCRIPT_NAME")
RefPage = Request.ServerVariables("HTTP_REFERER")

strBody = Trim(Request.Form("Message"))
Subject = Trim(Request.Form("Subject"))
ToEmail = emaildestino
FromName = Trim(Request.Form("FromName"))
FromEmail = Trim(Request.Form("FromEmail"))

val_ent = True
val_ent = val_ent And FromName <> ""
val_ent = val_ent And val_email(FromEmail)
val_ent = val_ent And val_email(ToEmail)

If val_ent Then 
Set Mail = Server.CreateObject("Persits.MailSender") 
Mail.Host = meusmtp
Mail.Port = 587
Mail.Username = minhacontaautenticada
Mail.Password = minhasenhaparaenvio
Mail.From = FromEmail
Mail.FromName = FromName
Mail.AddAddress ToEmail 
Mail.Subject = Subject
Mail.Body = "Dados"& vbCrLf & _
"Nome:"& Request("FromName")& vbCrLf & _
"E-Mail:"& Request("FromEmail")& vbCrLf & _
"Assunto:"& Request("Subject")& vbCrLf & _
"Mensagem:"& Request("Message")

Mail.Send
mensagem_erro = ""
if err <> 0 then
mensagem_erro = "Ocorreu o erro: " & Err.description
end if
Mail.CharSet = "ISO 8859-1"
Set Mail = Nothing
on error goto 0
response.write " <p>Sua mensagem foi enviada com sucesso!
"
Else
If "http://" & Request.ServerVariables("HTTP_HOST") & ThisPage = RefPage Then
Response.Write "Verifique os campos por favor!" & "
" & vbCrLf 
End If
Forms_x ThisPage, FromName, FromEmail, Subject, strBody
End If

Function val_email(strEmail)

Dim xVal

xVal = True

If Len(strEmail) <5 Then
xVal = False
Else
If Instr(1, strEmail, " ") <> 0 Then
xVal = False
Else
If InStr(1, strEmail, "@", 1) <2 Then 
xVal = False
Else
If InStrRev(strEmail, ".") <_
InStr(1, strEmail, "@", 1) + 2 Then
xVal = False
End If
End If
End If
End If

val_email = xVal

End Function

Sub Forms_x (strPageName, FromName, FromEmail, Subject, strBody) %> <% End Sub %>