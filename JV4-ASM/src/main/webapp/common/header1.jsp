<%@ page pageEncoding="utf-8"%>
<%@include file="/common/taglib.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<nav class="navbar navbar-expand-lg"
	aria-label="Thirteenth navbar example">
	<div class="container-fluid">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarsExample11" aria-controls="navbarsExample11"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>


		<div class="collapse navbar-collapse d-lg-flex" id="navbarsExample11">
			<div class="col-lg-3 d-flex">
				<a class="navbar-brand  me-0"
					href="index">Hài.com</a>
				<ul class="navbar-nav ms-2">
					<li class="nav-item"><a class="nav-link"
						href="adminVideo">Video</a></li>
					<li class="nav-item"><a class="nav-link"
						href="adminUser">User</a></li>
					<li class="nav-item"><a class="nav-link"
						href="adminReport">Report</a></li>
				</ul>
			</div>
			<div class="col-lg-5 justify-content-lg-center">
				<form class="d-flex" role="search">
					<input class="form-control w-100 me-2" type="search"
						placeholder="Search" aria-label="Search" />
					<button class="btn btn-outline-success col-3" type="submit">
						Search</button>
				</form>
			</div>
			<div class="d-lg-flex col-lg-4 justify-content-lg-end">
				<ul class="navbar-nav">
					<c:choose>
						<c:when test="${ not empty sessionScope.currentUser}">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#"
								data-bs-toggle="dropdown" aria-expanded="false">Chức năng</a>
								<ul class="dropdown-menu">
									<li>
										<a href="" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#changePasswordModal">
											Đổi mật khẩu
										</a>
									</li>
									<li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
									<li><a class="dropdown-item"
										href="favorite">Video yêu thích</a></li>
									<li><a class="dropdown-item"
										href="history">Lịch sử</a></li>
								</ul>
							</li>
							<li class="nav-item"><a class="nav-link "
								aria-current="page" href="/JV4-ASM/view/login.jsp">Welcome, ${ sessionScope.currentUser.userName}</a></li>
							
							
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link "
								aria-current="page" href="login">Đăng nhập</a></li>
							<li class="nav-item"><a class="nav-link"
								href="register">Đăng kí</a></li>
							<li class="nav-item"><a class="nav-link"
								href="forgotPass">Quên mật khẩu</a></li>
						</c:otherwise>
					</c:choose>


				</ul>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
<div class="modal fade" id="changePasswordModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Change Password</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="form-group mb-2">
			<input id="currentPass" name="currentPass" type="password" class="form-control" placeholder="current password" />
		</div>
		<div class="form-group mb-2">
			<input id="newPass" name="newPass" type="password" class="form-control" placeholder="new password" />
		</div>
		<h5 style="color: red" id="messageChangePass"></h5>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="changePassBtn">Save changes</button>
      </div>
    </div>
  </div>
</div>
</nav>




