<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
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

	<div id="viewport">

		<!-- Content -->
		<div id="content">
			<nav class="navbar navbar-expand-lg">
				<div class="container-fluid">
				<ul class="navbar-nav hambuger">
				<li class="ham-btn">
                    <a class="menu-trigger" href="#">
                        <span></span>
                        <span></span>
                        <span></span>
                    </a>
                </li>
                </ul>
					<a href="#" class="d-flex moonwork">MoonWork</a>

					<div
						class="collapse navbar-collapse text-decoration-none user-info"
						id="navbarNavDarkDropdown" style="padding-left: 30px"></div>
					<input type="checkbox" id="dn"> <label for="dn"
						class="toggle2"> <span class="material-icons toggle__handler">light_mode</span>
					</label>
					<div class="dropdown" style="padding-right: 30px">
						<a href="#"
							class="align-items-center text-decoration-none dropdown-toggle"
							id="dropdownUser1" data-bs-toggle="dropdown"
							aria-expanded="false"> <i
							class="fa-solid fa-circle-user fa-lg"></i> <span
							class="d-none d-sm-inline mx-1">Han</span>
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
				<li class="menu-hamburger" style="border-bottom:1px solid var(--color-shadow)"><a href="#"
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
				<li class="menu-hover" style="background-color: rgba(75, 137, 220, 0.3)"><a href="${pageContext.request.contextPath}/users.do"
					class="nav-link px-0 align-middle "> <i class="fa-regular fa-user"></i>
				</a></li>
			</ul>
		</div>


			<div class="container-fluid read">
				<div class="row">
				
					<div class="col-sm-12"
						style="display: flex; justify-content: space-between;">
						<div class="btnwrap">
						<button type="button" class="btn refreshbtn">Refresh
							</button>
						<button type="button" class="btn addbtn"
							data-bs-toggle="modal" data-bs-target="#addModal">Create
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
							style="width: 100%; height: 700px; overflow: auto; border: 1px solid var(--color-shadow); border-radius:10px">
							<table id="job-table">
								<thead>
									<tr>
										<td>No</td>
										<td>Name</td>
										<td>Id</td>
										<td>Password</td>
										<td>IsUse</td>
										<td>Last Login</td>
										<td>Action</td>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${users}">
										<tr>
											<!-- 유저번호 -->
											<td></td>
											<!-- 유저이름 -->
											<td><a 
												id="${row.jobId}">${row.jobName}</a></td>
											<!-- 유저아이디 -->
											<td></td>
											<!-- 유저패스워드 -->
											<td></td>

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
											<td class="actions">
												<button type="button" class="btn editbtn"
													data-bs-toggle="modal" data-bs-target="#editModal"
													data-id="${row.jobId}">Edit</button>
												<button class="btn delebtn"
													value="${row.jobId}" id="delbtn"
													onclick="javascript:delbtn(this)">Delete</button>
											</td>
										</tr>

									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>


			</div>



	<script src="<%=request.getContextPath()%>/resources/js/dashboard.js"></script>
	<script src='<%=request.getContextPath()%>/resources/js/jobhistory.js'></script>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>