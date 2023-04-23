<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ASM</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
</head>
<body>
	<%@include file="header.jsp"%>

	<section id="login">
		<div class="container-fluid my-5 mx-auto col-5">
			<h2 class="text-center my-5">Quên mật khẩu</h2>
			<form action="">
				<div class="form-group mb-5">
				<label class="form-label">Username</label>
					<input type="text" class="form-control" placeholder="Username" />
				</div>
				<div class="form-group mb-5">
				<label class="form-label">Email</label>
					<input type="email" class="form-control" placeholder="Email" />
				</div>
				
				
				<button type="button" class="btn btn-outline-secondary btn-lg w-100">
					Xác nhận</button>
			</form>
		</div>
	</section>
	<%@include file="footer.jsp"%>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>