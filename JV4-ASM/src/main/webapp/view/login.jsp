<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous" />
</head>
<body>
	<%@include file="/common/header.jsp"%>

	<section id="login">
		<div class="container-fluid my-5 mx-auto col-5">
			<c:if test="${not empty error}">
				<div class="alert alert-danger" role="alert">${error}</div>
			</c:if>
			<h2 class="text-center my-5">Đăng nhập</h2>
			<form action="login" method="post">
				<div class="form-group mb-5">
					<input name="username" type="text" class="form-control" placeholder="Username" />
				</div>
				<div class="form-group mb-5">
					<input name="password" type="password" class="form-control" placeholder="Password" />
				</div>
				
				<hr>
				<div class=" my-5 text-center">
					<button class="btn btn-outline-secondary btn-lg w-100">Login</button>
					<div class="my-3">
						<a href="forgotPass"> Quên mật khẩu?</a>
					</div>

				</div>

			</form>
		</div>
	</section>
	<%@include file="/common/footer.jsp"%>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>