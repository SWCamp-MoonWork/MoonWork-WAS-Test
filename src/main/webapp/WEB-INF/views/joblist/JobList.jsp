<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoonWork_Job List</title>
<script src="https://kit.fontawesome.com/fe820bbe93.js"
	crossorigin="anonymous"></script>
<link type="text/css" rel="stylesheet"
	href="../../resources/css/dashboard.css" />
<link type="text/css" rel="stylesheet"
	href="../../resources/css/joblist.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
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
						<strong>Job List</strong>
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

			<div class="container-fluid read">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#editModal">Add
							Job</button>
						<div style="width: 100%; height: 350px; overflow: auto">
							<table>
								<thead>
									<tr>
										<td>No</td>
										<td>Action</td>
										<td>Name</td>
										<td>IsUse</td>
										<td>WorkflowName</td>
										<td>SaveDate</td>
										<td>User</td>
										<td>Delete</td>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${items}">
										<tr>
											<td>42122220009311</td>
											<td class="actions">
												<button class="btn btn-info" onClick="location.href='#'"
													target="frame">Edit</button>
												<button type="button" class="btn btn-warning"
													data-bs-toggle="modal" data-bs-target="#scheduleModal">Schedule</button>
												<button type="button" class="btn btn-success"
													data-bs-toggle="modal" data-bs-target="#runsModal">Runs</button>
											</td>
											<td>${row.name}</td>
											<td>no</td>
											<td>HelloWorld.java</td>
											<td>${row.birth}</td>
											<td>Han</td>
											<td class="actions"><button class="btn btn-danger">Delete</button></td>
										</tr>

									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>



				<div class="row" style="padding-top: 40px">
					<div class="col-sm-12">
						<iframe src="home.do" title="test" name="frame" width="100%"
							height="450" style="border: none"></iframe>
					</div>
				</div>
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
					<h3 class="modal-title" id="exampleModalLabel">Add Job</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label"><strong>Job
								Name</strong></label> <input type="text" class="form-control"
							id="exampleFormControlInput1" placeholder="ex) 영업부 DB 마이그레이션">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label"><strong>Workflow
								Name</strong></label> <input type="text" class="form-control"
							id="exampleFormControlInput1" placeholder="ex) DBmigration.java">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label"><strong>Source
								Code</strong></label>
						<textarea class="form-control" id="exampleFormControlTextarea1"
							rows="10"></textarea>
					</div>
					<div class="mb-3">
						<label for="formFileSm" class="form-label"><strong>소스코드
								첨부</strong></label> <input class="form-control form-control-sm" id="formFileSm"
							type="file">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label"><strong>Note</strong></label>
						<textarea class="form-control" id="exampleFormControlTextarea1"
							rows="3"></textarea>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Add</button>
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
					<h5 class="modal-title" id="exampleModalLabel">Schedule Status</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3 row">
						<div class="col-sm-2">
							<label for="staticEmail" class="col-sm-2 col-form-label"><strong>JobName</strong></label>
						</div>
						<div class="col-sm-4">
							<input type="text" readonly class="form-control-plaintext"
								id="staticEmail" value="기획부 DB 마이그레이션 ">
						</div>
						<div class="col-sm-2">
							<label for="staticEmail" class="col-sm-2 col-form-label"><strong>JobId</strong></label>
						</div>
						<div class="col-sm-4">
							<input type="text" readonly class="form-control-plaintext"
								id="staticEmail" value="12414215256">
						</div>
					</div>
					<div class="mb-3 row">
						<label for="exampleFormControlInput1" class="form-label"><strong>Schedule
								Name</strong> </label> <input type="text" class="form-control"
							id="exampleFormControlInput1"
							placeholder="ex) 2022/12/25 ~ 2023/12/25 매주 수요일 정기일정">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label" style="padding-right: 20px"><strong>Schedule Type</strong> </label> 
							<input class="form-check-input" type="radio"
							name="flexRadioDefault" id="flexRadioDefault1"> <label
							class="form-check-label" for="flexRadioDefault1"> Loop </label> 
							<input
							class="form-check-input" type="radio" name="flexRadioDefault"
							id="flexRadioDefault1"> <label class="form-check-label"
							for="flexRadioDefault1"> One Time </label>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
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
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<!-- jsGrid -->
	<script src="../resources/js/jsgrid.js"></script>
	<script src="../resources/js/joblist.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

</body>
</html>