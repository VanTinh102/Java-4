<%@ page pageEncoding="utf-8"%>
<%@include file="/common/taglib.jsp"%>
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
</head>
<body>
	<%@include file="/common/header1.jsp"%>
	<section id="video">
		<div class="container-fluid mt-3">
			<div class="row g-3">
				<c:forEach var="video" items="${videos}">
					<div class="col-lg-4">
						<div class="card">
							<a href="<c:url value ='/video?action=watch&id=${video.href}'></c:url>"> <img
								src="${video.poster}" class="card-img-top"
								alt="..." />
							</a>

							<div class="card-body">
								<h5 class="card-title">${video.title}</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<!-- Button trigger modal -->
										<button class="btn btn-sm btn-outline-secondary"
											data-bs-toggle="modal" data-bs-target="#exampleModal">
											${video.share} Shares</button>

										<!-- Modal -->
										<div class="modal fade" id="exampleModal" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h1 class="modal-title fs-5" id="exampleModalLabel">
															Send video to your friend</h1>
														<button class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<div class="form-floating mb-3">
															<input type="email" class="form-control"
																id="floatingInput" placeholder="name@example.com" /> <label
																for="floatingInput">Email address</label>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Close</button>
														<button class="btn btn-primary">
															Send</button>
													</div>
												</div>
											</div>
										</div>
			
									</div>
									<small class="text-muted">${video.views} views</small>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>


			</div>
		</div>
	</section>

	<section id="page">
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center mt-4">
				<c:if test="${currentPage ==1 }">
					<li class="page-item disable"><a class="page-link" href="#">Previous</a></li>
				</c:if>
				<c:if test="${currentPage > 1 }">
					<li class="page-item"><a class="page-link" href="index?page=${currentPage -1}">Previous</a></li>
				</c:if>
				
				<c:forEach varStatus="i" begin="1" end="${maxPage}">
					<li class="page-item"><a class="page-link ${currentPage == i.index ? 'active': ''} " href="index?page=${i.index}">${i.index}</a></li>
				</c:forEach>
				
				<c:if test="${currentPage == maxPage }">
					<li class="page-item disable"><a class="page-link" href="#">Next</a></li>
				</c:if>
				<c:if test="${currentPage < maxPage}">
					<li class="page-item"><a class="page-link" href="index?page=${currentPage +1}">Next</a></li>
				</c:if>
			</ul>
		</nav>
	</section>

	<%@include file="/common/footer.jsp"%>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>