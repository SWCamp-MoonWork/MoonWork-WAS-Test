<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>MoonWork_Dashboard</title>
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
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/dashboard.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<%
String test = "info";
%>
<body>
	<div id="viewport">
		<!-- Sidebar -->
		<div id="sidebar" class="ham-con">
			<header>
				<a href="#" class="d-flex">MoonWork</a>
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

					<div
						class="collapse navbar-collapse text-decoration-none user-info"
						id="navbarNavDarkDropdown" style="padding-left: 30px"></div>
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
					<a href="#" class="d-flex menu-area">Dashboard</a>
				</div>
			</div>
			<div class="container-fluid dashboard">

				<div class="row row-cols-1 row-cols-md-5 justify-content-center"
					style="padding: 15px 15px">
					<div class="col">
						<div class="card mb-3"
							style="width: 330px; height: 200px; border-radius: 30px;">
							<div class="row g-0">
								<div class="col-md-3"
									style="line-height: 200px; text-align: center">
									<img src="<%=request.getContextPath()%>/resources/img/all.png"
										class="img-fluid rounded-start" alt="..."
										style="vertical-align: middle; width: 70px; height: 70px;">
								</div>
								<div class="col-md-9">
									<div class="card-body">
										<h5 class="card-title">
											<strong>Total Jobs</strong>
										</h5>
										<p class="card-text"
											style="text-align: center; font-size: 70px;">10</p>
										<p class="card-text">
											<small class="text-muted"><a
												href="${pageContext.request.contextPath}/joblist.do"
												class="text-dark">view details..</a></small>
										</p>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="col">
						<div class="card mb-3"
							style="width: 330px; height: 200px; border-radius: 30px;">
							<div class="row g-0">
								<div class="col-md-3"
									style="line-height: 200px; text-align: center">
									<img src="<%=request.getContextPath()%>/resources/img/new.png"
										class="img-fluid rounded-start" alt="..."
										style="vertical-align: middle; width: 70px; height: 70px;">
								</div>
								<div class="col-md-9">
									<div class="card-body">
										<h5 class="card-title">
											<strong>Today New Jobs</strong>
										</h5>
										<p class="card-text"
											style="text-align: center; font-size: 70px;">1</p>
										<p class="card-text">
											<small class="text-muted"><a
												href="${pageContext.request.contextPath}/joblist.do"
												class="text-dark">view details..</a></small>
										</p>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="col">
						<div class="card mb-3"
							style="width: 330px; height: 200px; border-radius: 30px;">
							<div class="row g-0">
								<div class="col-md-3"
									style="line-height: 200px; text-align: center">
									<img
										src="<%=request.getContextPath()%>/resources/img/cancel-event.png"
										class="img-fluid rounded-start" alt="..."
										style="vertical-align: middle; width: 70px; height: 70px;">
								</div>
								<div class="col-md-9">
									<div class="card-body">
										<h5 class="card-title">
											<strong>No Schedule Jobs</strong>
										</h5>
										<p class="card-text"
											style="text-align: center; font-size: 70px;">0</p>
										<p class="card-text">
											<small class="text-muted"><a
												href="${pageContext.request.contextPath}/joblist.do"
												class="text-dark">view details..</a></small>
										</p>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="col">
						<div class="card mb-3"
							style="width: 330px; height: 200px; border-radius: 30px;">
							<div class="row g-0">
								<div class="col-md-3"
									style="line-height: 200px; text-align: center">
									<img src="<%=request.getContextPath()%>/resources/img/play.png"
										class="img-fluid rounded-start" alt="..."
										style="vertical-align: middle; width: 70px; height: 70px;">
								</div>
								<div class="col-md-9">
									<div class="card-body">
										<h5 class="card-title ">
											<strong>Today Started Jobs</strong>
										</h5>
										<p class="card-text"
											style="text-align: center; font-size: 70px;">0</p>
										<p class="card-text">
											<small class="text-muted"><a
												href="${pageContext.request.contextPath}/jobhistory.do"
												class="text-dark">view details..</a></small>
										</p>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="col">

						<div class="card mb-1"
							style="width: 330px; height: 100px; border-radius: 30px;">
							<div class="row g-0">
								<div class="col-md-4"
									style="line-height: 100px; text-align: center">
									<img
										src="<%=request.getContextPath()%>/resources/img/success.png"
										class="img-fluid rounded-start" alt="..."
										style="vertical-align: middle; width: 50px; height: 50px;">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title text-success">
											<strong>Success</strong>
										</h5>
										<p class="card-text"
											style="text-align: center; font-size: 35px;">0</p>
									</div>

								</div>
							</div>
						</div>

						<div class="card"
							style="width: 330px; height: 100px; border-radius: 30px;">
							<div class="row g-0">
								<div class="col-md-4"
									style="line-height: 100px; text-align: center">
									<img
										src="<%=request.getContextPath()%>/resources/img/failure.png"
										class="img-fluid rounded-start" alt="..."
										style="vertical-align: middle; width: 50px; height: 50px;">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title text-danger">
											<strong>Fail</strong>
										</h5>
										<p class="card-text"
											style="text-align: center; font-size: 35px;">0</p>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>


				<div class="row" style="padding: 10px 20px 0px 20px">
					<div class="col-sm-7">
						<div class="row mb-1"
							style="padding-right: 10px; padding-left: 0px; white-space: nowrap;">
							<h6>
								<strong>Runs Count View (Calendar)</strong>
							</h6>
							<div id='myChart'></div>
						</div>

						<div class="row">
							<div style="width: 20px; height: 20px">
								<i id="tooltip-info"
									class="fa-regular fa-circle-question fa-lg "
									data-bs-toggle="tooltip" data-bs-placement="right"
									title="그래프에 들어갈 내용(미정)"></i>
							</div>
							<canvas id="myChartThree" height="300px"></canvas>
						</div>
					</div>
					<div class="col-sm-5" style="height: 200px;">
						<div class="row justify-content-center">
							<h6>
								<strong>Simple Hosts View </strong>

							</h6>
							<table class="type04">
								<tr>
									<th scope="row"><strong>Master</strong></th>
									<td>HostName - 1</td>
									<td>192.168.0.0</td>
									<td><a href="#"><img
											src="<%=request.getContextPath()%>/resources/img/detail.png"
											width="30px" height="30px"></a></td>
								</tr>
								<tr>
									<th scope="row">Worker</th>
									<td>HostName - 2</td>
									<td>192.168.0.0</td>
									<td><a href="#"><img
											src="<%=request.getContextPath()%>/resources/img/detail.png"
											width="30px" height="30px"></a></td>
								</tr>
								<tr>
									<th scope="row">Worker</th>
									<td>HostName - 3</td>
									<td>192.168.0.0</td>
									<td><a href="#"><img
											src="<%=request.getContextPath()%>/resources/img/detail.png"
											width="30px" height="30px"></a></td>
								</tr>
								<tr>
									<th scope="row">Worker</th>
									<td>HostName - 4</td>
									<td>192.168.0.0</td>
									<td><a href="#"><img
											src="<%=request.getContextPath()%>/resources/img/detail.png"
											width="30px" height="30px"></a></td>
								</tr>
							</table>
						</div>
						<div class="row" style="height: 300px; padding-top: 15px;">
							<h6>
								<strong>Job of the selected host </strong>
							</h6>
							<div id="dashboard-jsGrid"></div>
						</div>
					</div>

				</div>
				<!-- ChartJs -->
				<script src="<%=request.getContextPath()%>/resources/js/chartjs.js"></script>
				<!-- zingChart calendar Chart-->
				<script
					src="<%=request.getContextPath()%>/resources/js/dashboard.js"></script>
				<!-- jsGrid -->
				<script src="<%=request.getContextPath()%>/resources/js/jsgrid.js"></script>
				<script
					src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
					crossorigin="anonymous"></script>
			</div>
		</div>
	</div>
</body>
</html>
