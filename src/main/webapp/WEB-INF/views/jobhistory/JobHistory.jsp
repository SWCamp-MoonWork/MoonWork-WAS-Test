<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="<%=request.getContextPath()%>/resources/img/moonwork_favicon.ico">
<meta charset="UTF-8">
<title>MoonWork_Job Schedule</title>
		<script src="https://cdn.zingchart.com/zingchart.min.js"></script>
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
<style>
#myChart {
	height: 100%;
	width: 100%;
	min-height: 150px;
}
</style>
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
				<li class="menu-hamburger" ><a href="#"
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
					class="nav-link px-0 align-middle " style="color: var(--color-primary)"> <i
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


			<div class="container-fluid history" >
				<div class="row mb-3" style="background-color:var(--color-white); padding: 20px; border-radius: 10px">
					<div class="col-md-1">
						<div class="form-group">
							<label for="Search" class="control-label small font-italic">&nbsp;</label>
							<input type="button" value="Search" onclick="getChartInDate();"
								class="btn w-100"/>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="startdate" class="control-label small font-italic"><strong>From:</strong>
							</label> <input name="startdate" type="datetime-local" id="startDate"
								class="form-control border-dark" @bind="@from"
								@bind:format="yyyy-MM-ddTHH:mm:ss" />
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="enddate" class="control-label small font-italic"><strong>To:</strong>
							</label> <input name="enddate" type="datetime-local" id="endDate"
								class="form-control border-dark" @bind="@to"
								@bind:format="yyyy-MM-ddTHH:mm" />
						</div>
					</div>
					
					<div class="col-md-1">
						<div class="form-group">
							<label for="Search" class="control-label small font-italic">&nbsp;</label>
							<input type="button" value="최근 10분" id="last10" onclick="getChartOption(this.id);"
								class="btn w-100 searchOption"/>
						</div>
					</div>
					
					<div class="col-md-1">
						<div class="form-group">
							<label for="Search" class="control-label small font-italic">&nbsp;</label>
							<input type="button" value="최근 30분" id="last30" onclick="getChartOption(this.id);"
								class="btn w-100 searchOption"/>
						</div>
					</div>
					
					<div class="col-md-1">
						<div class="form-group">
							<label for="Search" class="control-label small font-italic">&nbsp;</label>
							<input type="button" value="최근 1시간" id="last60" onclick="getChartOption(this.id);"
								class="btn w-100 searchOption"/>
						</div>
					</div>
					<div class="col-md-1">
						<div class="form-group">
							<label for="Search" class="control-label small font-italic">&nbsp;</label>
							<input type="button" value="최근 2시간" id="last120" onclick="getChartOption(this.id);"
								class="btn w-100 searchOption"/>
						</div>
					</div>
					<div class="col-md-1">
						<div class="form-group">
							<label for="Search" class="control-label small font-italic">&nbsp;</label>
							<input type="button" value="최근 12시간" id="last720" onclick="getChartOption(this.id);"
								class="btn w-100 searchOption"/>
						</div>
					</div>
				</div>
				<div class="row mb-3 RunHistoryChart" style="background-color:var(--color-white); padding: 20px; border-radius: 10px">
					<div id='RunHistoryChart'></div>
				</div>
	<script
			src="<%=request.getContextPath()%>/resources/js/dashboard.js"></script>
				<script
					src='<%=request.getContextPath()%>/resources/js/jobhistory.js'></script>

			</div>

		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>