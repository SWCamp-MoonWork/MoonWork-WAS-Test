var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
})



$(document).ready(function() {

	function getContextPath(){
		var hostIndex = location.href.indexOf(location.host) + location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	}
	

	$(".jobdetail").click(function() {
		var id = $(this).attr('id');
		var url      = getContextPath() + "/jobdetails.do";

		$.ajax({
			url: url,
			type: "GET",
			data: {
				"jobId": id
			},
			contentType: "application/json; charset=UTF-8",
			success: function(result) {

				//$(".detail").val("");   
				//$('input[id=detail-JobId]').attr('value', result.jobId);
				$('label[for="detail-JobId"]').text(result.jobId);
				$('label[for="detail-JobName"]').text(result.jobName);
				$('label[for="detail-WorkflowName"]').text(result.workflowName);
				$('label[for="detail-HostName"]').text(result.hostName); // HostName으로 변경해야함
				$('label[for="detail-HostIp"]').text(result.hostIp);
				$('label[for="detail-IsUse"]').text(result.isUse);
				$('label[for="detail-CreateUser"]').text(result.userName);
				$('label[for="detail-SaveDate"]').text(result.jobSaveDate);
				$('textarea[id="detail-Note"]').text(result.jobNote);
				$('#scheduleID').text(result.scheduleID);
				$('#scheduleName').text(result.scheduleName);
				$('#scheduleIsUse').text(result.scheduleIsUse);
				$('#scheduleType').text(result.scheduleType);
				$('#oneTimeOccurDT').text(result.oneTimeOccurDT);
				$('#scheduleStartDT').text(result.scheduleStartDT);
				$('#scheduleEndDT').text(result.scheduleEndDT);
				$('#scheduleSaveDate').text(result.scheduleSaveDate);
				

			},
			error: function(request, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});
	});


	$(document).on("click", ".editbtn", function() {
		var selectId = $(this).data('id');
		var url      = getContextPath() + "/jobdetails.do";
		$.ajax({
			url: url,
			type: "GET",
			data: {
				"jobId": selectId
			},
			contentType: "application/json; charset=UTF-8",
			success: function(result) {
				$(".edit-body #edit-JobId").val(selectId);
				$(".edit-body #edit-JobName").val(result.jobName);
				$(".edit-body #edit-WorkflowName").val(result.workflowName);
				//$(".edit-body #edit-file").val(result.);
				$(".edit-body #edit-Note").val(result.jobNote);

			},
			error: function(request, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});
	});
	
	
	$(document).on("click", ".schedulebtn", function() {
		var selectId = $(this).data('id');
		var url      = getContextPath() + "/deletejob.do";
		$.ajax({
			url: url,
			type: "GET",
			data: {
				"jobId": selectId
			},
			contentType: "application/json; charset=UTF-8",
			success: function(result) {
				$(".schedule-body #schedule-JobId").val(selectId);
				$(".schedule-body #schedule-JobName").val(result.jobName);
				$(".schedule-body #schedule-WorkflowName").val(result.workflowName);


			},
			error: function(request, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});
	});

});


var myModal = document.getElementById('myModal')
var myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', function() {
	myInput.focus()
})





// 작업 삭제버튼
function delbtn(arg0) {
	if (window.confirm('정말 삭제하시겠습니까?')) {
		// They clicked Yes
		var id = $(arg0).val();
		var url      = getContextPath() + "/jobdetails.do";
		$.ajax({
			url: url,
			type: "POST",
			data: JSON.stringify({
				"jobId": id
			}),
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				alert("작업이 삭제되었습니다.");
				location.reload();
			},
			error: function(error) {
				alert("에러....." + error);
			}
		});

	}
	else {
		// They clicked no
	}
}


//JobName 클릭 시 Ajax 사용해서 하단에 데이터 뿌려주기

