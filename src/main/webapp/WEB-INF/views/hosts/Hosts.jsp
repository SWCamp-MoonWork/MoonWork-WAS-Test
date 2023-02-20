<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon"
	href="<%=request.getContextPath()%>/resources/img/moonwork_favicon.ico">
<meta charset="UTF-8">
<title>MoonWork_Job List</title>
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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<%
	String userName = (String) session.getAttribute("Name");
	%>
	<div id="viewport">

		<!-- Content -->
		<div id="content">
			<nav class="navbar navbar-expand-lg">
				<div class="container-fluid">
					<a class="moonwork-img"><img
						src="<%=request.getContextPath()%>/resources/img/moonwork_logo.png"
						width="23px" height="23px"></a> <a href="#"
						class="d-flex moonwork">MoonWork</a>
					<div
						class="collapse navbar-collapse text-decoration-none user-info"
						id="navbarNavDarkDropdown" style="padding-left: 30px"></div>
					<input type="checkbox" id="dn""> <label for="dn"
						style="background-color: var(- -color-light); border-radius: 10px;"
						class="toggle2"> <span
						class="material-icons toggle__handler">light_mode</span>
					</label>
					<div class="dropdown" style="padding-right: 30px">
						<a href="#"
							class="align-items-center text-decoration-none dropdown-toggle"
							id="dropdownUser1" data-bs-toggle="dropdown"
							aria-expanded="false"> <i
							class="fa-solid fa-circle-user fa-lg"
							style="color: rgba(0, 123, 255, 0.5)"></i> <span
							class="d-none d-sm-inline mx-1"><%=userName%></span>
						</a>
						<ul class="dropdown-menu shadow" aria-labelledby="dropdownUser1">
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
			<div id="hidden-menu">
				<ul class="nav nav-pills " id="menu">

					<li class="hidden-hover"><a
						href="${pageContext.request.contextPath}/dashboard.do"
						class="nav-link px-0 align-middle">Dashboard </a></li>
					<li class="hidden-hover"><a
						href="${pageContext.request.contextPath}/joblist.do"
						class="nav-link px-0 align-middle">Job List </a></li>
					<li class="hidden-hover"><a
						href="${pageContext.request.contextPath}/jobhistory.do"
						class="nav-link px-0 align-middle">Runs History </a></li>
					<li class="hidden-hover"><a
						href="${pageContext.request.contextPath}/hosts.do"
						class="nav-link px-0 align-middle">Hosts </a></li>
					<li class="hidden-hover"><a
						href="${pageContext.request.contextPath}/users.do"
						class="nav-link px-0 align-middle">Users </a></li>
				</ul>
			</div>
			<!-- Sidebar -->
			<div id="sidebar" class="ham-con">

				<header> </header>
				<ul class="nav nav-pills " id="menu">
					<li class="menu-hamburger"><a href="#"
						class="nav-link px-0 align-middle menu-trigger "> <i
							class="fa-solid fa-bars fa-lg hamburger"></i>
					</a></li>
					<li class="menu-hover"><a
						href="${pageContext.request.contextPath}/dashboard.do"
						class="nav-link px-0 align-middle "> <i
							class="fa-solid fa-chart-line"></i>
					</a></li>
					<li class="menu-hover"><a
						href="${pageContext.request.contextPath}/joblist.do"
						class="nav-link px-0 align-middle "> <i
							class="fa-regular fa-rectangle-list"></i>
					</a></li>
					<li class="menu-hover"><a
						href="${pageContext.request.contextPath}/jobhistory.do"
						class="nav-link px-0 align-middle "> <i
							class="fa-solid fa-clock-rotate-left"></i>
					</a></li>
					<li class="menu-hover"><a
						href="${pageContext.request.contextPath}/hosts.do"
						class="nav-link px-0 align-middle "
						style="color: var(- -color-primary)"> <i
							class="fa-solid fa-tv"></i>
					</a></li>
					<li class="menu-hover"><a
						href="${pageContext.request.contextPath}/users.do"
						class="nav-link px-0 align-middle "> <i
							class="fa-regular fa-user"></i>
					</a></li>
				</ul>
			</div>

			<div class="container-fluid read">
				<div class="row">
					<div class="col-sm-12">
						<div class="joblist-table"
							style="width: 100%; height: 700px; overflow: auto; border: 1px solid var(- -color-shadow); border-radius: 10px">
							<table id="job-table">
								<thead>
									<tr>
										<td>HostId</td>
										<td>HostName</td>
										<td>IsUse</td>
										<td>Role</td>
										<td>EndPoint</td>
										<td>HostIp</td>
										<td>PrivateIp</td>
										<td>Note</td>
										<td>SaveDate</td>
										<td>UserId</td>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${hosts}">
										<tr>
											<td>${row.hostId}</td>
											<td>${row.hostName}</td>
											<td>${row.isUse}</td>
											<td>${row.role}</td>
											<td>${row.endPoint}</td>
											<td>${row.hostIp}</td>
											<td>${row.privateIp}</td>
											<td>${row.note}</td>
											<td>${row.saveDate}</td>
											<td>${row.userId}</td>
										</tr>

									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ChartJs -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/chartjs.js"></script>
	<!-- Hamburger -->
	<script src="<%=request.getContextPath()%>/resources/js/dashboard.js"></script>
	<!-- jsGrid -->
	<script src="<%=request.getContextPath()%>/resources/js/jsgrid.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/joblist.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/columnEvent.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>