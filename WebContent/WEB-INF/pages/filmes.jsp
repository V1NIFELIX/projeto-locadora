<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="bootstrap/css/estilos.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<script>
	function alterar(idFilmes) {
		 document.forms[0].action = "filmes?acao=iniciaAlterar&idFilmes="+idFilmes;
		 document.forms[0].method = "POST";
		 document.forms[0].submit();
		 document.forms[0].action = "";
		
	} 
	function deletar(idFilmes) {
		 document.forms[0].action = "filmes?acao=delete&idFilmes="+idFilmes;
		 document.forms[0].method = "POST";
		 document.forms[0].submit();
		 document.forms[0].action = "";
		
	}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Locadora Web</title>
</head>

<body>
		<nav class="navbar navbar-default">
		<div class="container-fluid">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapse-navbar" aria-expanded="false">
	            <span class="sr-only">Toggle navigation</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="http://localhost:8080/projeto-locadora/index.jsp">Ebix Filmes</a>
		
			<div class="collapse navbar-collapse" id="collapse-navbar">
				 <ul class="nav navbar-nav">
					<li><a href="filmes?acao=inicioCadastro">Cadastrar Filmes</a></li>
					<li><a href="http://localhost:8080/projeto-locadora/index.jsp">Voltar</a></li>
				</ul>
			</div>
		</div>
	</nav>






	<table border="1" class="table table-striped" id="filmes">
		<thead>
			<tr>
				<th style="width: 20%; text-align: center">Filme:</th>
				<th style="width: 15%">Sinopse</th>
				<th style="width: 1%">Quantidade</th>
				<th style="width: 1%">Alteração</th>
				<th style="width: 1%">Exclusão</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="f" items="${listaFilmes}">
				<tr class="linha-fixa">
					<td id="nomeFilme${f.idFilmes}">${f.nomeF}</td>
					<td id="sinopseFilme${f.idFilmes}">${f.sinopseF}</td>
					<td id="quantidadeF${f.idFilmes}">${f.quantidadeF}</td>
					<td>
						<form>
							<input type="button" class="btn btn-info"
								onclick="alterar(${f.idFilmes})" value="Alterar">
						</form>
					</td>
					<td>
						<form>
							<input class="btn btn-danger" type="button"
								onclick="deletar(${f.idFilmes})" value="Excluir">
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