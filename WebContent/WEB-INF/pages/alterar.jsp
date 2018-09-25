<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="bootstrap/css/estilos.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>


<script>
	$(function() {
		$("#calendario").datepicker(
				{
					dateFormat : 'dd-mm-yy',
					dayNames : [ 'Domingo', 'Segunda', 'Terça', 'Quarta',
							'Quinta', 'Sexta', 'Sábado', 'Domingo' ],
					dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D' ],
					dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex',
							'Sáb', 'Dom' ],
					monthNames : [ 'Janeiro', 'Fevereiro', 'Março', 'Abril',
							'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro',
							'Outubro', 'Novembro', 'Dezembro' ],
					monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr', 'Mai',
							'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez' ]
				});
	});
</script>

<script type="text/javascript">
	$(document).ready(
			function() {

				function limpa_formulário_cep() {
					// Limpa valores do formulário de cep.
					$("#rua").val("");
					$("#bairro").val("");
					$("#cidade").val("");
					$("#uf").val("");
					$("#ibge").val("");
				}

				//Quando o campo cep perde o foco.
				$("#cep").blur(
						function() {

							//Nova variável "cep" somente com dígitos.
							var cep = $(this).val().replace(/\D/g, '');

							//Verifica se campo cep possui valor informado.
							if (cep != "") {

								//Expressão regular para validar o CEP.
								var validacep = /^[0-9]{8}$/;

								//Valida o formato do CEP.
								if (validacep.test(cep)) {

									//Preenche os campos com "..." enquanto consulta webservice.
									$("#rua").val("...");
									$("#bairro").val("...");
									$("#cidade").val("...");
									$("#uf").val("...");
									$("#ibge").val("...");

									//Consulta o webservice viacep.com.br/
									$.getJSON("https://viacep.com.br/ws/" + cep
											+ "/json/?callback=?", function(
											dados) {

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
	function alterar(idCliente) {
		document.forms[0].action = "cliente?acao=alterar&idCliente="
				+ idCliente;
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
<title>Alterar cadastro</title>
</head>
<body>
	<form>
		<div class="container-fluid">

			<div class="row">
				<aside class="col-xs-6 col-md-4">
					<label>Nome:</label> <input type="text" class="form-control"
						value="${clienteTela.nomeC}" disabled>
				</aside>
				<article class="col-md-4">
					<label>Novo Nome:</label> <input type="text" class="form-control"
						name="nomeC" value="${clienteTela.nomeC}" />
				</article>
			</div>

			<div class="row">
				<aside class="col-xs-6 col-md-4">
					<label>CPF:</label> <input type="text" class="form-control"
						value="${clienteTela.cpfC}" disabled>
				</aside>
				<article class="col-md-4">
					<label>Novo CPF:</label> <input type="text" class="form-control"
						name="cpfC" value="${clienteTela.cpfC}" />
				</article>
			</div>


			<div class="row">
				<aside class="col-xs-6 col-md-4">
					<label>Email:</label> <input type="text" class="form-control"
						value="${clienteTela.emailC}" disabled>
				</aside>
				<article class="col-md-4">
					<label>Novo Email:</label> <input type="text" class="form-control"
						name="emailC" value="${clienteTela.emailC}" />
				</article>
			</div>



			<div class="row">
				<aside class="col-xs-6 col-md-4">
					<label>Data de Nascimento:</label><label class="form-control"
						disabled><fmt:formatDate value="${clienteTela.dataNascC}"
							pattern="dd/MM/yyyy" /> </label>
				</aside>
				<article class="col-md-4">
					<label>Nova Data de Nascimento:</label>
					<input type="text" class="form-control" id="calendario" name="dataNascC" value="${clienteTela.dataNascC}">
						<fmt:formatDate var="data"  value="${clienteTela.dataNascC}"
						pattern="dd/MM/yyyy" />
				</article>
			</div>


			<div class="row">
				<aside class="col-xs-6 col-md-4">
					<label>Senha:</label> <input type="text" class="form-control"
						value="${clienteTela.senhaC}" disabled>
				</aside>
				<article class="col-md-4">
					<label>Nova Senha:</label> <input type="text" class="form-control"
						name="senhaC" value="${clienteTela.senhaC}" />
				</article>
			</div>

			<div class="row">
				<aside class="col-xs-6 col-md-4">
					<label>Telefone(1):</label> <input type="text" class="form-control"
						value="${clienteTela.telefone}" disabled>
				</aside>
				<article class="col-md-4">
					<label>Novo Telefone (1)</label> <input type="text"
						class="form-control" name="telefone"
						value="${clienteTela.telefone}" />
				</article>
			</div>

			<div class="row">
				<aside class="col-xs-6 col-md-4">
					<label>Telefone(2):</label> <input type="text" class="form-control"
						value="${clienteTela.telefone1}" disabled>
				</aside>
				<article class="col-md-4">
					<label>Novo Telefone (2)</label> <input type="text"
						class="form-control" name="telefone1"
						value="${clienteTela.telefone1}" />
				</article>
			</div>

			<div class="row">
				<aside class="col-xs-6 col-md-4">
					<label>CEP:</label> <input type="text" class="form-control"
						value="${clienteTela.cep}" disabled>
				</aside>
				<article class="col-md-4">
					<label>CEP</label> <input type="text" class="form-control"
						name="cep" id="cep" value="${clienteTela.cep}" />
				</article>
			</div>

			<div class="row">
				<aside class="col-xs-6 col-md-4">
					<label>Endereço:</label> <input type="text" class="form-control"
						value="${clienteTela.endC}" disabled>
				</aside>
				<article class="col-md-4">
					<label>Endereço</label> <input type="text" class="form-control"
						name="endC" id="rua" value="${clienteTela.endC}" />
				</article>
			</div>

			<div class="row">
				<aside class="col-xs-6 col-md-4">
					<label>Bairro:</label> <input type="text" class="form-control"
						value="${clienteTela.bairro}" disabled>
				</aside>
				<article class="col-md-4">
					<label>Bairro</label> <input type="text" class="form-control"
						name="bairro" id="bairro" value="${clienteTela.bairro}" />
				</article>
			</div>

			<div class="row">
				<aside class="col-xs-6 col-md-4">
					<label>Cidade</label> <input type="text" class="form-control"
						value="${clienteTela.cidade}" disabled>
				</aside>
				<article class="col-md-4">
					<label>Cidade</label> <input type="text" class="form-control"
						name="cidade" id="cidade" value="${clienteTela.cidade}" />
				</article>
			</div>


			<div class="row">
				<aside class="col-xs-6 col-md-4">
					<label>Estado</label> <input type="text" class="form-control"
						value="${clienteTela.estado}" disabled>
				</aside>
				<article class="col-md-4">
					<label>Estado</label> <input type="text" class="form-control"
						name="estado" id="uf" value="${clienteTela.estado}" />
				</article>
			</div>

			<div class="row">
				<aside class="col-xs-6 col-md-4">
					<label>Numero</label> <input type="text" class="form-control"
						value="${clienteTela.numero}" disabled>
				</aside>
				<article class="col-md-4">
					<label>Numero</label> <input type="text" class="form-control"
						name="numeroCasa" value="${clienteTela.numero}" />
				</article>
			



		</div>

		<input type="button" class="btn btn-primary"
			onclick="alterar(${clienteTela.idCliente})" value="Gravar"> <input
			type="button" class="btn btn-info" onclick="voltar()" value="Voltar">

	</div>
	</form>

	<script src="bootstrap/jquery/jquery.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>