<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoonWork_Job Schedule</title>
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
				<li class="ham-btn">
                    <a class="menu-trigger" href="#">
                        <span></span>
                        <span></span>
                        <span></span>
                    </a>
                </li>
                </ul>
<!--                 <script>

             // 햄버거 버튼 클릭 이벤트 
             var burger = $('.menu-trigger');

             burger.each(function(index) {
             	var $this = $(this);

             	$this.on('click', function(e) {
             		e.preventDefault();
             		$(this).toggleClass('active-' + (index + 1));
             	})
             });

             var h = 0;

             $(burger).on("click", function() {
             	if (h == 0) {
             		$('#sidebar').animate({
             			left: '0',
             			opacity: 1
             		}, 500);
             		$(this).addClass('active-1');
             		h++;
             	} else if (h == 1) {
             		$('#sidebar').animate({
             			left: '-20%',
             			opacity: 0
             		}, 500);
             		$(this).removeClass('active-1');
             		h--;
             	}
             	$(window).scroll(function() {
             		sct = $(window).scrollTop();
             		if (sct > 30) {
             			$('#sidebar').css({
             				opacity: 0,
             				left: '-20%'
             			}, 500);
             			$(burger).removeClass('active-1');
             			h = 0;
             		}
             	});
             })
                </script>
                 -->
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

			<div class="row">
				<div class="col-sm-1">
					<a href="#" class="d-flex menu-area">Run&nbspHistory</a>
				</div>
			</div>

			<div class="container-fluid history">
				<div class="row mb-3">
					<div class="col-md-3">
						<div class="form-group">
							<label for="startdate" class="control-label small font-italic"><strong>From:</strong>
							</label> <input name="startdate" type="datetime-local"
								class="form-control border-dark" @bind="@from"
								@bind:format="yyyy-MM-ddTHH:mm:ss" />
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="enddate" class="control-label small font-italic"><strong>To:</strong>
							</label> <input name="enddate" type="datetime-local"
								class="form-control border-dark" @bind="@to"
								@bind:format="yyyy-MM-ddTHH:mm" />
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label for="Search" class="control-label small font-italic">&nbsp;</label>
							<input type="button" value="Search" @onclick="DateTimeChanged"
								class="btn btn-primary w-100" />
						</div>
					</div>

				</div>

				<div id='myChart'></div>

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