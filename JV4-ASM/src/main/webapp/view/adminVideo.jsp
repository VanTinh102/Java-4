<%@ page pageEncoding="utf-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Video</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous" />
</head>
<body>
	<%@include file="/common/header1.jsp"%>

	<div class="container ">
		<ul class="nav nav-tabs mt-3"  id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
					data-bs-target="#home-tab-pane" type="button" role="tab"
					aria-controls="home-tab-pane" aria-selected="true">Video
					Edition</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
					data-bs-target="#profile-tab-pane" type="button" role="tab"
					aria-controls="profile-tab-pane" aria-selected="false">
					Video List</button>
			</li>
		</ul>
		<div class="tab-content " id="myTabContent">
			<div class="tab-pane fade show active" id="home-tab-pane"
				role="tabpanel" aria-labelledby="home-tab" tabindex="0">
				<div class="row">
					<div class="col-lg-4">
						<a href=""> <img src="/JV4-ASM/img/youthumb_1_high.png"
							class="card-img-top" alt="..." />
						</a>
					</div>
					<div class="col-lg-8">
						<form action="DangKiServlet.php" method="post">
							<div class="mb-3">
								<label class="form-label">Video ID</label> <input type="text"
									name="Video ID" class="form-control" required="required" />
							</div>
							<div class="mb-3">
								<label class="form-label">Video
									Title</label> <input type="text" name="password" class="form-control"
									required="required" />
							</div>
							<div class="mb-3">
								<label class="form-label">Video
									Count</label> <input type="text" name="password" class="form-control"
									required="required" />
							</div>
							<div class="mb-3">
								<input name="gender" type="radio" value="Active"
									checked="checked" /> Active <input name="gender" type="radio"
									value="Inactive" /> Inactive
							</div>
						</form>
					</div>
				</div>
				<div class="row">
					<div class="mb-4">
						<label for="exampleFormControlTextarea1" class="form-label">Ghi
							chú:</label>
						<textarea name="notes" class="form-control"
							id="exampleFormControlTextarea1" rows="3"></textarea>
					</div>
				</div>

				<center>
					<button class="btn btn-outline-primary">Create</button>
					<button class="btn btn-outline-primary">Update</button>
					<button class="btn btn-outline-primary">Delete</button>
					<button class="btn btn-outline-primary">Reset</button>
				</center>
				<div class="mb-3"></div>
			</div>
			<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel"
				aria-labelledby="profile-tab" tabindex="0">
				<div class="container">
					<table class="table">
					<thead>
						<tr>
							<th scope="col">Video ID</th>
							<th scope="col">Video Title</th>
							<th scope="col">Video Count</th>
							<th scope="col">Status</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="video" items="${videos}">
						<tr>
							<td>${video.videoID}</td>
							<td>${video.title}</td>
							<td><a href="video?action=watch&id=${video.href}">${video.href}</a></td>
							<td>${video.totalLike}</td>
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