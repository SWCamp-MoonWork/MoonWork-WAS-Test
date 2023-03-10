<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="<%=request.getContextPath()%>/resources/img/moonwork_favicon.ico">
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>MoonWork_Dashboard</title>
		<script src="https://cdn.zingchart.com/zingchart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script nonce="undefined"
	src="https://cdn.zingchart.com/zingchart.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
<script src="https://kit.fontawesome.com/fe820bbe93.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/dashboard.css" />
<!-- Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
<%
String userName = (String)session.getAttribute("Name");

%>
	<div id="viewport">

		<!-- Content -->
		<div id="content">
			<nav class="navbar navbar-expand-lg">
				<div class="container-fluid">
					<a class="moonwork-img"><img src="<%=request.getContextPath()%>/resources/img/moonwork_logo.png"
											width="23px" height="23px"></a>
					<a class="d-flex moonwork">MoonWork</a>
					


					<div
						class="collapse navbar-collapse text-decoration-none user-info"
						id="navbarNavDarkDropdown" style="padding-left: 30px"></div>
					<input type="checkbox" id="dn" > <label for="dn" style="background-color:var(--color-light); border-radius:10px;"
						class="toggle2"> <span class="material-icons toggle__handler">light_mode</span>
					</label>
					<div class="dropdown" style="padding-right: 30px">
						<a href="#"
							class="align-items-center text-decoration-none dropdown-toggle"
							id="dropdownUser1" data-bs-toggle="dropdown"
							aria-expanded="false"> <i
							class="fa-solid fa-circle-user fa-lg" style="color:rgba(0, 123, 255, 0.5)"></i> <span
							class="d-none d-sm-inline mx-1"><%=userName %></span>
						</a>
						<ul class="dropdown-menu shadow" aria-labelledby="dropdownUser1">
							<li><a class="dropdown-item" href="#">Profiles</a></li>
							<li><a class="dropdown-item" href="#">Settings</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/logout.do">Sign out</a></li>
						</ul>
					</div>
				</div>
			</nav>
		<div id="hidden-menu">
			<ul
				class="nav nav-pills "
				id="menu" >

				<li class="hidden-hover"><a href="${pageContext.request.contextPath}/dashboard.do"
					class="nav-link px-0 align-middle">Dashboard
				</a></li>
				<li class="hidden-hover" ><a href="${pageContext.request.contextPath}/joblist.do"
					class="nav-link px-0 align-middle">Job List
				</a></li>
				<li class="hidden-hover"><a href="${pageContext.request.contextPath}/jobhistory.do"
					class="nav-link px-0 align-middle">Runs History
				</a></li>
				<li class="hidden-hover"><a href="${pageContext.request.contextPath}/hosts.do"
					class="nav-link px-0 align-middle">Hosts
				</a></li>
				<li class="hidden-hover"><a href="${pageContext.request.contextPath}/users.do"
					class="nav-link px-0 align-middle">Users
				</a></li>
			</ul>
		</div>
		<!-- Sidebar -->
		<div id="sidebar" class="ham-con">

			<header>
			</header>
			<ul
				class="nav nav-pills "
				id="menu">
				<li class="menu-hamburger" ><a href="#"
					class="nav-link px-0 align-middle menu-trigger "> <i class="fa-solid fa-bars fa-lg hamburger"></i>
				</a></li>
				<li class="menu-hover" ><a href="${pageContext.request.contextPath}/dashboard.do"
					class="nav-link px-0 align-middle " style="color: var(--color-primary)"> <i
						class="fa-solid fa-chart-line"></i>
				</a></li>
				<li class="menu-hover"  ><a href="${pageContext.request.contextPath}/joblist.do"
					class="nav-link px-0 align-middle "> <i class="fa-regular fa-rectangle-list"></i>
				</a></li>
				<li class="menu-hover" ><a href="${pageContext.request.contextPath}/jobhistory.do"
					class="nav-link px-0 align-middle "> <i
						class="fa-solid fa-clock-rotate-left"></i>
				</a></li>
				<li class="menu-hover" ><a href="${pageContext.request.contextPath}/hosts.do"
					class="nav-link px-0 align-middle "> <i class="fa-solid fa-tv"></i>
				</a></li>
				<li class="menu-hover" ><a href="${pageContext.request.contextPath}/users.do"
					class="nav-link px-0 align-middle "> <i class="fa-regular fa-user"></i>
				</a></li>
			</ul>
		</div>
			
			

			<div class="container-fluid dashboard" >

				<div class="row row-cols-1 row-cols-md-5 justify-content-center">
					<div class="col">
						<div class="card mb-3"
							style="width: 103%; height: 200px;">
							<div class="row g-0">

								<div class="col-md-12">
									<div class="card-body">
										<h5 class="card-title">
											<i class="fa-regular fa-flag fa-lg" style="color: var(--color-primary)"></i><strong>&nbsp;&nbsp;&nbsp;Total Jobs</strong>
										</h5>
										<p class="card-text card-count"
											style="text-align: center; font-size: 70px; margin-top:15px">${TotalJobsCount}</p>
										<p class="card-text detail-link">
											<small><a style="color: var(--color-dark); text-decoration-line:none;"
												href="${pageContext.request.contextPath}/joblist.do"
												>view details..</a></small>
										</p>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="col">
						<div class="card mb-3"
							style="width: 103%; height: 200px;">
							<div class="row g-0">

								<div class="col-md-12">
									<div class="card-body">
										<h5 class="card-title">
											<i class="fa-solid fa-plug-circle-plus fa-lg" style="color: #7B4ED4"></i><strong>&nbsp;&nbsp;&nbsp;Today New Jobs</strong>
										</h5>
										<p class="card-text card-count"
											style="text-align: center; font-size: 70px; margin-top:15px">${TodayNewJobs}</p>
										<p class="card-text">
											<small><a style="color: var(--color-dark); text-decoration-line:none;"
												href="${pageContext.request.contextPath}/joblist.do"
												>view details..</a></small>
										</p>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="col">
						<div class="card mb-3"
							style="width: 103%; height: 200px;">
							<div class="row g-0">

								<div class="col-md-12">
									<div class="card-body">
										<h5 class="card-title">
											<i class="fa-regular fa-calendar-xmark fa-lg" style="color: var(--color-warning)"></i><strong>&nbsp;&nbsp;&nbsp;No Schedule Jobs</strong>
										</h5>
										<p class="card-text card-count"
											style="text-align: center; font-size: 70px; margin-top:15px">${NoScheduleJobs}</p>
										<p class="card-text">
											<small><a style="color: var(--color-dark); text-decoration-line:none;"
												href="${pageContext.request.contextPath}/joblist.do"
												>view details..</a></small>
										</p>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="col">
						<div class="card mb-3"
							style="width: 103%; height: 200px;">
							<div class="row g-0">

								<div class="col-md-12">
									<div class="card-body">
										<h5 class="card-title ">
											<i class="fa-regular fa-circle-play fa-lg" style="color: var(--color-info)"></i><strong>&nbsp;&nbsp;&nbsp;Today Started Runs</strong>
										</h5>
										<p class="card-text card-count"
											style="text-align: center; font-size: 70px; margin-top:15px">${TodayStartedJobs}</p>
										<p class="card-text">
											<small><a style="color: var(--color-dark); text-decoration-line:none;"
												href="${pageContext.request.contextPath}/jobhistory.do"
												>view details..</a></small>
										</p>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="col">

						<div class="card mb-2"
							style="width: 101%; height: 96px;">
							<div class="row g-0">
								<div class="col-md-4"
									style="line-height: 96px; text-align: center">
									<i class="fa-solid fa-circle-check fa-fade fa-3x" 
									style="color:#39D452; --fa-animation-duration: 2s; vertical-align: middle; "></i>

								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title" style="color:#39D353">
											<strong>Success</strong>
										</h5>
										<p class="card-text card-count"
											style="text-align: center; font-size: 35px;">0</p>
									</div>

								</div>
							</div>
						</div>

						<div class="card"
							style="width: 101%; height: 96px;">
							<div class="row g-0">
								<div class="col-md-4"
									style="line-height: 96px; text-align: center">
									<i class="fa-solid fa-triangle-exclamation fa-fade fa-3x" 
									style="color:#D42449; --fa-animation-duration: 2s; vertical-align: middle; "></i>

								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title" style="color:#D42448">
											<strong>Fail</strong>
										</h5>
										<p class="card-text card-count"
											style="text-align: center; font-size: 35px;">0</p>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>


				<div class="row " style="padding:0px 10px 10px 10px">
					<div class="col-md-8">
						<div class="row mb-3 dashboard-View"
							style="  background:var(--color-white);">
							<h6>
								<strong>Runs Count Calendar (2023)</strong>
							</h6>
							<div id="myCalendarChart">

							</div>
						<div class="row" style="position:absolute; background:var(--color-white); left: 52%;width:245px; height:30px; margin-top: 200px; z-index:1000">
						
						</div>
						</div>

						<div class="row  dashboard-View" style="z-index:1000">

							<h6>
								<strong>Runs Duration(ms) of Jobs</strong>
							</h6>
							<div id='DashRunHistoryChart'></div>
							
						</div>
					</div>
					<div class="col-md-4" style="padding-left:28px">
						<div class="row mb-3 dashboard-View justify-content-center">
							<h6>
								<strong>Host Details</strong>

							</h6>
							<table class="type04">
							<c:forEach var="row" items="${Hosts}">
								<tr>
									<th scope="row">Worker</th>
									<td>${row.hostName}</td>
									<td>${row.privateIp}</td>
									<td><a href="javascript:void(0)" id="${row.hostId}" class="hostdetail"><img
											src="<%=request.getContextPath()%>/resources/img/detail.png"
											width="30px" height="30px"></a></td>
								</tr>
							</c:forEach>
								<tr>
									<th>&nbsp;</th>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							</table>
						</div>
						<div class="row dashboard-View" style="">
							<h6 style="height:30px">
								<strong>Job of Host</strong>
							</h6>
							<div class="job-of-host" 
							style="height:365px ;background: var(--color-table); 
							border: 1px solid var(--color-table); border-radius: 20px;">
							<table style="margin:auto; padding: 10px 10px 10px 10px; width:100%;">
									<thead>
										<tr style="font-weight:bold">
											<td>JobId</td>
											<td>JobName</td>
											<td>Last Run</td>
											<td>Next Run</td>
										</tr>
									</thead>
									<tbody class="jobofhost-body">
										<tr>
											<td id="jobid-of-host"></td>
											<td id="jobname-of-host"></td>
											<td id="lastrun-of-host"></td>
											<td id="nextrun-of-host"></td>
										</tr>
									</tbody>
								</table>
								</div>
						</div>
					</div>

				</div>
				<!-- ChartJs -->

				<!-- zingChart calendar Chart-->
				<script
					src="<%=request.getContextPath()%>/resources/js/dashboard.js"></script>
				<!-- jsGrid -->
				<script src="<%=request.getContextPath()%>/resources/js/jsgrid.js"></script>
				<script src="<%=request.getContextPath()%>/resources/js/chartjs.js"></script>
				<script
					src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
					crossorigin="anonymous"></script>
			</div>
		</div>
	</div>
</body>
</html>
