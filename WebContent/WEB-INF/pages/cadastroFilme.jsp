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
	function cadastrar() {
		document.forms[0].action = "filmes?acao=cadastro"
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
<title>Cadastro Filme</title>
</head>
<body>
	<div class="container-fluid">

		<form>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="NomeCliente">Nome do Filme</label> <input type="text"
						class="form-control" id="nomeF" name="nomeF"
						placeholder="Digite aqui o novo do Filme">
				</div>
			</div>


		
			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="DataNasc">Sinopse do Filme</label> <input type="text"
						class="form-control" id="sinopseF" name="sinopseF"
						placeholder="Digite aqui a sinopse do Filme" />
				</div>
			</div>
				<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="DataNasc">Quantidade</label> <input type="text"
						class="form-control" id="quantidadeF" name="quantidadeF"
						placeholder="Digite a quantidade de Filmes" />
				</div>
			</div>
			
			<input type="button" class="btn btn-success" onclick="cadastrar()"
				value="Cadastrar">
				
			<input type="button" class="btn btn-primary" onclick="voltar()"
				value="Voltar">
				
				
				
		</form>

	</div>
				











	<script src="bootstrap/jquery/jquery.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>