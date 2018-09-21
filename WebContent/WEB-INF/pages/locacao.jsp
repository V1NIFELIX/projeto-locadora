<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
	 function alterar(idLocacao) {
		 document.forms[0].action = "locacao?acao=inicioAlterar&idLocacao="+idLocacao;
		 document.forms[0].method = "post";
		 document.forms[0].submit();
		 document.forms[0].action = "";	
}
	 
	 function exibirFilmesLocacao(idLocacao) {
		 document.forms[0].action = "locacao?acao=exibirFilmesLocacao&idLocacao="+idLocacao;
		 document.forms[0].method = "post";
		 document.forms[0].submit();
		 document.forms[0].action = "";	
}
	 
function finalizarLocacao(idLocacao) {
		 document.forms[0].action = "locacao?acao=FinalizarLocacao&idLocacao="+idLocacao;
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
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#collapse-navbar"
			aria-expanded="false">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="http://localhost:8080/projeto-locadora/">Ebix Filmes</a>

		<div class="collapse navbar-collapse" id="collapse-navbar">
			<ul class="nav navbar-nav">
				<li><a href="locacao?acao=populaCombosLocacao">Cadastrar
						Locação</a></li>
				<li><a href="http://localhost:8080/projeto-locadora/">Voltar</a></li>

			</ul>
		</div>
	</div>
	</nav>

	<table border="1" class="table table-striped" id="clientes">
		<thead>
			<tr>
				<th style="width: 15%; text-align: center">Nome</th>
				<th style="width: 5%">CPF:</th>
				<th style="width: 12%">Nome dos Filmes</th>
				<th style="width: 12%">Data da Locação</th>
				<th style="width: 12%">Data de Vencimento</th>
				<th style="width: 12%">Data da Devolução</th>
				<th style="width: 8%">Valor Base:</th>
				<th style="width: 8%">Valor Real:</th>
				<th style="width: 4%"></th>
				<th style="width: 4%"></th>
				<th style="width: 4%"></th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="l" items="${listaLocacao}">
				<tr class="linha-fixa">


					<td id="NomeLocacao${l.idLocacao}">${l.cliente.nomeC}</td>
					<td id="CpfLocacao">${l.cliente.cpfC}</td>
					<td>
						<form>
							<input type="button" class="btn btn-primary"
								onclick="exibirFilmesLocacao(${l.idLocacao})"
								value="Exibir Filme" />
						</form>
					</td>
					<td><fmt:formatDate value="${l.dataDeLocacao}"
							pattern="dd-MM-yyyy" /></td>
					<td><fmt:formatDate value="${l.dataDeVencimento}"
							pattern="dd-MM-yyyy" /></td>
					<td><fmt:formatDate value="${l.dataDeDevolucao}"
							pattern="dd-MM-yyyy" /></td>
					<td><fmt:formatNumber value="${l.valorBase}" type="currency" /></td>
					<td><fmt:formatNumber value="${l.valorReal}" type="currency" /></td>




					<td>
						<form>
							<input type="button" class="btn btn-info"
								onclick="alterar(${l.idLocacao})" value="Alterar">
						</form>
					</td>
					<td>
						<form>
							<input type="button" class="btn btn-primary"
								onclick="finalizarLocacao(${l.idLocacao})" value="Finalizar Locação">
						</form>
					</td>

					<td>
						<form>
							<input type="button" class="btn btn-primary"
								onclick="enviarEmail(${l.idLocacao})" value="Enviar Email">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>





	<script src="bootstrap/jquery/jquery.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>