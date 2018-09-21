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
	function alterar(idFilme) {
		document.forms[0].action = "filmes?acao=alterar&idFilme="+idFilme;
		document.forms[0].method = "post";
		document.forms[0].submit();
		document.forms[0].action = "";
			
	}
	
	function voltar() {
		document.forms[0].action = "http://localhost:8080/projeto-locadora/filmes?acao=listarFilmes"
		document.forms[0].method = "post";
		document.forms[0].submit();
		document.forms[0].action = "";
			
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alterações</title>
</head>
<body>
	<h2 class="container-fluid">Informações Atuais</h2>
	
	<div class="container-fluid">

		<div class="row">
			<div class="col-xs-6 col-md-4">
				<label>Nome Atual</label> <input type="text" class="form-control"
				value="${filmeTela.nomeF}" disabled>
			</div>
		</div>
	
		
		<div class="row">
			<div class="col-xs-6 col-md-4">
				<label>Sinopse Atual</label> <input type="text" class="form-control"
				value="${filmeTela.sinopseF}" disabled>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-6 col-md-4">
				<label>Quantidade</label> <input type="text" class="form-control"
				value="${filmeTela.quantidadeF}" disabled>
			</div>
		</div>	
	</div>

	<h2 class="container-fluid">Novas informações</h2>
	<div class="container-fluid">
		<form>
			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>Novo Nome:</label> <input type="text" class="form-control"
						name="nomeF" value="${filmeTela.nomeF}" />
				</div>

			</div>



			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>Nova Sinopse:</label> <input type="text"
						class="form-control" name="sinopseF" value="${filmeTela.sinopseF}" />
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>Quantidade:</label><input type="text" class="form-control"
						name="quantidadeF" value="${filmeTela.quantidadeF}" />
				</div>
			</div>

			<input type="button" class="btn btn-primary"
				onclick="alterar(${filmeTela.idFilmes})" value="Gravar"> <input
				type="button" class="btn btn-info" onclick="voltar()" value="Voltar">


		</form>
	</div>



	<script src="bootstrap/jquery/jquery.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>