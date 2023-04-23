<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
				<a class="navbar-brand  me-0" href='<c:url value='/view/index.jsp' ></c:url>'>Hài.com</a>
				<ul class="navbar-nav ms-2">
					<li class="nav-item"><a class="nav-link" href="/JV4-ASM/view/adminVideo.jsp">Video</a></li>
					<li class="nav-item"><a class="nav-link" href="/JV4-ASM/view/adminUser.jsp">User</a></li>
					<li class="nav-item"><a class="nav-link" href="/JV4-ASM/view/adminReport.jsp">Report</a></li>
				</ul>
			</div>
			<div class="col-lg-6 justify-content-lg-center">
				<form class="d-flex" role="search">
					<input class="form-control w-100 me-2" type="search"
						placeholder="Search" aria-label="Search" />
					<button class="btn btn-outline-success col-3" type="submit">
						Search</button>
				</form>
			</div>
			<div class="d-lg-flex col-lg-3 justify-content-lg-end">
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						data-bs-toggle="dropdown" aria-expanded="false">Chức năng</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item"
								href="/JV4-ASM/view/changePassword.jsp">Đổi mật khẩu</a></li>
							<li><a class="dropdown-item" href="#">Đăng xuất</a></li>
							<li><a class="dropdown-item" href="#">Chỉnh sửa hồ sơ</a></li>
							<li><a class="dropdown-item"
								href="/JV4-ASM/view/favVideo.jsp">Video yêu thích</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link " aria-current="page"
						href="/JV4-ASM/view/login.jsp">Đăng nhập</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/JV4-ASM/view/register.jsp">Đăng kí</a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>
