<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="bootstrap/css/estilos.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>



<script type="text/javascript">

        $(document).ready(function() {

            function limpa_formulário_cep() {
                // Limpa valores do formulário de cep.
                $("#rua").val("");
                $("#bairro").val("");
                $("#cidade").val("");
                $("#uf").val("");
                $("#ibge").val("");
            }
            
            //Quando o campo cep perde o foco.
            $("#cep").blur(function() {

                //Nova variável "cep" somente com dígitos.
                var cep = $(this).val().replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if(validacep.test(cep)) {

                        //Preenche os campos com "..." enquanto consulta webservice.
                        $("#rua").val("...");
                        $("#bairro").val("...");
                        $("#cidade").val("...");
                        $("#uf").val("...");
                        $("#ibge").val("...");

                        //Consulta o webservice viacep.com.br/
                        $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

                            if (!("erro" in dados)) {
                                //Atualiza os campos com os valores da consulta.
                                $("#rua").val(dados.logradouro);
                                $("#bairro").val(dados.bairro);
                                $("#cidade").val(dados.localidade);
                                $("#uf").val(dados.uf);
                                $("#ibge").val(dados.ibge);
                            } //end if.
                            else {
                                //CEP pesquisado não foi encontrado.
                                limpa_formulário_cep();
                                alert("CEP não encontrado.");
                            }
                        });
                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulário_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulário_cep();
                }
            });
        });

    </script>




<script>
	function cadastrar() {
		document.forms[0].action = "cliente?acao=cadastro"
		document.forms[0].method = "post";
		document.forms[0].submit();
		document.forms[0].action = "";
		
	}
	function voltar() {
		document.forms[0].action = "http://localhost:8080/projeto-locadora/cliente?acao=listar"
		document.forms[0].method = "post";
		document.forms[0].submit();
		document.forms[0].action = "";
		
	}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro Cliente</title>
</head>
<body>

	<div class="container-fluid">

		<form>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="NomeCliente">Nome completo</label> <input type="text"
						class="form-control" id="NomeCliente" name="nomeC"
						placeholder="Seu nome">
				</div>
			</div>


			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="CpfCliente">CPF</label> <input type="text"
						class="form-control" id="CpfCliente" name="cpfC"
						placeholder="Seu CPF" />
				</div>
			</div>



			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="DataNasc">Data de Nascimento</label> <input type="text"
						class="form-control" id="DataNasc" name="dataNascC"
						placeholder="Sua Data de Nascimento" />
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="telefone">Telefone de contato(1)</label> <input type="text"
						class="form-control" name="telefone" placeholder="Seu telefone" />
				</div>
			</div>
			
				<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="telefone1">Telefone de contato(2)</label> <input type="text"
						class="form-control" name="telefone1" placeholder="Seu telefone" />
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="EmailCliente">Email</label> <input type="email"
						class="form-control" name="emailC" placeholder="Seu Email" />
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="SenhaCliente">Senha</label> <input type="password"
						class="form-control" name="senhaC" placeholder="Sua senha" />
				</div>
			</div>


			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="CpfCliente">CEP</label> <input type="text"
						class="form-control" id="cep" name="cep" placeholder="Seu CEP"
						value="" />
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="EndCliente">Rua</label> <input id="rua" type="text"
						class="form-control" name="endC" placeholder="Seu Endereço"
						value="" />
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="EndCliente">Bairro</label> <input id="bairro"
						type="text" class="form-control" name="bairro"
						placeholder="Seu Bairro" value="" />
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="EndCliente">Cidade</label> <input id="cidade"
						type="text" class="form-control" name="cidade"
						placeholder="Sua cidade" value="" />
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="EndCliente">Estado</label> <input id="uf" type="text"
						class="form-control" name="estado" placeholder="Seu estado"
						value="" />
				</div>
			</div>



			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="CpfCliente">Numero Casa</label> <input type="text"
						class="form-control" id="numero" name="numero"
						placeholder="Numero da residencia" />
				</div>
			</div>











			<div class="row">
				<div class="col-xs-6 col-md-4"></div>
			</div>

			<input type="button" class="btn btn-success" onclick="cadastrar()"
				value="Cadastrar"> <input type="button"
				class="btn btn-primary" onclick="voltar()" value="Voltar">


		</form>

	</div>


	<script src="bootstrap/jquery/jquery.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>