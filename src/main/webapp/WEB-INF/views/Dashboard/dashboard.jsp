<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoonWork_Dashboard</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
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
</head>
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
				<li><a href="${pageContext.request.contextPath}/joblist.do" class="nav-link px-0 align-middle"> <i
						class="fa-solid fa-list-ul"></i>Job List
				</a></li>
				<li><a href="${pageContext.request.contextPath}/jobschedule.do" class="nav-link px-0 align-middle"> <i
						class="fa-regular fa-calendar-days"></i>Job Scheduler
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
					<h6>menu / </h6><h4><strong>Dashboard</strong></h4>
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
						<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
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
				<div class="row">
					<div class="col-sm-6">
						<canvas id="myChartTwo"></canvas>
					</div>
					<div class="col-sm-6">
						<canvas id="myChartThree"></canvas>

					</div>
				</div>
				<div class="row" style="padding-top: 50px">
					<div class="col-sm-12">
						<div id="jsGrid"></div>

					</div>
				</div>
				<script>
					let myChartTwo = document.getElementById('myChartTwo')
							.getContext('2d');
					let myChartThree = document.getElementById('myChartThree')
							.getContext('2d');

					let barChartTwo = new Chart(myChartTwo, {
						type : 'bar', //pie, line, doughnut, polarArea
						data : {
							labels : [ '1번', '2번', '3번', '4번', '5번' ],
							datasets : [ {
								label : '테스트 데이터',
								data : [ 10, 100, 100, 200, 1000 ],
								backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
										'rgba(255, 159, 64, 0.2)',
										'rgba(255, 205, 86, 0.2)',
										'rgba(75, 192, 192, 0.2)',
										'rgba(54, 162, 235, 0.2)' ],
								borderWidth : 1,
								borderColor : [ 'rgb(255, 99, 132)',
										'rgb(255, 159, 64)',
										'rgb(255, 205, 86)',
										'rgb(75, 192, 192)',
										'rgb(54, 162, 235)' ],
								hoverBorderWidth : 1
							} ]
						}
					});

					let barChartThree = new Chart(myChartThree, {
						type : 'line', //pie, line, doughnut, polarArea
						data : {
							labels : [ '1번', '2번', '3번', '4번', '5번' ],
							datasets : [ {
								label : '테스트 데이터',
								data : [ 10, 100, 100, 200, 1000 ],
								borderColor : 'rgb(75, 192, 192)',
								tension : 0.1,
								fill : false
							} ]
						}
					});
				</script>

				<!-- jsGrid 실습 -->
				<script>
					
				<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
					var db = '<c:out value='${data}'/>'
					$(function() {

						$("#jsGrid").jsGrid({
							locale : "ko",
							editing : false,
							paging : true,
							autoload : true,
							width : "100%",
							height : "400px",
							sorting : true, // 칼럼의 헤더를 눌렀을 때, 그 헤더를 통한 정렬 
							
							controller: {
					            loadData: function(filter) {
					                return $.ajax({
					                    type: "GET",
					                    url: "/jsgrid.do",
					                    data: filter
					                });
					            }
							},
							
							fields : [ // 그리드 헤더 부분에 넣기 위해서 필드 지정 
							{
								name : "id",
								type : "text",
								width : 100
							}, {
								name : "name",
								type : "text",
								width : 100
							}, {
								name : "email",
								type : "text",
								width : 200
							}, {
								name : "birth",
								type : "text",
								width : 100
							}

							]
						});
					});
				</script>
			</div>
		</div>
	</div>


</body>
</html>
