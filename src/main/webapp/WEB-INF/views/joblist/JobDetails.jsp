<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoonWork_JobDetails</title>

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
	href="../../resources/css/jobdetails.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<style>

</style>
<body>

	<div class="container-fluid detail-form">
		<form class="row g-3">
			<div class="col-md-4">
				<label for="inputEmail4" class="form-label"><strong>JobId</strong></label>
				<input readonly type="text" class="form-control" id="JobId" value="1234526733">
			</div>
			<div class="col-md-4">
				<label for="inputPassword4" class="form-label"><strong>JobName</strong></label>
				<input readonly type="text" class="form-control" id="JobName" value="DB 마이그레이션">
			</div>
			<div class="col-md-4">
				<label for="inputAddress" class="form-label"><strong>WorkflowName</strong></label>
				<input readonly type="text" class="form-control" id="WorkflowName" value="DBMigration.java">
			</div>
			<div class="col-md-4">
				<label for="inputAddress" class="form-label"><strong>HostName</strong></label>
				<input readonly type="text" class="form-control" id="HostName" value="Worker-2">
			</div>
			<div class="col-md-4">
				<label for="inputAddress" class="form-label"><strong>HostIp</strong></label>
				<input readonly type="text" class="form-control" id="HostName" value="192.168.0.0"> 
			</div>
			<div class="col-md-4">
				<label for="inputAddress" class="form-label"><strong>InUse</strong></label>
				<input readonly type="text" class="form-control" id="InUse" value="Off">
			</div>
			<div class="col-md-4">
				<label for="inputAddress" class="form-label"><strong>CreateUser</strong></label>
				<input readonly type="text" class="form-control" id="CreateUser" value="Han">
			</div>
			<div class="col-md-4">
				<label for="inputAddress" class="form-label"><strong>SaveDate</strong></label>
				<input readonly type="text" class="form-control" id="SaveDate" value="2022-12-30">
			</div>
			<div class="col-md-4">
				<label for="inputAddress" class="form-label"><strong>Note</strong></label>
				<textarea readonly class="form-control" id="Note" value="ddddddddd"
					style="height: 80px;"></textarea>
			</div>
			<div class="col-md-12">
				<label for="inputAddress" class="form-label"><strong>Registered
						Schedule</strong></label>
				<div id="schedule-jsGrid"></div>
			</div>
		</form>
	</div>






	<script src="../resources/js/jsgrid.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>