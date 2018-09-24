<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="bootstrap/css/estilos.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">


<script>
	function alterar(idCliente) {
		document.forms[0].action = "cliente?acao=alterar&idCliente="+idCliente;
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
<title>Alterar cadastro</title>
</head>
<body>
	
	<h2 class="container-fluid">Informações Atuais</h2>
	
	<div class="container-fluid">

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>Nome:</label> <input type="text" class="form-control"
						value="${clienteTela.nomeC}" disabled>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>CPF:</label> <input type="text" class="form-control"
						value="${clienteTela.cpfC}" disabled>
				</div>
			</div>

		<div class="row">
			<div class="col-xs-6 col-md-4">
				<label>Data de Nascimento:</label><label class="form-control"
					disabled><fmt:formatDate value="${clienteTela.dataNascC}"
						pattern="dd/MM/yyyy" /> </label>
			</div>

		</div>

		<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>Senha:</label> <input type="text" class="form-control"
						value="${clienteTela.senhaC}"disabled>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>Email:</label> <input type="text" class="form-control"
						value="${clienteTela.emailC}" disabled>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>Endereço:</label> <input type="text" class="form-control"
						value="${clienteTela.endC}" disabled>
				</div>
			</div>	


	</div>
	
	<h2 class="container-fluid">Novas informações</h2>

	<div class="container-fluid">
		<form>
			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>Novo Nome:</label> <input type="text" class="form-control"
						name="nomeC" value="${clienteTela.nomeC}"/>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>Novo CPF:</label> <input type="text" class="form-control"
						name="cpfC" value="${clienteTela.cpfC}" />
				</div>
			</div>

			<div class="row">
			
			<!-- FAZER ALTERAÇÃO NA DATA DE NASCIMENTO E DEIXAR O INPUT -->
				<div class="col-xs-6 col-md-4">
					<label>Nova Data de Nascimento:</label><input type="text"
						class="form-control" name="dataNascC" value="${data}"><fmt:formatDate value="${clienteTela.dataNascC}"
						pattern="dd/MM/yyyy"/>
						
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>Nova Senha:</label> <input type="text" class="form-control"
						name="senhaC" value="${clienteTela.senhaC}"/>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>Novo Email:</label> <input type="text" class="form-control"
						name="emailC" value="${clienteTela.emailC}" />
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-md-4">
					<label>Novo Endereço</label> <input type="text"
						class="form-control" name="endC" value="${clienteTela.endC}"/>
				</div>
			</div>

			<input type="button" class="btn btn-primary"
				onclick="alterar(${clienteTela.idCliente})" value="Gravar">
				
			<input type="button" class="btn btn-info"
				onclick="voltar()" value="Voltar">	
		
		
		</form>
	</div>





	<script src="bootstrap/jquery/jquery.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>