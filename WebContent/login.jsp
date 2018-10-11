<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ebix Filmes</title>
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
<body class="bg-dark">
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header text-center">
				<h3>Painel Admnistrativo - Locadora</h3>
			</div>
			<div class="card-body">
				<form>
					<div class="form-group">
						<label for="exampleInputEmail1">Email</label> <input
							class="form-control" id="exampleInputEmail1" type="email"
							aria-describedby="emailHelp" name="email"
							placeholder="Digite seu email">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Senha</label> <input
							class="form-control" name="senha" id="exampleInputPassword1"
							type="password" placeholder="digite sua senha">
					</div>
					<div class="form-group">
						<div class="form-check">
							<label class="form-check-label"> <input
								class="form-check-input" type="checkbox"> Gravar senha
							</label>
						</div>
					</div>
					<a class="btn btn-primary btn-block" onclick="login1()">Autenticar</a>
				</form>
				<div class="text-center">
					<a class="d-block small mt-3" href="register.html">Registrar
						conta |</a> <a class="d-block small" href="forgot-password.html">Esqueceu
						sua senha?</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="bootstrap/jquery/jquery.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>
