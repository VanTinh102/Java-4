<%@ page pageEncoding="utf-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>User</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous" />
</head>
<body>
	<%@include file="/common/header1.jsp"%>

	<div class="container ">
		<ul class="nav nav-tabs mt-3" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
					data-bs-target="#home-tab-pane" type="button" role="tab"
					aria-controls="home-tab-pane" aria-selected="true">User
					Edition</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
					data-bs-target="#profile-tab-pane" type="button" role="tab"
					aria-controls="profile-tab-pane" aria-selected="false">
					User List</button>
			</li>
		</ul>
		<div class="tab-content " id="myTabContent">
			<div class="tab-pane fade show active" id="home-tab-pane"
				role="tabpanel" aria-labelledby="home-tab" tabindex="0">
				<form action="" class="mt-3">
					<div class="form-group mb-5">
						<input type="text" class="form-control" placeholder="Fullname" />
					</div>

					<div class="form-group mb-5">
						<input type="text" class="form-control" placeholder="Username" />
					</div>
					<div class="form-group mb-5">
						<input type="password" class="form-control" placeholder="Password" />
					</div>
					<div class="mb-5 ">
						<input type="email" name="birthday" class="form-control"
							placeholder="Email address" required="required">
					</div>
					
				</form>

				<center>
					
					<button class="btn btn-outline-primary">Update</button>
					<button class="btn btn-outline-primary">Delete</button>
					
				</center>
				<div class="mb-3"></div>
			</div>
			<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel"
				aria-labelledby="profile-tab" tabindex="0">
				<div class="container">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Username</th>
								<th scope="col">Password</th>
								<th scope="col">Email</th>
								<th scope="col">Role</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="user" items="${users}">
							<tr>
								<td>${user.userName}</td>
								<td>${user.password}</td>
								<td>${user.email}</td>
								<td>${user.isADMIN == true ? 'admin': 'user'}</td>
							</tr>
						</c:forEach>
							
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>

	<%@include file="/common/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>