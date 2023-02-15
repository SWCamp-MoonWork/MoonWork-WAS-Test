<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="<%=request.getContextPath()%>/resources/img/moonwork_favicon.ico">
<meta charset="UTF-8">
<title>MoonWork_Users</title>
<script nonce="undefined"
	src="https://cdn.zingchart.com/zingchart.min.js"></script>
<script src="https://kit.fontawesome.com/fe820bbe93.js"
	crossorigin="anonymous"></script>

<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/dashboard.css" />
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
					<a href="#" class="d-flex moonwork">MoonWork</a>

					<div
						class="collapse navbar-collapse text-decoration-none user-info"
						id="navbarNavDarkDropdown" style="padding-left: 30px"></div>
					<input type="checkbox" id="dn"> <label for="dn" style="background-color:var(--color-light); border-radius:10px;"
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
						<ul class="dropdown-menu shadow"
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
				<li class="menu-hover"><a href="${pageContext.request.contextPath}/users.do"
					class="nav-link px-0 align-middle "  style="color: var(--color-primary)"> <i class="fa-regular fa-user"></i>
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
						<button type="button" class="btn addbtn" style="background-color: var(--color-white)"
							data-bs-toggle="modal" data-bs-target="#createModal">Create
							User</button>
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
							style="width: 100%; height: 800px; overflow: auto; border: 1px solid var(--color-shadow); border-radius:10px">
							<table id="job-table">
								<thead>
									<tr>
										<td>UserId</td>
										<td>UserName</td>
										<td>Name</td>
										<td>Email</td>
										<td>IsActive</td>
										<td>Action</td>
										<td>Last Login</td>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${users}">
										<tr>
											<!-- 유저번호 -->
											<td>${row.userId}</td>
											<!-- 유저아이디 -->
											<td>${row.userName}</td>
											<!-- 유저이름 -->
											<td><a 
												id="${row.userId}">${row.name}</a></td>
											<td>${row.email }</td>
											<c:if test="${row.isActive eq true}">
												<td>
												<input type="checkbox" name="isUsecheck" value="${row.isActive}" checked onClick="return false;">
												</td>
											</c:if>
											<c:if test="${row.isActive eq false}">
												<td>
												<input type="checkbox" name="isUsecheck" value="${row.isActive}" onClick="return false;">
												</td>
											</c:if>
											<td class="actions">
												<button type="button" class="btn editbtn"
													data-bs-toggle="modal" data-bs-target="#editModal"
													data-id="${row.userId}">Edit</button>
												<button class="btn delebtn"
													value="${row.userId}" id="userdelbtn"
													onclick="javascript:userdelbtn(this)">Delete</button>
											</td>
										</tr>

									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>


			</div>


	<!-- AddModal -->
	<div class="modal fade" id="createModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-bs-backdrop="static">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">Create User</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form name="createform" id="create-form"
					action="${pageContext.request.contextPath}/createuser.do"
					onsubmit="return createJob()" method="post"
					enctype="multipart/form-data">
					<div class="modal-body add-body">
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label job-text"><strong>UserName
									</strong></label> <input type="text" class="form-control" id="userName-text" name="userName"
								required>
						<div class="row mb-3">
							<div class="col-sm-6" id="duplicate-Inspection">

							</div>
						</div>
						</div>
						<div class="mb-3">
							<label for="formFileSm" class="form-label job-text"><strong>Password
									</strong></label> <input class="form-control form-control-sm file-add"
								name="userPassword" type="password">
						</div>
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label job-text "><strong>Name
									</strong></label> <input type="text" class="form-control"
								name="Name" required>
						</div>
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label job-text "><strong>Email
									</strong></label> <input type="email" class="form-control"
								name="userEmail"  placeholder="example@gmail.com" required>
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
						<button type="submit" class="btn btn-primary">Create</button>
					</div>
				</form>
				<script type="text/javascript">
					function createJob() {
						var tagId = $('.usernameVaildText').attr('id');

							if (tagId == "fail") {
								alert("아이디을 다시 입력해주세요.");
								return false;
							} else {
								alert("유저 생성 완료!");
								$('#create-form').modal('hide')
								return true;
							}
					}
				</script>
			</div>
		</div>
	</div>


	<script src="<%=request.getContextPath()%>/resources/js/dashboard.js"></script>
	<script src='<%=request.getContextPath()%>/resources/js/jobhistory.js'></script>
	<script src='<%=request.getContextPath()%>/resources/js/userEvent.js'></script>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>