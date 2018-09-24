<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script>
	function cadastrar() {
		document.forms[0].action = "locacao?acao=cadastro"
		document.forms[0].method = "post";
		document.forms[0].submit();
		document.forms[0].action = "";

	}
</script>






<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tela de locação</title>

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />

<link rel="stylesheet" type="text/css" href="bootstrap/css/estilos.css" />

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />

<script src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
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
<script>
	$(function() {
		$("#calendario1").datepicker(
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




<meta name="viewport" content="width=device-width, initial-scale=1">




<title>Cadastro Locação</title>
</head>
<body>

	<form>
	<script src="bootstrap/js/bootstrap.min.js"></script>


	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#collapse-navbar"
			aria-expanded="false">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="http://localhost:8080/projeto-locadora/">Ebix
			Filmes</a>

		<div class="collapse navbar-collapse" id="collapse-navbar">
			<ul class="nav navbar-nav">
				<li><a href="http://localhost:8080/projeto-locadora/locacao?acao=inicioLocacao">Voltar</a></li>

			</ul>
		</div>
	</div>
	</nav>

	<table class="table table-bordered">
		<thead>
			<tr>
				<th style="width: 5%">Filmes disponiveis</th>
				<th style="width: 5%">Selecionar Cliente</th>
				<th style="width: 5%">Dia da Locação</th>
				<th style="width: 5%">Dia de Vencimento</th>
				<th style="width: 5%">Valor</th>
				<th style="width: 5%">Gravar</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			<%-- 	<td><select multiple name="idFilmes" class="form-control">
						<option>Selecione...</option>
						<c:forEach var="l" items="${listaFilmesDisponiveis}">
							<option value="${l.idFilmes}">${l.nomeF}</option>
						</c:forEach>
				</select></td> --%>
				<td>
					<div>
						<c:forEach var="l" items="${listaFilmesDisponiveis}">
						<input name="idFilmes" type="checkbox" value="${l.idFilmes}">${l.nomeF}
						</c:forEach>
					</div>
				</td>


				<td><select name="idCliente" class="form-control">
						<option>Selecione...</option>
						<c:forEach var="c" items="${listaClientesLocacao}">
							<option value="${c.idCliente}">${c.nomeC}</option>
						</c:forEach>
				</select></td>



				<td>
					<div class="form-horizontal">
						<div class="form-group">
							<div class="col-sm-10">
								<div class="input-group date">
									<input name="dataDeLocacao" type="text" autocomplete="off" id="calendario"
										class="form-control" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</div>
								</div>

							</div>
						</div>

					</div>

				</td>

				<td>
					<div class="form-horizontal">

						<div class="form-group">
							<div class="col-sm-10">
								<div class="input-group date">
									<input name="dataDeVencimento" type="text" autocomplete="off" id="calendario1"
										class="form-control" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</div>
								</div>

							</div>
						</div>

					</div>

				</td>


				<td>
					<div>

						<input class="form-control" type="text" name="valorBase">

					</div>
				</td>



				<td><input type="button" class="btn btn-primary"
					onclick="cadastrar()" value="Gravar">
					</form></td>
			</tr>





		</tbody>
	</table>


</body>
</html>