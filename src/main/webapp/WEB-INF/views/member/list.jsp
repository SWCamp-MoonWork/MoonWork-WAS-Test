<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
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
				<a href="/" class="d-flex">MoonWork</a>
			</header>
			<ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start"
						id="menu">
				<li><a href="member/list" data-bs-toggle="collapse"
					class="nav-link px-0 align-middle"> <i
						class="fs-4 bi-speedometer2"></i>Dashboard</a></li>
				<li><a href="/member/jobscheduler"
					class="nav-link px-0 align-middle"> <i class="fs-4 bi-table"></i>Job Scheduler</a></li>
			</ul>
		</div>
		<!-- Content -->
		<div id="content">
			<nav class="navbar">
				<div class="container-fluid" id="topnav">
					<ul class="nav navbar-nav navbar-right">
					<!-- css 다시 적용해야함(우측정렬) -->
						<li><a href="#">Sign In</a></li>
					</ul>
				</div>
			</nav>
			<div class="container-fluid">
				<h1>Simple Sidebar</h1>
				<p>
					Make sure to keep all page content within the
					<code>#content</code>
					.
				</p>
				<div class="row">
					<div class="col-sm-6">
						실행중인 노드
						<p>
							<canvas id="myChartOne"></canvas>
					</div>
					<div class="col-sm-6">
						<h1>Member List</h1>
						<input type="button" value="회원 등록" onclick="location.href='write'">
						<table border="1" width="600px">
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Email</th>
								<th>Birth</th>
							</tr>
							<!-- MemberController에서 model을 통해 넘겨준 변수명(items)과 동일해야 함 -->
							<!-- items 리스트에서 하나씩. dto 값 출력 -->
							<c:forEach var="row" items="${items}">
								<tr>
									<td>${row.id}</td>
									<td><a
										href="${pageContext.request.contextPath}/member/view?id=${row.id}">
											${row.name}</a></td>
									<td>${row.email}</td>
									<td>${row.birth}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<canvas id="myChartTwo"></canvas>
						<canvas id="myChartThree"></canvas>
						<div id="jsGrid"></div>

					</div>
				</div>
				<script>
					let myChartOne = document.getElementById('myChartOne')
							.getContext('2d');
					let myChartTwo = document.getElementById('myChartTwo')
							.getContext('2d');
					let myChartThree = document.getElementById('myChartThree')
							.getContext('2d');

					let barChart = new Chart(myChartOne, {
						type : 'pie', //pie, line, doughnut, polarArea
						data : {
							labels : [ '1번', '2번', '3번', '4번', '5번' ],
							datasets : [ {
								label : '테스트 데이터',
								data : [ 10, 100, 100, 200, 1000 ]
							} ]
						}
					});

					let barChartTwo = new Chart(myChartTwo, {
						type : 'bar', //pie, line, doughnut, polarArea
						data : {
							labels : [ '1번', '2번', '3번', '4번', '5번' ],
							datasets : [ {
								label : '테스트 데이터',
								data : [ 10, 100, 100, 200, 1000 ],
								backgroundColor : [ 'red',
										'rgba(255, 255, 0, 0.5)', '#990000',
										'skyblue', 'dodgerblue' ],
								borderWidth : 5,
								borderColor : '#000',
								hoverBorderWidth : 10
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
								backgroundColor : [ 'red',
										'rgba(255, 255, 0, 0.5)', '#990000',
										'skyblue', 'dodgerblue' ],
								borderWidth : 5,
								borderColor : '#000',
								hoverBorderWidth : 10
							} ]
						}
					});
				</script>

				<!-- jsGrid 실습 -->
				<script>
					
				<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
					//var dataMap = '<c:out value='${dataMap}'/>'
					$(function() {

						$("#jsGrid").jsGrid({
							locale : "ko",
							editing : false,
							paging : false,
							autoload : true,
							width : "100%",
							height : "400px",
							sorting : true, // 칼럼의 헤더를 눌렀을 때, 그 헤더를 통한 정렬 

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

							],
							controller : {
								loadData : function() {
									var d = $.Deferred();
									$.ajax({
										url : '/jsgrid',
										dataType : 'json',
										success : function(data) {
											deferred.resolve(data);
										}
									});
									return d.promise();
								}
							}
						})
					})
				</script>
			</div>
		</div>
	</div>
</body>
</html>
