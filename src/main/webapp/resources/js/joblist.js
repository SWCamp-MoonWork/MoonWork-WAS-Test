var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
})


	function getContextPath(){
		var hostIndex = location.href.indexOf(location.host) + location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	}
	
	
	function fileUpload(){
		var fileInput = document.getElementsByClassName("fileadd");
		var resultFileName ="";
		for( var i=0; i<fileInput.length; i++ ){
			if( fileInput[i].files.length > 0 ){
				for( var j = 0; j < fileInput[i].files.length; j++ ){
					resultFileName += fileInput[i].files[j].name;

				}
			}
		}
		alert(resultFileName);
		document.getElementById("workflowName-add").value(resultFileName);
		//workflowName.innerText = resultFileName;

	}

$(document).ready(function() {

	

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
				
				var dateString = new Date(result.jobSaveDate);
				
				var year = dateString.getFullYear();
				var month = ('0' + (dateString.getMonth() + 1)).slice(-2);
				var day = ('0' + dateString.getDate()).slice(-2);
				
				var hours = ('0' + dateString.getHours()).slice(-2); 
				var minutes = ('0' + dateString.getMinutes()).slice(-2);
				var seconds = ('0' + dateString.getSeconds()).slice(-2); 
				
				var jobresultDate = year + '-' + month  + '-' + day + ' ' + hours + ':' + minutes  + ':' + seconds;
				
				
				var scheduleDateString = new Date(result.scheduleSaveDate);
				
				var year = scheduleDateString.getFullYear();
				var month = ('0' + (scheduleDateString.getMonth() + 1)).slice(-2);
				var day = ('0' + scheduleDateString.getDate()).slice(-2);
				
				var hours = ('0' + scheduleDateString.getHours()).slice(-2); 
				var minutes = ('0' + scheduleDateString.getMinutes()).slice(-2);
				var seconds = ('0' + scheduleDateString.getSeconds()).slice(-2); 
				
				var scheduleResultDate = year + '-' + month  + '-' + day + ' ' + hours + ':' + minutes  + ':' + seconds;
				//alert(result.jobNote);
				//alert(resultDate);
				//$(".detail").val("");   
				//$('input[id=detail-JobId]').attr('value', result.jobId);
				$('label[for="detail-JobId"]').text(result.jobId);
				$('label[for="detail-JobName"]').text(result.jobName);
				$('label[for="detail-WorkflowName"]').text(result.workflowName);
				$('label[for="detail-IsUse"]').text(result.isUse);
				$('label[for="detail-CreateUser"]').text(result.userName);
				$('label[for="detail-SaveDate"]').text(jobresultDate);
				$("textarea[name=txtarea-note]").text(result.jobNote);
				$('#scheduleID').text(result.scheduleID);
				$('#scheduleName').text(result.scheduleName);
				$('#scheduleIsUse').text(result.scheduleIsUse);
				$('#scheduleType').text(result.scheduleType);
				$('#cronExpression').text(result.cronExpression);
				$('#oneTimeOccurDT').text(result.oneTimeOccurDT);
				$('#scheduleStartDT').text(result.scheduleStartDT);
				$('#scheduleEndDT').text(result.scheduleEndDT);
				$('#scheduleSaveDate').text(scheduleResultDate);
				

			},
			error: function(request, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});

	});


	$(document).on("click", ".editbtn", function() {
		var selectId = $(this).data('id');
		var url      = getContextPath() + "/jobdetails.do";
		var url_selectJobid = getContextPath() + "/selectjobid.do";
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
				$(".edit-body #edit-Note").text(result.jobNote);

			},
			error: function(request, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});
		
		$.ajax({
			url: url_selectJobid,
			type: "GET",
			data: {
				"jobId": selectId
			},
			contentType: "application/json; charset=UTF-8",
			success: function(result) {
				$(".edit-body #edit-WorkflowBlob").val(result.workflowBlob);

			},
			error: function(request, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});
	});
	
	
	$(document).on("click", ".schedulebtn", function() {
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
		var url      = getContextPath() + "/deletejob.do";
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

