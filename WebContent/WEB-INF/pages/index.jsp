<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ebix Filmes</title>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="bootstrap/css/estilos.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<script>
	function login1() {
		document.forms[0].action = "login?acao=login"
		document.forms[0].method = "post";
		document.forms[0].submit();
		document.forms[0].action = "";

	}
</script>



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
				<li><a href="filmes?acao=listarFilmes">Acessar Filmes</a></li>
				<li><a href="cliente?acao=listar">Acessar Cliente</a></li>
				<li><a href="locacao?acao=inicioLocacao">Loca��o</a></li>
				<li><a href="cliente?acao=logout">Logout</a></li>
			</ul>
		</div>
	</div>
	</nav>












	<script src="bootstrap/jquery/jquery.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>