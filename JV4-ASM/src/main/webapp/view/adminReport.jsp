<%@ page pageEncoding="utf-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Report</title>
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
					aria-controls="home-tab-pane" aria-selected="true">Favorite</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
					data-bs-target="#profile-tab-pane" type="button" role="tab"
					aria-controls="profile-tab-pane" aria-selected="false">
					Favorite User</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="contact-tab" data-bs-toggle="tab"
					data-bs-target="#contact-tab-pane" type="button" role="tab"
					aria-controls="contact-tab-pane" aria-selected="false">Share
					Friend</button>
			</li>
		</ul>
		<div class="tab-content " id="myTabContent">
			<div class="tab-pane fade show active" id="home-tab-pane"
				role="tabpanel" aria-labelledby="home-tab" tabindex="0">
				<div class="container">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Video Title</th>
								<th scope="col">Favorite Count</th>
								<th scope="col">Latest Date</th>
								<th scope="col">Oldest Date</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>Mark</td>
								<td>Otto</td>
								<td>Active</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Jacob</td>
								<td>Thornton</td>
								<td>Active</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Larry the Bird</td>
								<td>Larry the Bird</td>
								<td>Active</td>
							</tr>
							<tr>
								<th scope="row">1</th>
								<td>Mark</td>
								<td>Otto</td>
								<td>Active</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Jacob</td>
								<td>Thornton</td>
								<td>Active</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Larry the Bird</td>
								<td>Larry the Bird</td>
								<td>Active</td>
							</tr>
						</tbody>
					</table>
				</div>

				<center>
					<button class="btn btn-outline-primary"><<</button>
					<button class="btn btn-outline-primary"><</button>
					<button class="btn btn-outline-primary">></button>
					<button class="btn btn-outline-primary">>></button>
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
								<th scope="col">Fullname</th>
								<th scope="col">Email</th>
								<th scope="col">Favorite Date</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>Mark</td>
								<td>Otto</td>
								<td>Active</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Jacob</td>
								<td>Thornton</td>
								<td>Active</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Larry the Bird</td>
								<td>Larry the Bird</td>
								<td>Active</td>
							</tr>
							<tr>
								<th scope="row">1</th>
								<td>Mark</td>
								<td>Otto</td>
								<td>Active</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Jacob</td>
								<td>Thornton</td>
								<td>Active</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Larry the Bird</td>
								<td>Larry the Bird</td>
								<td>Active</td>
							</tr>
						</tbody>
					</table>
					<center>
						<button class="btn btn-outline-primary"><<</button>
						<button class="btn btn-outline-primary"><</button>
						<button class="btn btn-outline-primary">></button>
						<button class="btn btn-outline-primary">>></button>
					</center>
				</div>
			</div>

			<div class="tab-pane fade" id="contact-tab-pane" role="tabpanel"
				aria-labelledby="contact-tab" tabindex="0">
				<div class="container">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Sender Name</th>
								<th scope="col">Sender Email</th>
								<th scope="col">Receiver Email</th>
								<th scope="col">Sent Date</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>Mark</td>
								<td>Otto</td>
								<td>Active</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Jacob</td>
								<td>Thornton</td>
								<td>Active</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Larry the Bird</td>
								<td>Larry the Bird</td>
								<td>Active</td>
							</tr>
							<tr>
								<th scope="row">1</th>
								<td>Mark</td>
								<td>Otto</td>
								<td>Active</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Jacob</td>
								<td>Thornton</td>
								<td>Active</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Larry the Bird</td>
								<td>Larry the Bird</td>
								<td>Active</td>
							</tr>
						</tbody>
					</table>
					<center>
						<button class="btn btn-outline-primary"><<</button>
						<button class="btn btn-outline-primary"><</button>
						<button class="btn btn-outline-primary">></button>
						<button class="btn btn-outline-primary">>></button>
					</center>
				</div>
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