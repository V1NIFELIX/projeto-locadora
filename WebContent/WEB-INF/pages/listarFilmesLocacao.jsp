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
<title>Filmes Locacao</title>
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
		<a class="navbar-brand" href="#">Ebix Filmes</a>

		<div class="collapse navbar-collapse" id="collapse-navbar">
			<ul class="nav navbar-nav">
				<li><a href="http://localhost:8080/projeto-locadora/locacao?acao=inicioLocacao">Voltar</a></li>

			</ul>
		</div>
	</div>
	</nav>
	
	<table border="1" class="table table-striped" id="clientes">
		<thead>
			<tr>
				<th style="width: 20%; text-align: center"> Lista de Filmes:</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="l"	items="${listaLocacaoFilmes}">
				<tr class="linha-fixa">
				<td>"${l.nomeF}"</td>
				</tr>	
			</c:forEach>
		</tbody>
	</table>	
		
	








	<script src="bootstrap/jquery/jquery.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>