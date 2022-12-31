<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoonWork_Dashboard</title>
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
	href="../../resources/css/dashboard.css" />
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
		<div id="sidebar">
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
				<li><a href="${pageContext.request.contextPath}/jobschedule.do"
					class="nav-link px-0 align-middle"> <i
						class="fa-regular fa-calendar-days"></i>Job Scheduler
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
					<h6>menu /</h6>
					<h4>
						<strong>Dashboard</strong>
					</h4>
					<div class="collapse navbar-collapse text-decoration-none"
						id="navbarNavDarkDropdown"></div>
					<div class="dropdown">
						<a href="#"
							class="align-items-center text-dark text-decoration-none dropdown-toggle"
							id="dropdownUser1" data-bs-toggle="dropdown"
							aria-expanded="false"> <i
							class="fa-solid fa-circle-user fa-lg"></i> <span
							class="d-none d-sm-inline mx-1">Han</span>
						</a>
						<ul class="dropdown-menu dropdown-menu-white shadow"
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
			<div class="container-fluid dashboard">
				<div class="row row-cols-1 row-cols-md-4 justify-content-center"
					style="padding: 15px 15px">
					<div class="col">
						<div class="card mb-3 rounded-pill"
							style="max-width: 400px; height: 220px ;">
							<div class="row g-0">
								<div class="col-md-4" style="line-height:220px;">
									<img src="../../resources/img/plus.png" class="img-fluid rounded-start" alt="..." style="vertical-align:middle;">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title"><strong>Total Runs</strong></h5>
										<p class="card-text"
											style="text-align: center; font-size: 70px;">10</p>
										<p class="card-text">
											<small class="text-muted"><a href="#" class="text-dark">view
													details..</a></small>
										</p>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="col">
						<div class="card mb-3 rounded-pill"
							style="max-width: 400px; height: 220px">
							<div class="row g-0">
								<div class="col-md-4" style="line-height:220px;">
									<img src="../../resources/img/plus.png" class="img-fluid rounded-start" alt="..." style="vertical-align:middle;">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title"><strong>Today New Runs</strong></h5>
										<p class="card-text"
											style="text-align: center; font-size: 70px; ">1</p>
										<p class="card-text">
											<small class="text-muted"><a href="#" class="text-dark">view
													details..</a></small>
										</p>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="col">
						<div class="card mb-3 rounded-pill"
							style="max-width: 400px; height: 220px">
							<div class="row g-0">
								<div class="col-md-4" style="line-height:220px;">
									<img src="../../resources/img/plus.png" class="img-fluid rounded-start" alt="..." style="vertical-align:middle;">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title"><strong>No Schedule Runs</strong></h5>
										<p class="card-text"
											style="text-align: center; font-size: 70px;">0</p>
										<p class="card-text">
											<small class="text-muted"><a href="#" class="text-dark">view
													details..</a></small>
										</p>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="col">
						<div class="row justify-content-center">
							<div class="card mb-3 rounded-pill"
								style="max-width: 400px; height: 110px">
								<div class="row g-0">
									<div class="col-md-4" style="line-height:110px;">
										<img src="../../resources/img/plus.png" class="img-fluid rounded-start" alt="..." style="vertical-align:middle; width:80px; height:80px">
									</div>
									<div class="col-md-8">
										<h5 class="card-title"><strong>Today Started Runs</strong></h5>
										<p class="card-text"
											style="text-align: center; font-size: 35px; margin-bottom:0px">5</p>
										<p class="card-text">
											<small class="text-muted"><a href="#" class="text-dark">view
													details..</a></small>
										</p>
									</div>
								</div>
							</div>
						</div>

						<div class="row row-cols-md-2 justify-content-center">
							<div class="col">
								<div class="card mb-3 rounded-pill"
									style="max-width: 200px; max-height: 110px">
									<div class="row g-0">
										<div class="col-md-4" style="line-height:110px;">
											<img src="../../resources/img/plus.png" class="img-fluid rounded-start" alt="..." style="vertical-align:middle;">
										</div>
										<div class="col-md-8">
											<div class="card-body">
												<h5 class="card-title"><strong>Success</strong></h5>
												<p class="card-text" style="text-align: center;  font-size: 20px;">4</p>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col">
								<div class="card mb-3 rounded-pill"
									style="max-width: 200px; max-height: 110px">
									<div class="row g-0">
										<div class="col-md-4" style="line-height:110px;">
											<img src="../../resources/img/plus.png" class="img-fluid rounded-start" alt="..." style="vertical-align:middle;">
										</div>
										<div class="col-md-8">
											<div class="card-body">
												<h5 class="card-title"><strong>Fail</strong></h5>
												<p class="card-text" style=" text-align: center; font-size: 20px;">1</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="row" style="padding-top: 30px">
				<div class="col-sm-6" style="height: 400px;">
					<div class="row row-cols-2 row-cols-md-4 justify-content-center">
						<div class="col">
							<div class="card text-white bg-success mb-3"
								style="max-width: 18rem;">
								<div class="card-header">
									<strong>MasterNode</strong>
								</div>
								<div class="card-body">
									<h5 class="card-title">가동중</h5>
									<p class="card-text">마스터 노드이기 때문에 무조건 가동중이어야함</p>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card text-white bg-primary mb-3"
								style="max-width: 18rem;">
								<div class="card-header">
									<strong>WorkerNode-1</strong>
								</div>
								<div class="card-body">
									<h5 class="card-title">사용 대기 중</h5>
									<p class="card-text">작업은 할당됬지만 스케줄에 당도하지 않음?</p>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card text-white bg-secondary mb-3"
								style="max-width: 18rem;">
								<div class="card-header">
									<strong>WorkerNode-2</strong>
								</div>
								<div class="card-body">
									<h5 class="card-title">쉬는 중</h5>
									<p class="card-text">아무 작업도 할당되지 않은 경우</p>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card text-white bg-danger mb-3"
								style="max-width: 18rem;">
								<div class="card-header">
									<strong>WorkerNode-3</strong>
								</div>
								<div class="card-body">
									<h5 class="card-title">오류</h5>
									<p class="card-text">작업 실행 중에 오류가 발생한 경우</p>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card text-white mb-3" style="max-width: 18rem;">
								<div class="card-body" style="text-align: center">
									<p class="card-text">
										<img src="../../resources/img/plus.png"
											style="width: 50px; height: 50px;">
									</p>
								</div>
							</div>
						</div>

					</div>

				</div>

				<div class="col-sm-6">
					<div class="row">
						<canvas id="myChartTwo"></canvas>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div id="dashboard-jsGrid"></div>
				</div>
				<div class="col-sm-6">
					<div class="row">
						<canvas id="myChartThree"></canvas>
					</div>
				</div>
			</div>
			<!-- ChartJs -->
			<script src="../resources/js/chartjs.js"></script>
			<!-- jsGrid -->
			<script src="../resources/js/jsgrid.js"></script>
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
				crossorigin="anonymous"></script>

		</div>
	</div>
</body>
</html>
