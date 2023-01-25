var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
})



$(document).ready(function() {


	$(".jobdetail").click(function() {
		var id = $(this).attr('id');

		$.ajax({
			url: "/jobdetails.do",
			type: "GET",
			data: {
				"jobId": id
			},
			contentType: "application/json; charset=UTF-8",
			success: function(result) {

				//$(".detail").val("");   
				$('input[id=detail-JobId]').attr('value', result.jobId);
				$('input[id=detail-JobName]').attr('value', result.jobName);
				$('input[id=detail-WorkflowName]').attr('value', result.workflowName);
				$('input[id=detail-HostName]').attr('value', result.hostName); // HostName으로 변경해야함
				$('input[id=detail-HostIp]').attr('value', result.hostIp);
				$('input[id=detail-IsUse]').attr('value', result.jobIsUse);
				$('input[id=detail-CreateUser]').attr('value', result.userName);
				$('input[id=detail-SaveDate]').attr('value', result.jobSaveDate);
				$('input[id=detail-Note]').attr('value', result.jobNote);

			},
			error: function(request, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});
	});


	$(document).on("click", ".editbtn", function() {
		var selectId = $(this).data('id');

		$.ajax({
			url: "/jobdetails.do",
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

		$.ajax({
			url: "/jobdetails.do",
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
		$.ajax({
			url: "/deletejob.do",
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

