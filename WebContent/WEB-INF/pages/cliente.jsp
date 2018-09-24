<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="bootstrap/css/estilos.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">


<script type="text/javascript">
 function deletar(idCliente){	 
	 
	 document.forms[0].action = "cliente?acao=delete&idCliente="+idCliente;
	 document.forms[0].method = "post";
	 document.forms[0].submit();
	 document.forms[0].action = "";
 }
 function alterar(idCliente) {
	 document.forms[0].action = "cliente?acao=iniciarAlterar&idCliente="+idCliente;
	 document.forms[0].method = "post";
	 document.forms[0].submit();
	 document.forms[0].action = "";
	 
	 
	
}

</script>
<link rel="stylesheet" type="text/css" href="/css/main.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listagem Cliente</title>
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
					<li><a href="cliente?acao=inicioCadastro">Cadastrar Cliente</a></li>
					<li><a href="http://localhost:8080/projeto-locadora/index.jsp">Voltar</a></li>		
				</ul>			
			</div>
		</div>
	</nav>





	<table border="1" class="table table-striped" id="clientes">
		<thead>
			<tr>
				<th style="width: 20%; text-align: center">Nome</th>
				<th style="width: 12%">CPF:</th>
				<th style="width: 12%">Data de Nascimento</th>
				<th style="width: 12%">Senha:</th>
				<th style="width: 12%">Email:</th>
				<th style="width: 12%">Endereço</th>
				<th style="width: 5%"></th>
				<th style="width: 5%"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="cl" items="${listaClientes}">
				<tr class="linha-fixa">
					<td id="nomeCliente${cl.idCliente}">${cl.nomeC}</td>
					<td id="nomeCpf${cl.idCliente}">${cl.cpfC}</td>
					<td><fmt:formatDate value="${cl.dataNascC}" pattern="dd/MM/yyyy"/>
					<td id="nomeSenha${cl.idCliente}">${cl.senhaC}</td>
					<td id="nomeEmail${cl.idCliente}">${cl.emailC}</td>
					<td id="nomeEmail${cl.idCliente}">${cl.endC}</td>
					<td>
						<form>
							<input type="button" class="btn btn-info" onclick="alterar(${cl.idCliente})"
								value="Alterar">
						</form>
					</td>
					<td>
						<form>
							<input type="button" class="btn btn-danger" onclick="deletar(${cl.idCliente})"
								value="Excluir">
						</form>
					</td>
				</tr>
			</c:forEach>
	</table>

	<script src="bootstrap/jquery/jquery.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>