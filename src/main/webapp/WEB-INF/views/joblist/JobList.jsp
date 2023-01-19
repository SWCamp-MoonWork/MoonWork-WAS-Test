<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<script>
		$(document)
				.ready(
						function() {
							$('.joblist-table').resizable({
								handles : "s", //리사이즈 되는 모서리는 남쪽(south)으로 고정
							});
							$("#search-Keyword")
									.keyup(
											function() {
												var key = $(this).val();
												$("#job-table > tbody > tr")
														.hide();
												var temp = $("#job-table > tbody > tr > td:nth-child(7n+2):contains('"
														+ key + "')");
												$(temp).parent().show();
											});
						});
	</script>

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
					<div
						class="collapse navbar-collapse text-decoration-none user-info"
						id="navbarNavDarkDropdown" style="padding-left: 30px"></div>
					<input type="checkbox" id="dn"> <label for="dn"
						class="toggle2"> <span
						class="material-icons toggle__handler">light_mode</span>
					</label>
					<div class="dropdown" style="padding-right: 30px">
						<a href="#"
							class="align-items-center text-decoration-none dropdown-toggle"
							id="dropdownUser1" data-bs-toggle="dropdown"
							aria-expanded="false"> <i
							class="fa-solid fa-circle-user fa-lg"></i> <span
							class="d-none d-sm-inline mx-1">Han</span>
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
			<div class="row">
				<div class="col-sm-1">
					<a href="#" class="d-flex menu-area">Job List</a>
				</div>
			</div>
			<div class="container-fluid read">
				<div class="row">
					<div class="col-sm-12"
						style="display: flex; justify-content: space-between;">
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#addModal">Add
							Job</button>
						<div class="wrap"
							style="margin-top: auto; margin-bottom: auto; width: 30rem;">
							<div class="search">
								<input type="text" class="searchTerm" id="search-Keyword"
									placeholder="검색어를 입력해주세요 (Name)">
								<button type="submit" class="searchButton">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="joblist-table"
							style="width: 100%; height: 300px; overflow: auto; border: 1px solid gray">
							<table id="job-table">
								<thead>
									<tr>
										<td>No</td>
										<td>Name</td>
										<td>Action</td>
										<td>IsUse</td>
										<td>SaveDate</td>
										<td>User</td>
										<td>Delete</td>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${jobs}">
										<tr>
											<td>${row.jobId}</td>
											<td><a href="javascript:void(0);" class="jobdetail"
												id="${row.jobId}">${row.jobName}</a></td>

											<td class="actions">
												<button type="button" class="btn btn-info editbtn"
													data-bs-toggle="modal" data-bs-target="#editModal"
													data-id="${row.jobId}">Edit</button>

												<button type="button" class="btn btn-warning"
													data-bs-toggle="modal" data-bs-target="#scheduleModal">Schedule</button>
												<button type="button" class="btn btn-success"
													data-bs-toggle="modal" data-bs-target="#runsModal">Runs</button>
											</td>
											<td>${row.isUse}</td>
											<td><fmt:formatDate value="${row.saveDate}"
													pattern="yyyy-MM-dd HH:mm" /></td>
											<td>${row.userId}</td>
											<td class="actions"><button class="btn btn-danger"
													value="${row.jobId}" id="delbtn"
													onclick="javascript:delbtn(this)">Delete</button></td>
										</tr>

									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="row" style="padding-top: 40px">
					<div class="col-sm-12">

						<div class="container-fluid detail-form">
							<form class="row g-3">
								<div class="col-md-4">
									<label for="inputEmail4" class="form-label"><strong>JobId</strong></label>
									<input type="text" class="form-control detail"
										id="detail-JobId" value="">
								</div>
								<div class="col-md-4">
									<label for="inputPassword4" class="form-label"><strong>JobName</strong></label>
									<input readonly type="text" class="form-control detail"
										id="detail-JobName" value="">
								</div>
								<div class="col-md-4">
									<label for="inputAddress" class="form-label"><strong>WorkflowName</strong></label>
									<input readonly type="text" class="form-control detail"
										id="detail-WorkflowName" value="">
								</div>
								<div class="col-md-4">
									<label for="inputAddress" class="form-label"><strong>HostName</strong></label>
									<input readonly type="text" class="form-control detail"
										id="detail-HostName" value="">
								</div>
								<div class="col-md-4">
									<label for="inputAddress" class="form-label"><strong>HostIp</strong></label>
									<input readonly type="text" class="form-control detail"
										id="detail-HostIp" value="">
								</div>
								<div class="col-md-4">
									<label for="inputAddress" class="form-label"><strong>IsUse</strong></label>
									<input readonly type="text" class="form-control detail"
										id="detail-IsUse" value="">
								</div>
								<div class="col-md-4">
									<label for="inputAddress" class="form-label"><strong>CreateUser</strong></label>
									<input readonly type="text" class="form-control detail"
										id="detail-CreateUser" value="">
								</div>
								<div class="col-md-4">
									<label for="inputAddress" class="form-label"><strong>SaveDate</strong></label>
									<input readonly type="date" class="form-control detail"
										id="detail-SaveDate" value="">
								</div>
								<div class="col-md-4">
									<label for="inputAddress" class="form-label"><strong>Note</strong></label>
									<textarea readonly class="form-control detail" id="detail-Note"
										value="" style="height: 80px;"></textarea>
								</div>
								<div class="col-md-12">
									<label for="inputAddress" class="form-label detail"><strong>Registered
											Schedule</strong></label>
									<div id="schedule-jsGrid"></div>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- AddModal -->
	<div class="modal fade" id="addModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-bs-backdrop="static">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">Add Job</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form name="addform" id="add-form"
					action="${pageContext.request.contextPath}/createjob.do"
					onsubmit="return addJob()" method="post"
					enctype="multipart/form-data">
					<div class="modal-body">
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label job-text"><strong>Job
									Name</strong></label> <input type="text" class="form-control" name="jobName"
								placeholder="ex) 영업부 DB 마이그레이션" required>
						</div>
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label job-text"><strong>Workflow
									Name</strong></label> <input type="text" class="form-control"
								name="workflowName" placeholder="ex) DBmigration.java" required>
						</div>
						<div class="mb-3">
							<label for="formFileSm" class="form-label job-text"><strong>소스코드
									첨부</strong></label> <input class="form-control form-control-sm"
								name="workflowFile" type="file">
						</div>
						<div class="mb-3">
							<label for="exampleFormControlTextarea1"
								class="form-label job-text"><strong>Note</strong></label>
							<textarea class="form-control" name="note" rows="3"></textarea>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Add</button>
					</div>
				</form>
				<script type="text/javascript">
					// 버튼 클릭 시 모달 닫고 폼 전송 
					function addJob() {

						alert("Job 추가 완료!");
						$('#add-form').modal('hide')
						return true;
					}
				</script>
			</div>
		</div>
	</div>

	<!-- EditModal -->
	<div class="modal fade" id="editModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-bs-backdrop="static">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">Edit Job</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body edit-body">
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label"><strong>Job
								Name</strong></label> <input type="text" class="form-control" id="edit-JobName"
							value="웹 크롤링">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label"><strong>Workflow
								Name</strong></label> <input type="text" class="form-control"
							id="edit-WorkflowName" value="Web.py">
					</div>
					<div class="mb-3">
						<label for="formFileSm" class="form-label"><strong>소스코드
								첨부</strong></label> <input class="form-control form-control-sm" id="edit-file"
							type="file">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label"><strong>Note</strong></label>
						<textarea class="form-control" id="edit-Note" rows="3"></textarea>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- ScheduleModal -->
	<div class="modal fade" id="scheduleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-bs-backdrop="static">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">Schedule Add</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-4 row">
						<div class="col-sm-2">
							<label for="staticEmail" class="col-sm-2 col-form-label"><strong>JobName</strong></label>
						</div>
						<div class="col-sm-4">
							<input type="text" readonly class="form-control" id="staticEmail"
								value="기획부 DB 마이그레이션 ">
						</div>
						<div class="col-sm-2">
							<label for="staticEmail" class="col-sm-2 col-form-label"><strong>JobId</strong></label>
						</div>
						<div class="col-sm-4">
							<input type="text" readonly class="form-control" id="staticEmail"
								value="12414215256">
						</div>
					</div>

					<div class="row mb-3">
						<label for="inputEmail3" class="col-sm-2 col-form-label"><strong>Schedule
								Name</strong></label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="inputEmail3"
								placeholder="ex) 2022/12/25 ~ 2023/12/25 매주 수요일 정기일정">
						</div>
					</div>
					<div class="row mb-3">
						<!--  크론식이 들어갈 자리 -->
						<label for="inputEmail3" class="col-form-label"><strong>Cron
								Expression</strong></label>
						<div class="col-sm-1" style="text-align: center">
							<label for="inputEmail3" class="col-form-label">secs</label> <input
								type="text" class="form-control" id="cron-secs" value="*">
						</div>
						<div class="col-sm-1" style="text-align: center">
							<label for="inputEmail3" class="col-form-label">mins</label> <input
								type="text" class="form-control" id="cron-mins" value="*">
						</div>
						<div class="col-sm-1" style="text-align: center">
							<label for="inputEmail3" class="col-form-label">hrs</label> <input
								type="text" class="form-control" id="cron-hrs" value="*">
						</div>
						<div class="col-sm-1" style="text-align: center">
							<label for="inputEmail3" class="col-form-label">DOM</label> <input
								type="text" class="form-control" id="cron-dom" value="*">
						</div>
						<div class="col-sm-1" style="text-align: center">
							<label for="inputEmail3" class="col-form-label">month</label> <input
								type="text" class="form-control" id="cron-month" value="*">
						</div>
						<div class="col-sm-1" style="text-align: center">
							<label for="inputEmail3" class="col-form-label">DOW</label> <input
								type="text" class="form-control" id="cron-dow" value="*">
						</div>

						<div class="col-sm-6">
							<a class="btn btn-info" data-bs-toggle="collapse"
								href="#collapseExample" role="button" aria-expanded="false"
								aria-controls="collapseExample"> Cron Manual </a>
							<div class="collapse" id="collapseExample">
								<div class="card card-body" style="font-size:14px; background: var(--color-white)">
								
								<table style="border: 1px solid var(--color-dark-variant)">
									<thead style="border: 1px solid var(--color-dark-variant)">
										<tr>
											<td>필드명</td>
											<td>값의 허용 범위</td>
											<td>허용된 특수문자</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>초 (Seconds)</td>
											<td>0 ~ 59</td>
											<td>,  -  *  /</td>
										</tr>
										<tr>
											<td>분 (Minutes)</td>
											<td>0 ~ 59</td>
											<td>,  -  *  /</td>
										</tr>
										<tr>
											<td>시 (Hours)</td>
											<td>0 ~ 23</td>
											<td>,  -  *  /</td>
										</tr>
										<tr>
											<td>일 (Day of Month)</td>
											<td>1 ~ 31</td>
											<td>,  -  *  /  ?  L  W</td>
										</tr>
										<tr>
											<td>월 (Month)</td>
											<td>1 ~ 12 or JAN ~ DEC</td>
											<td>,  -  *  /</td>
										</tr>
										<tr>
											<td>요일 (Day Of Week)</td>
											<td>0 ~ 6 or SUN ~ SAT</td>
											<td>,  -  *  /  ?  L  W</td>
										</tr>
									</tbody>
								</table>
								● * : 모든 값을 뜻합니다. <br>
								● ? : 특정한 값이 없음을 뜻합니다. <br>
								● - : 범위를 뜻합니다. (예) 월요일에서 수요일까지는 MON-WED로 표현 <br>
								● , : 특별한 값일 때만 동작 (예) 월,수,금 MON,WED,FRI <br>
								● / : 시작시간 / 단위 (예) 0분부터 매 5분 0/5 <br>
								● L : 일에서 사용하면 마지막 일, 요일에서는 마지막 요일(토요일) <br>
								● W : 가장 가까운 평일 (예) 15W는 15일에서 가장 가까운 평일(월~금)을 찾음 <br>
								● # : 몇째주의 무슨 요일을 표현 (예) 3#2 : 2번째주 수요일 <br>
									</div>
							</div>
						</div>


					</div>
					<fieldset class="row mb-3">
						<legend class="col-form-label col-sm-2 pt-0">
							<strong>Schedule Type</strong>
						</legend>
						<div class="col-sm-10">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gridRadios"
									id="gridRadios1" value="option1" checked> <label
									class="form-check-label" for="gridRadios1"> Loop </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gridRadios"
									id="gridRadios2" value="option2"> <label
									class="form-check-label" for="gridRadios2"> One time</label>
							</div>
						</div>
					</fieldset>

					<fieldset class="row mb-3">
						<div class="col-md-3">
							<div class="form-group">
								<label for="startdate" class="control-label small font-italic"><strong>StartDT</strong>
								</label> <input name="startdate" type="datetime-local"
									class="form-control" @bind="@from"
									@bind:format="yyyy-MM-ddTHH:mm:ss" />
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="enddate" class="control-label small font-italic"><strong>EndDT</strong>
								</label> <input name="enddate" type="datetime-local"
									class="form-control" @bind="@to"
									@bind:format="yyyy-MM-ddTHH:mm" />
							</div>
						</div>
					</fieldset>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Add</button>
				</div>
			</div>
		</div>
	</div>

	<!-- RunsModal -->
	<div class="modal fade" id="runsModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-bs-backdrop="static">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Runs Status</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row read"
							style="width: 100%; height: 300px; overflow: auto">
							<div class="col-sm-12">
								<table>
									<thead>
										<tr>
											<td>ScheduleId</td>
											<td>ScheduleName</td>
											<td>InUse</td>
											<td>ScheduleType</td>
											<td>ScheduleStartDT</td>
											<td>ScheduleEndDT</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>2022/12/25 ~ 2023/12/25 매주 수요일 정기일정</td>
											<td>On</td>
											<td>Loop</td>
											<td>2022/12/25</td>
											<td>2023/12/25</td>
										</tr>

										<tr>
											<td>2</td>
											<td>매주 일요일 db 백업</td>
											<td>Off</td>
											<td>Loop</td>
											<td>2023/01/01</td>
											<td>2030/01/01</td>
										</tr>
										<tr>
											<td>3</td>
											<td>매일 웹크롤링</td>
											<td>Off</td>
											<td>Loop</td>
											<td>2023/01/10</td>
											<td>2023/12/30</td>
										</tr>
										<tr>
											<td>4</td>
											<td>콘서트 티켓 예매</td>
											<td>Off</td>
											<td>One Time</td>
											<td>2023/03/03</td>
											<td>x</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<canvas id="modalchart" width="400" height="200"></canvas>
								<script>
									let runchart = document.getElementById(
											'modalchart').getContext('2d');

									let chart = new Chart(
											runchart,
											{
												type : 'line', //pie, line, doughnut, polarArea
												data : {
													labels : [ 'AM 06:00',
															'AM 08:00',
															'AM 10:00',
															'PM 12:00',
															'PM 14:00',
															'PM 16:00',
															'PM 18:00',
															'PM 20:00',
															'PM 22:00' ],
													datasets : [ {
														label : 'Run Duration',
														data : [ 100, 500, 250,
																350, 700, 200,
																450, 600, 150 ],
														borderColor : '#39d353',
														fill : true,
														backgroundColor : 'rgba(57,	211, 83, 0.1)'
													} ]
												},
												options : {
													responsive : false,
													legend : {
														labels : {
															fontColor : "rgba(128, 128, 128, 1)",
															fontSize : 14
														}
													},
													scales : {
														yAxes : [ {
															ticks : {
																min : 0,
																beginAtZero : true,
																stepSize : 100,
																fontColor : "rgba(128, 128, 128, 1)",
																fontSize : 14,
															},
															gridLines : {
																color : "rgba(128, 128, 128, 1)",
																lineWidth : 0.5
															}
														} ],
														xAxes : [ {
															ticks : {
																fontColor : "rgba(128, 128, 128, 1)",
																fontSize : 14
															},
															gridLines : {
																color : "rgba(128, 128, 128, 1)",
																lineWidth : 0.5
															}
														} ]
													}
												}
											});
								</script>
							</div>
						</div>
					</div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>