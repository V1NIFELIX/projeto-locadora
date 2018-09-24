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
		document.forms[0].action = "cliente?acao=cadastro"
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
<title>Cadastro Cliente</title>
</head>
<body>

	<div class="container-fluid">

		<form>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="NomeCliente">Nome completo</label> <input type="text"
						class="form-control" id="NomeCliente" name="nomeC"
						placeholder="Seu nome">
				</div>
			</div>


			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="CpfCliente">CPF</label> <input type="text"
						class="form-control" id="CpfCliente" name="cpfC"
						placeholder="Seu CPF" />				
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="DataNasc">Data de Nascimento</label> <input type="text"
						class="form-control" id="DataNasc" name="dataNascC"
						placeholder="Sua Data de Nascimento" />
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="SenhaCliente">Senha</label> <input type="password"
						class="form-control" name="senhaC" placeholder="Sua senha" />
				</div>
			</div>
			
			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="EmailCliente">Email</label> <input type="email"
						class="form-control" name="emailC" placeholder="Seu Email" />
				</div>
			</div>
			
			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label for="EndCliente">Endereço</label> <input type="text"
						class="form-control" name="endC" placeholder="Seu Endereço" />	
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					
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