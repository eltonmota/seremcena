function ValidaForm(){

	var name	= document.getElementById("name");
	var email	= document.getElementById("email");
	var phone	= document.getElementById("phone");
	
	if(name.value==""){
		$(".error").show();
		$(".error").html("Campo nome obrigatório!!");
		name.focus();
		return false;
		}
	if(email.value==""){
		$(".error").show();
		$(".error").html("Campo email obrigatório!!");
		email.focus();
		return false;
		}
	if(phone.value==""){
		$(".error").show();
		$(".error").html("Campo Telefone obrigatório!!");
		phone.focus();
		return false;
		}
		
	document.getElementById("contactForm").submit();
}

function ValidarInformacoes(passo){
	
	if(passo == "passo-1"){
		var nome 		= document.getElementById("nome");
		var documento	= document.getElementById("documento");
		var email		= document.getElementById("email");
		var cpf			= document.getElementById("cpf");
		var cnpj		= document.getElementById("cnpj");
		var valor		= document.getElementById("valor").value;
		
		valor_A = valor.replace(".",",");
		valor_B = valor_A.split(",");
		
		if(nome.value==""){
			nome.focus();
			$(".error").show();
			$(".error").html("Preencha todos os campos!!");
			return false;
			}
			
		if(documento.value==""){
			$(".error").show();
			$(".error").html("Preencha todos os campos!!");
			documento.focus();
			return false;
		}else{
			if(cpf.checked==true){
				
				if(documento.value.length>11){
					$(".error").show();
					$(".error").html("CPF Inválido!!");
					return false;
				}else{
					var cpf = documento.value;
					exp = /\.|\-/g
					cpf = cpf.toString().replace( exp, "" ); 
					var digitoDigitado = eval(cpf.charAt(9)+cpf.charAt(10));
					var soma1=0, soma2=0;
					var vlr =11;
					
					for(i=0;i<9;i++){
						soma1+=eval(cpf.charAt(i)*(vlr-1));
						soma2+=eval(cpf.charAt(i)*vlr);
						vlr--;
					}	
					soma1 = (((soma1*10)%11)==10 ? 0:((soma1*10)%11));
					soma2=(((soma2+(2*soma1))*10)%11);
					
					var digitoGerado=(soma1*10)+soma2;
					if(digitoGerado!=digitoDigitado){
						$(".error").show();
						$(".error").html("CPF Inválido!!");
						return false;
					}	
				}
				
			}else{
				
				if(documento.value.length>14){
					$(".error").show();
					$(".error").html("CNPJ Inválido!!");
					return false;
				}else{
					
					var cnpj = documento.value;
					var valida = new Array(6,5,4,3,2,9,8,7,6,5,4,3,2);
					var dig1= new Number;
					var dig2= new Number;
					
					exp = /\.|\-|\//g
					cnpj = cnpj.toString().replace( exp, "" ); 
					var digito = new Number(eval(cnpj.charAt(12)+cnpj.charAt(13)));
						
					for(i = 0; i<valida.length; i++){
						dig1 += (i>0? (cnpj.charAt(i-1)*valida[i]):0);	
						dig2 += cnpj.charAt(i)*valida[i];	
					}
					dig1 = (((dig1%11)<2)? 0:(11-(dig1%11)));
					dig2 = (((dig2%11)<2)? 0:(11-(dig2%11)));
					
					if(((dig1*10)+dig2) != digito)	
					$(".error").show();
					$(".error").html("CNPJ Inválido!!");
					documento.focus();
					return false;
				}
				
			}
			
		}
		
		if(valor==""){
			$(".error").show();
			$(".error").html("Qual é o valor da doação?");
			$("input#valor").focus();
			return false;
			}
		
		if(valor_B[0]<20){
			$(".error").show();
			$(".error").html("O valor mínimo para doação é R$ 20,00");
			$("input#valor").focus();
			return false;
			}
			
		if(email.value==""){
			$(".error").show();
			$(".error").html("Preencha todos os campos!!");
			email.focus();
			return false;
			}
			
		document.getElementById("contactForm").submit();
	}
	else{

		var endereco	= document.getElementById("endereco");
		var bairro		= document.getElementById("bairro");
		var cep			= document.getElementById("cep");
		var cidade		= document.getElementById("cidade");
		
		if(endereco.value==""){
			$(".error").show();
			$(".error").html("Preencha todos os campos!!");
			endereco.focus();
			return false;
			}
		if(bairro.value==""){
			$(".error").show();
			$(".error").html("Preencha todos os campos!!");
			bairro.focus();
			return false;
			}
		if(cep.value==""){
			$(".error").show();
			$(".error").html("Preencha todos os campos!!");
			cep.focus();
			return false;
			}
		if(cidade.value==""){
			$(".error").show();
			$(".error").html("Preencha todos os campos!!");
			cidade.focus();
			return false;
			}
			
		document.getElementById("contactForm").submit();
	}
}

