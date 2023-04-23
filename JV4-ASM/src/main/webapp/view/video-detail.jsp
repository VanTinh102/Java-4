<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>${video.title}</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

</head>
<body>
	<%@include file="/common/header.jsp"%>

	<section id="video-detail">
		<div class="container-fluid my-5">
			<div class="row">
				<div class="col-lg-8">
					<center>
						<iframe width="860" height="435"
							src="https://www.youtube.com/embed/${video.href}"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
							allowfullscreen></iframe>
					</center>
					<div class="d-flex justify-content-between align-items-center my-4">
						<h2 class="ms-3">${video.title}</h2>
						<div class="gap-2">
							<c:if test="${not empty sessionScope.currentUser}">
								<button id="likeOrUnlikeBtn" class="btn btn-outline-dark">
									<c:choose>
										<c:when test="${flagLikeBtn == true}">DisLike</c:when>
										<c:otherwise>Like</c:otherwise>
									</c:choose>
								</button>
								<!-- Button trigger modal -->
								<button class="btn btn-outline-dark" data-bs-toggle="modal"
									data-bs-target="#exampleModal">Share</button>

								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title fs-5" id="exampleModalLabel">
													Send video to your friend</h1>
												<button class="btn-close" data-bs-dismiss="modal"
													aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<div class="form-floating mb-3">
													<input type="email" class="form-control" id="floatingInput"
														placeholder="name@example.com" /> <label
														for="floatingInput">Email address</label>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>
												<button class="btn btn-primary">Send</button>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</div>
					</div>
					<div class="description ms-3"
						style="background-color: rgb(232, 233, 235); padding: 20px; border-radius: 15px;">
						<p>
							<b>1 view</b>
						</p>
						<p>${video.description}</p>
					</div>
				</div>

				<div class="col-lg-4">
					<h2>Video đã xem</h2>
					<div class="list-group">
						<a href="video-detail.jsp"
							class="list-group-item list-group-item-action"
							aria-current="true"> <img
							src="/JV4-ASM/img/youthumb_1_high.png" class="" alt="..."
							width="80px" /> HÀI LÒ RƯỢU TÁM NỔ
						</a> <a href="video-detail.jsp"
							class="list-group-item list-group-item-action"
							aria-current="true"> <img
							src="/JV4-ASM/img/youthumb_1_high.png" class="" alt="..."
							width="80px" /> HÀI LÒ RƯỢU TÁM NỔ
						</a> <a href="video-detail.jsp"
							class="list-group-item list-group-item-action"
							aria-current="true"> <img
							src="/JV4-ASM/img/youthumb_1_high.png" class="" alt="..."
							width="80px" /> HÀI LÒ RƯỢU TÁM NỔ
						</a>
						<input id="videoIdHdn" type="hidden" value="${video.href}">
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file="/common/footer.jsp"%>
	

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
	
	<script>
	$('#likeOrUnlikeBtn').click(function () {
		var videoid = $('#videoIdHdn').val();
		$.ajax({
			url:'video?action=like&id='+ videoid,
		}).then(function (data) {
			var text = $('#likeOrUnlikeBtn').text();
			if (text.indexOf('Like')!=-1) {
				$('#likeOrUnlikeBtn').text('Unlike');
			} else{
				$('#likeOrUnlikeBtn').text('Like');
			}
		}).fail(function(error) {
			alert('Oop!!! please try again ^^');
		});
	});
	</script>	
	
	
</body>
</html>