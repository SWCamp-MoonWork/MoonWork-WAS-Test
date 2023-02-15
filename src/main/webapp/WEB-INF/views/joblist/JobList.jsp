<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="<%=request.getContextPath()%>/resources/img/moonwork_favicon.ico">
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
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
	<script>
		$(document)
				.ready(
						function() {
							sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
							


							$("#search-Keyword")
									.keyup(
											function() {
												var key = $(this).val();
												$("#job-table > tbody > tr")
														.hide();
												var temp = $("#job-table > tbody > tr > td:nth-child(-n+7):contains('"
														+ key + "')");
												$(temp).parent().show();
											});

						});
	</script>
	<script>
		$(document)
				.ready(
						function() {
							

							
							

							$('#onetime').change(
									function() {
										if ($(this).is(':checked')) {
											$(".enddate").hide();
											$("#schedule-addbtn").removeAttr(
													"disabled");
											$(".cron-div").hide();
										}

									});

							$('#loop').change(
									function() {
										if ($(this).is(':checked')) {
											$(".enddate").show();
											$(".cron-div").show();
											$("#enddate")
													.removeAttr("disabled");
											$("#Cron-expression").removeAttr(
													"disabled");
										}
									});


						});
	</script>
	<div id="viewport">

		<!-- Content -->
		<div id="content">
			<nav class="navbar navbar-expand-lg">
				<div class="container-fluid">
					<a class="moonwork-img"><img src="<%=request.getContextPath()%>/resources/img/moonwork_logo.png"
											width="23px" height="23px"></a>
					<a href="#" class="d-flex moonwork">MoonWork</a>
					
					<div
						class="collapse navbar-collapse text-decoration-none user-info"
						id="navbarNavDarkDropdown" style="padding-left: 30px"></div>
					<input type="checkbox" id="dn"> <label for="dn" style="background-color:var(--color-light); border-radius:10px;"
						class="toggle2"> <span
						class="material-icons toggle__handler">light_mode</span>
					</label>
					<div class="dropdown" style="padding-right: 30px">
						<a href="#"
							class="align-items-center text-decoration-none dropdown-toggle"
							id="dropdownUser1" data-bs-toggle="dropdown"
							aria-expanded="false"> <i
							class="fa-solid fa-circle-user fa-lg" style="color:rgba(0, 123, 255, 0.5)"></i> <span
							class="d-none d-md-inline mx-1"><%=userName %></span>
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
				<li class="menu-hamburger"><a href="#"
					class="nav-link px-0 align-middle menu-trigger "> <i class="fa-solid fa-bars fa-lg hamburger"></i>
				</a></li>
				<li class="menu-hover" ><a href="${pageContext.request.contextPath}/dashboard.do"
					class="nav-link px-0 align-middle "> <i
						class="fa-solid fa-chart-line"></i>
				</a></li>
				<li class="menu-hover" ><a href="${pageContext.request.contextPath}/joblist.do"
					class="nav-link px-0 align-middle"  style="color: var(--color-primary)"> <i class="fa-regular fa-rectangle-list"></i>
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

			<div class="container-fluid read">
				<div class="row">
				
					<div class="col-sm-12"
						style="display: flex; justify-content: space-between;">
						<div class="btnwrap">
						<button type="button" class="btn refreshbtn" style="background-color: var(--color-white)">Refresh
							</button>
						<button type="button" class="btn addbtn"
							data-bs-toggle="modal" data-bs-target="#addModal" style="background-color: var(--color-white)">Add
							Job</button>
						</div>
						<div class="wrap"
							style="margin-top: auto; margin-bottom: auto; width: 30rem;">
							<div class="search">
								<input type="text" class="searchTerm" id="search-Keyword"
									placeholder="검색어를 입력해주세요 (Any Column)">
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
							style="width: 100%; height: 700px; overflow: auto; border: 1px solid var(--color-shadow); border-radius:10px">
							<table id="job-table">
								<thead>
									<tr>
										<td>No</td>
										<td>State</td>
										<td>Execution</td>
										<td>Name</td>
										<td>Last 5 Jobs State</td>
										<td>Action</td>
										<td>Activate</td>
										<td>SaveDate</td>
										<td>Saver</td>
										<td>Delete</td>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${jobs}">
										<tr>
											<td>${row.jobId}</td>
											<td><i class="fa-solid fa-sync" id="loading${row.jobId}"></i></td>
											<td><a href="javascript:void(0)" class="execution" id="${row.jobId}"><i class="fa-solid fa-play"></i></a></td>
											<td><a href="#detailModal" class="jobdetail" data-bs-toggle="modal"
												id="${row.jobId}">${row.jobName}</a></td>
											<td id="state${row.jobId}"></td>

											<td class="actions">
												<button type="button" class="btn editbtn"
													data-bs-toggle="modal" data-bs-target="#editModal"
													data-id="${row.jobId}">Edit</button>

												<button type="button" class="btn schedulebtn"
													data-bs-toggle="modal" data-bs-target="#scheduleModal"
													data-id="${row.jobId}">Schedule</button>
												<button type="button" class="btn runsbtn"
													data-bs-toggle="modal" data-bs-target="#runsModal"
													data-id="${row.jobId}">Runs</button>
											</td>
											<c:if test="${row.isUse eq true}">
												<td>
												<input type="checkbox" name="isUsecheck" value="${row.isUse}" checked onClick="return false;">
												</td>
											</c:if>
											<c:if test="${row.isUse eq false}">
												<td>
												<input type="checkbox" name="isUsecheck" value="${row.isUse}" onClick="return false;">
												</td>
											</c:if>
											 <td><fmt:formatDate value="${row.saveDate}"
													pattern="yyyy-MM-dd HH:mm" /></td>


											<td>${row.name}</td>
											<td class="actions"><button class="btn delebtn"
													value="${row.jobId}" id="delbtn"
													onclick="javascript:delbtn(this)">Delete</button></td>
										</tr>

									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<div class="row" style="padding: 10px 10px 0px;">
					<div class="col-md-12 job-count-detail" style=" background-color: var(--color-white)">
						<div class="count-div total-jobs">
						<h5>Total Job Count</h5><span>${TotalJobsCount}</span>
						</div>
						<div class="count-div now-run">
						<h5>Running Count</h5><span>${RunningCount}</span>
						</div>
						<div class="count-div isuse-count">
						<h5>Activate Count</h5><span>${ActivateCount}</span>
						</div>
					</div>
					
				</div>
			

			</div>
		</div>
	</div>
	
	<!-- JobDetailModal -->
	<div class="modal fade" id="detailModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-bs-backdrop="static">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">Job Detail</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" style="padding:auto">
				<div class="row">
					<div class="col-sm-12" >

						<div class="container-fluid detail-form">
						<div class="row mb-3">
							<div class="col-md-4">
								<label for="detail-label-head" class="form-label"><i class="fa-solid fa-briefcase" style="color:var(--color-primary)"></i>&nbsp;&nbsp;&nbsp;<strong>Job</strong></label><br>
							</div>
							<div class="col-md-4">
								<label for="detail-label-head" class="form-label"><i class="fa-regular fa-id-card" style="color:var(--color-warning)"></i>&nbsp;&nbsp;&nbsp;<strong>User</strong></label><br>
							</div>
							<div class="col-md-4">
								<label for="detail-label-head" class="form-label"><i class="fa-regular fa-clipboard" style="color:var(--color-info)"></i>&nbsp;&nbsp;&nbsp;<strong>Note</strong></label><br>
							</div>
						</div>
							<div class="row">
								<div class="col-md-2">
									<label for="detail-label" class="form-label detail-label">JobId</label><br>
									<label for="detail-label" class="form-label detail-label">JobName</label><br>
									<label for="detail-label" class="form-label detail-label">WorkflowName</label><br>
									<label for="detail-label" class="form-label detail-label">IsUse</label><br>
									</div>
								<div class="col-md-2">
									<label for="detail-JobId" class="form-label jobdetail-text"></label><br>
									<label for="detail-JobName" class="form-label jobdetail-text"></label><br>
									<label for="detail-WorkflowName" class="form-label jobdetail-text"></label><br>
									<label for="detail-IsUse" class="form-label jobdetail-text"></label><br>
								</div>
								<div class="col-md-2">
									<label for="detail-label" class="form-label detail-label">CreateUser</label><br>
									<label for="detail-label" class="form-label detail-label">SaveDate</label><br>
								</div>
										
								<div class="col-md-2">
									<label for="detail-CreateUser" class="form-label jobdetail-text"></label><br>
									<label for="detail-SaveDate" class="form-label jobdetail-text"></label><br>

								</div>
								
								<div class="col-md-3">
										<textarea readonly class="form-control jobdetail-text" id="detail-Note" name="txtarea-note"
												style="height: 70px;"></textarea>
								</div>

								<div class="col-md-12"  style="padding-top: 30px;">
									<label for="inputAddress" class="form-label detail"><i class="fa-regular fa-calendar-check" style="color: var(--color-green)"></i>&nbsp;&nbsp;&nbsp;<strong>Registered
											Schedule&nbsp;&nbsp;</strong></label>
								<label for="inputAddress" class="form-label" style="float: right;">
											<i class="fa-regular fa-pen-to-square" style="color: var(--color-dark-variant)"></i>
											&nbsp;<i class="fa-regular fa-trash-can" style="color: var(--color-danger)"></i>
								</label>

								</div>
							<div class="col-md-12 read" style="border: 1px solid var(--color-shadow);  border-radius:10px">
								 <table>
									<thead>
										<tr>
											<td>ScheduleId</td>
											<td>ScheduleName</td>
											<td>IsUse</td>
											<td>ScheduleType</td>
											<td>CronExpression</td>

										</tr>
									</thead>
									<tbody>
										<tr>
											<td id="scheduleID"></td>
											<td id="scheduleName"></td>
											<td id="scheduleIsUse"></td>
											<td id="scheduleType"></td>
											<td id="cronExpression"></td>

										</tr>
									</tbody>
								</table>
								
								<div class="col-md-12 read">
									<table>
									<thead>
									<tr>
											<td>OneTimeOccurDT</td>
											<td>ScheduleStartDT</td>
											<td>ScheduleEndDT</td>
											<td>ScheduleSaveDate</td>
									</tr>
									</thead>
									<tbody>
									<tr>
									
											<td id="oneTimeOccurDT"></td>
											<td id="scheduleStartDT"></td>
											<td id="scheduleEndDT"></td>
											<td id="scheduleSaveDate"></td>
									
									</tr>
									
									</tbody>
									
									</table>
								
								</div>
							
							</div>
							</div>
						</div>

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
					<div class="modal-body add-body">
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label job-text"><strong>Job
									Name</strong></label> <input type="text" class="form-control" name="jobName"
								placeholder="ex) 영업부 DB 마이그레이션" required>
						</div>
						<div class="mb-3">
							<label for="formFileSm" class="form-label job-text"><strong>소스코드
									첨부</strong></label> <input class="form-control form-control-sm file-add" id="workflowFile"
								name="workflowFile" type="file" accept=".py, .sh, .zip, .tar.gz, .bash, .7z" onchange="validation(this);">
						</div>
						<script>
						
						function validation(file) {
							var file_path = file.value;
							var reg = /(.*?)\.(py|sh|bash|zip|tar.gz|7z)$/;
							        // 허용되지 않은 확장자일 경우
								if (file_path != "" && (file_path.match(reg) == null || reg.test(file_path) == false)) {
									$("#workflowFile").val("");
									alert("이미지 파일만 업로드 가능합니다.");
								}
							}




						</script>
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label job-text "><strong>Workflow
									Name</strong></label> <input type="text" class="form-control"
								name="workflowName" id="workflowName-add" placeholder="ex) DBmigration.java" required>
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
				<form name="editform" id="edit-form"
					action="${pageContext.request.contextPath}/editjob.do"
					onsubmit="return editJob()" method="post"
					enctype="multipart/form-data">
				<div class="modal-body edit-body">
					<div class="mb-3">
						<input type="hidden" name="jobId" value="edit-JobId"
							id="edit-JobId"> <label for="exampleFormControlInput1"
							class="form-label"><strong>Job Name</strong></label> <input
							type="text" class="form-control" id="edit-JobName" value="" name="jobName"
							required>
					</div>
					<div class="mb-3">
						<label
							class="form-check-label" for="gridRadios1"><strong> IsUse </strong></label>
							<input class="form-check-input" type="checkbox" name="checkIsUse"
								id="edit-IsUse" value="truecheck" checked> 
					</div>
					<div class="mb-3">
						<label
							class="form-check-label" for="gridRadios1"><strong> 소스코드 재첨부 </strong></label>
							<input class="form-check-input" type="checkbox" name="re-fileUpload"
								id="re-fileUpload" value="true"> 
					</div>

					<div class="mb-3 re-fileUpload">

					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label"><strong>Workflow
								Name</strong></label> <input type="text" class="form-control" name="workflowName"
							id="edit-WorkflowName" value="" required>
					</div>
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label"><strong>Note</strong></label>
						<textarea class="form-control" id="edit-Note" rows="3" name="note"></textarea>
					</div>
					<input type="hidden" name="workflowBlob"
							id="edit-WorkflowBlob" value="">
					<input type="hidden" name="checkfile"
							id="edit-checkfile" value="">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Edit</button>
				</div>
				</form>
				<script type="text/javascript">
					// 버튼 클릭 시 모달 닫고 폼 전송 
					function editJob() {
						var fileOK = $('#edit-file').val();
						
						if($('#re-fileUpload').is(':checked')){
							if(!fileOK){
								alert("파일을 첨부해주세요.");
								return false;
							}
							else{
								alert("Job 수정 완료!");
								$('#edit-form').modal('hide');
								return true;
							}
						}
						else{
							alert("Job 수정 완료!");
							$('#edit-form').modal('hide');
							return true;
						}

						
					}
				</script>
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
				<form name="addform" id="add-form" action="${pageContext.request.contextPath}/createschedule.do"
					onsubmit="return addSchedule()" method="post">
					<div class="modal-body schedule-body">
						<div class="mb-4 row">
							<div class="col-sm-2">
								<label for="staticEmail" class="col-sm-2 col-form-label"><strong>JobName</strong></label>
							</div>
							<div class="col-sm-4">
								<input type="text" readonly class="form-control" name="jobName"
									id="schedule-JobName" value="기획부 DB 마이그레이션 " required>
							</div>
							<div class="col-sm-2">
								<label for="staticEmail" class="col-sm-2 col-form-label"><strong>JobId</strong></label>
							</div>
							<div class="col-sm-4">
								<input type="text" readonly class="form-control" name="jobId"
									id="schedule-JobId" value="12414215256" required>
							</div>
						</div>

						<div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label"><strong>Schedule
									Name</strong></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputEmail3" name="scheduleName"
									placeholder="ex) 2022/12/25 ~ 2023/12/25 매주 수요일 정기일정" required>
							</div>
						</div>
						<fieldset class="row mb-3">
							<legend class="col-form-label col-sm-2 pt-0">
								<strong>Schedule Type</strong>
							</legend>
							<div class="col-sm-10">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="scheduleType"
										id="loop" value="true" checked> <label
										class="form-check-label" for="gridRadios1"> Loop </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="scheduleType"
										id="onetime" value="false"> <label
										class="form-check-label" for="gridRadios2"> One time</label>
								</div>
							</div>
						</fieldset>


						<fieldset class="row mb-3">
							<div class="col-md-3">
								<div class="form-group">
									<label for="startdate" class="control-label small font-italic"><strong>StartDT</strong>
									</label> <input id="startdate" name="startDate" type="datetime-local"
										class="form-control" @bind="@from"
										@bind:format="yyyy-MM-ddTHH:mm:ss" required />
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group enddate">
									<label for="enddate" class="control-label small font-italic"><strong>EndDT</strong>
									</label> <input id="enddate" name="endDate" type="datetime-local"
										class="form-control" @bind="@to"
										@bind:format="yyyy-MM-ddTHH:mm" />
								</div>
							</div>
						</fieldset>
						<div class="row cron-div">
							<!--  크론식이 들어갈 자리 -->
							<label for="inputEmail3" class="col-form-label"><strong>Cron
									Expression</strong></label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="Cron-expression" name="CronExpression">
							</div>


							<div class="col-sm-6">
								<a class="btn btn-info" data-bs-toggle="collapse"
									href="#collapseExample" role="button" aria-expanded="false"
									aria-controls="collapseExample"> Cron Manual </a>
								<div class="collapse" id="collapseExample">
									<div class="card card-body"
										style="font-size: 14px; background: var(--color-white)">

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
													<td>, - * /</td>
												</tr>
												<tr>
													<td>분 (Minutes)</td>
													<td>0 ~ 59</td>
													<td>, - * /</td>
												</tr>
												<tr>
													<td>시 (Hours)</td>
													<td>0 ~ 23</td>
													<td>, - * /</td>
												</tr>
												<tr>
													<td>일 (Day of Month)</td>
													<td>1 ~ 31</td>
													<td>, - * / ? L W</td>
												</tr>
												<tr>
													<td>월 (Month)</td>
													<td>1 ~ 12 or JAN ~ DEC</td>
													<td>, - * /</td>
												</tr>
												<tr>
													<td>요일 (Day Of Week)</td>
													<td>0 ~ 6 or SUN ~ SAT</td>
													<td>, - * / ? L W</td>
												</tr>
											</tbody>
										</table>
										● * : 모든 값을 뜻합니다. <br> ● ? : 특정한 값이 없음을 뜻합니다. <br> ●
										- : 범위를 뜻합니다. (예) 월요일에서 수요일까지는 MON-WED로 표현 <br> ● , : 특별한
										값일 때만 동작 (예) 월,수,금 MON,WED,FRI <br> ● / : 시작시간 / 단위 (예)
										0분부터 매 5분 0/5 <br> ● L : 일에서 사용하면 마지막 일, 요일에서는 마지막
										요일(토요일) <br> ● W : 가장 가까운 평일 (예) 15W는 15일에서 가장 가까운
										평일(월~금)을 찾음 <br> ● # : 몇째주의 무슨 요일을 표현 (예) 3#2 : 2번째주 수요일
										<br>
									</div>
								</div>
							</div>

						</div>

						<div class="row mb-3 cron-div">
							<div class="col-sm-6" id="cron-result">
								<b style="font-size: 14px; color: orange">크론식을 입력해주세요</b>
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" id="schedule-addbtn" class="btn btn-primary">Add</button>
					</div>
				</form>
				<script type="text/javascript">
					function addSchedule() {
						var tagId = $('.CronIsVaildText').attr('id');
						if ($('#loop').is(':checked')) {
							if($('#enddate').val() ===''){
								alert("종료 날짜를 입력해주세요.")
								retrun false;
								
							} else if (tagId == "fail" || $('#Cron-expression').val() === '') {
								alert("크론식을 다시 입력해주세요.");
								return false;
							} else {
								alert("Schedule 추가 완료!");
								$('#scheduleModal').modal('hide')
								return true;
							}
						} else {
							alert("Schedule 추가 완료!");
							$('#scheduleModal').modal('hide')
							return true;
						}

					}
				</script>
			</div>
		</div>
	</div>

	<!-- RunsModal -->
	<div class="modal fade" id="runsModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-bs-backdrop="static">
		<div class="modal-dialog modal-dialog-centered modal-xl" style="width: 100%; max-width:1700px;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Last 20 Runs State</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row read"
							style="width: 100%; height: 40vh; overflow: auto">
							<div class="col-sm-12" style="width:100%; height:auto; overflow:auto;">
								<table class="runsData-table" style="height:auto">
									<thead>
										<tr>
											<th>RunId</th>
											<th>WorkflowName</th>
											<th>StartDT</th>
											<th>EndDT</th>
											<th>Duration(sec)</th>
											<th>RunState</th>
											<th>ResultData</th>
										</tr>
									</thead>
									<tbody class="runsData-tbody">

									</tbody>
								</table>
							</div>
						</div>
						<div class="row" style="width: 100%;">
							<div class="col-sm-12">
								<canvas id="modalchart" width="1600px" height="300vh"></canvas>

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
	
	
	<!-- ResultDataModal -->
	<div class="modal fade" id="resultDataModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-bs-backdrop="static">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">Result Data</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
					<div class="modal-body add-body">
						<div class="mb-3">
							<label for="exampleFormControlTextarea1" 
								class="form-label job-text"><strong>Result Data</strong></label>
							<textarea class="form-control" name="ResultDataNote" rows="20" readonly></textarea>
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
	<script src="<%=request.getContextPath()%>/resources/js/columnEvent.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>