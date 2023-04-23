<%@ page pageEncoding="utf-8"%>
<section id="footer">
	<div class="container sticky-bottom" style="margin-top: 60px">
		<footer class="py-3 ">
			<ul class="nav justify-content-center border-bottom pb-3 mb-3">
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">Home</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">Features</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">Pricing</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">FAQs</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">About</a></li>
			</ul>
			<p class="text-center text-muted">© 2022 Company, Inc</p>
		</footer>
	</div>
</section>

<script>
		$('#changePassBtn').click(function() {
			$('#messageChangePass').text('');
			var currentPass = $('#currentPass').val();
			var newPass = $('#newPass').val();
			var formData = {
					'currentPass' : currentPass,
					'newPass' : newPass
					};
			$.ajax({
				url: 'changePass',
				type: 'POST',
				data: formData
			}).then(function(data){
				$('#messageChangePass').text('Password has been change');
			}).fail(function(error){
				$('#messageChangePass').text('Your information is not correct, try again');
			});
		});
	</script>