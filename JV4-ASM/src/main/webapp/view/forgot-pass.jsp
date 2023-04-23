<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Quên mật khẩu</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
	<%@include file="/common/header.jsp"%>

	<section id="login">
		<div class="container-fluid my-5 mx-auto col-5">
			<h2 class="text-center my-5">Quên mật khẩu</h2>
			<h5 style="color: red" id="messageReturn"></h5>
			
			<div class="form-group mb-5">
				<input id="email" name="email" type="email" class="form-control"
					placeholder="Email" />
			</div>
			<hr>
			<div class=" my-5 text-center">
				<button id="sendBtn" class="btn btn-outline-secondary btn-lg w-100">Send</button>
			</div>
		</div>
	</section>
	<%@include file="/common/footer.jsp"%>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>

	<script>
		$('#sendBtn').click(function() {
			$('#messageReturn').text('');
			var email = $('#email').val();
			var formData = {'email' : email};
			$.ajax({
				url: 'forgotPass',
				type: 'POST',
				data: formData
			}).then(function(data){
				$('#messageReturn').text('Password has been reset, please check your email');
				setTimeout(function(){
					window.location.href = 'http://localhost:8081/JV4-ASM/index';
				}, 5*1000);
			}).fail(function(error){
				$('#messageReturn').text('Your information is not correct, try again');
			});
		});
	</script>
</body>
</html>