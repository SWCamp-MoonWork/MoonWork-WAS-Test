<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoonWork_Hosts</title>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
<script src="https://kit.fontawesome.com/fe820bbe93.js"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/dashboard.css" />
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/joblist.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script>
	$(document).ready(function() {
		$('#host-jsGrid').resizable({
			handles : "s",
		});
	});
</script>
</head>
<body>
	<div id="viewport">
		<!-- Sidebar -->
		<div id="sidebar" class="ham-con">
			<header>
				<a href="#" class="d-flex">Menu</a>
			</header>
			<ul
				class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start"
				id="menu">
				<li><a href="${pageContext.request.contextPath}/dashboard.do"
					class="nav-link px-0 align-middle"> <i
						class="fa-solid fa-chart-line"></i>Dashboard
				</a></li>
				<li><a href="${pageContext.request.contextPath}/joblist.do"
					class="nav-link px-0 align-middle"> <i
						class="fa-solid fa-list-ul"></i>Job List
				</a></li>
				<li><a href="${pageContext.request.contextPath}/jobhistory.do"
					class="nav-link px-0 align-middle"> <i
						class="fa-solid fa-clock-rotate-left"></i>Run History
				</a></li>
				<li><a href="${pageContext.request.contextPath}/hosts.do"
					class="nav-link px-0 align-middle"> <i class="fa-solid fa-tv"></i>Hosts
				</a></li>
			</ul>
			<footer>
				<p>MoonWork v0.0.1</p>
			</footer>
		</div>
		<!-- Content -->
		<div id="content">
			<nav class="navbar navbar-expand-lg">
				<div class="container-fluid">
					<ul class="navbar-nav hambuger">
						<li class="ham-btn"><a class="menu-trigger" href="#"> <span></span>
								<span></span> <span></span>
						</a></li>
					</ul>
					<a href="#" class="d-flex moonwork">MoonWork</a>
					<a href="#" class="d-flex menu-area">Hosts</a>
					<div class="collapse navbar-collapse text-decoration-none"
						id="navbarNavDarkDropdown"></div>
					<div class="dropdown">
						<a href="#"
							class="align-items-center text-white text-decoration-none dropdown-toggle"
							id="dropdownUser1" data-bs-toggle="dropdown"
							aria-expanded="false"> <i
							class="fa-solid fa-circle-user fa-lg"></i> <span
							class="d-none d-sm-inline mx-1">Han</span>
						</a>
						<ul class="dropdown-menu dropdown-menu-dark shadow"
							aria-labelledby="dropdownUser1">
							<li><a class="dropdown-item" href="#">Profiles</a></li>
							<li><a class="dropdown-item" href="#">Settings</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/home.do">Sign out</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<div class="row">
				<div class="col-sm-1">
					<a href="#" class="d-flex menu-area">Hosts</a>
				</div>
			</div>
			<div class="container-fluid hosts">
				<div class="row">
					<div class="col-sm-12">
						<div id="host-jsGrid"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Hamburger -->
	<script src="<%=request.getContextPath()%>/resources/js/dashboard.js"></script>
	<!-- jsGrid -->
	<script src="<%=request.getContextPath()%>/resources/js/jsgrid.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>