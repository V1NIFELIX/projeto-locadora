<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />

<link rel="stylesheet" type="text/css" href="bootstrap/css/estilos.css" />

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />

<script src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script>
	function gravar(idLocacao) {
		document.forms[0].action = "locacao?acao=alterarLocacao&idLocacao="+idLocacao;
		document.forms[0].method = "post";
		document.forms[0].submit();
		document.forms[0].action = "";
		
	}
	function voltar() {
		document.forms[0].action = "http://localhost:8080/projeto-locadora/locacao?acao=inicioLocacao"
		document.forms[0].method = "post";
		document.forms[0].submit();
		document.forms[0].action = "";
		
	}
</script>
<script>
	$(function() {
		$("#calendario,#calendario1,#calendario2").datepicker(
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



<title>Alterar Locação</title>
</head>
<body>



	
	<h3 class="container-fluid">
		Informações Atuais
		</h2>



		<div class="container-fluid">

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>Nome:</label><label disabled class="form-control">
						${locacaoAlterar.cliente.nomeC} </label>

				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>CPF:</label><label disabled class="form-control">
						${locacaoAlterar.cliente.cpfC} </label>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>Filme:</label><label disabled class="form-control">
						${locacaoAlterar.nomeF} </label>
				</div>
			</div>



			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>Data de Locacao:</label>
					<div class="form-control" disabled>
						<fmt:formatDate value="${locacaoAlterar.dataDeLocacao}"
							pattern="dd-MM-yyyy" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>Data de Vencimento:</label>
					<div class="form-control" disabled>
						<fmt:formatDate value="${locacaoAlterar.dataDeVencimento}"
							pattern="dd-MM-yyyy" />
					</div>

				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>Data de Devolução:</label>
					<div class="form-control" disabled>
						<fmt:formatDate value="${locacaoAlterar.dataDeDevolucao}"
							pattern="dd-MM-yyyy" />
					</div>
				</div>
			</div>



			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>Valor:</label><label disabled class="form-control"><fmt:formatNumber
							value="${locacaoAlterar.valorBase}" type="currency" /></label>

				</div>
			</div>
			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>Valor:</label><label disabled class="form-control"><fmt:formatNumber
							value="${locacaoAlterar.valorReal}" type="currency" /></label>

				</div>
			</div>



		</div>


		<!-- DAQUI EM DIANTE É SOMENTE AS NOVAS INFORMAÇÕES -->

		<h3 class="container-fluid">
			Novas informações
			</h2>

			<div class="container-fluid">
				<form>
					<div class="row">
						<div class="col-xs-6 col-md-4">
							<select name="idFilmes" class="form-control">
								<option>Selecione...</option>
								<c:forEach var="l" items="${listaFilmesDisponiveis}">
								
									<option value="${l.idFilmes}">${l.nomeF}</option>
															
								</c:forEach>
							</select>
							
						</div>
					</div>

					<div class="row">
						<div class="col-xs-6 col-md-4">
							<label>Data de Locacao</label>
							<div style="visibility: hidden">
								<fmt:formatDate var="fmtLocacao"
									value="${locacaoAlterar.dataDeLocacao}" pattern="dd-MM-yyyy" />
							</div>
							<div>
								<input id="calendario" class="form-control" type="text" name="dataDeLocacao"
									value="${fmtLocacao}"/>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="col-xs-6 col-md-4">
							<label>Data de Vencimento</label>
							<div style="visibility: hidden">
								<fmt:formatDate var="fmtVencimento"
									value="${locacaoAlterar.dataDeVencimento}" pattern="dd-MM-yyyy" />
							</div>
							<div>
								<input id="calendario1" class="form-control" type="text" name="dataDeVencimento"
									value="${fmtVencimento}">
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-xs-6 col-md-4">
							<label>Data de Devolução</label>
							<div style="visibility: hidden">
								<fmt:formatDate var="fmtDevolucao"
									value="${locacaoAlterar.dataDeDevolucao}"  pattern="dd-MM-yyyy" />
							</div>
							<div>
								<input id="calendario2" type="text"  class="form-control" name="dataDeDevolucao"
									value="${fmtDevolucao}">


							</div>

						</div>
					</div>

					<div class="row">
						<div class="col-xs-6 col-md-4">
							<label>Valor Base</label> <input type="text" class="form-control"
								name="valorBase" value="${locacaoAlterar.valorBase}" />
						</div>
					</div>

					<div class="row">
						<div class="col-xs-6 col-md-4">
							<label>Valor Real</label> <input type="text" class="form-control"
								name="valorReal" value="${locacaoAlterar.valorReal}" />
						</div>
					</div>





				</form>
			</div>
			<div class="container-fluid">
				<input type="button" class="btn btn-primary"
					onclick="gravar(${locacaoAlterar.idLocacao})" value="Gravar">

				<input type="button" class="btn btn-info" onclick="voltar()"
					value="Voltar">
			</div>

			
</body>
</html>