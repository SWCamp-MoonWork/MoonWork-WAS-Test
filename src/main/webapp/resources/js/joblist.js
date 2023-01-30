
// Bootstrap Popover 이벤트 정의
var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
var popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
	return new bootstrap.Popover(popoverTriggerEl)
})

// 현재 경로 구하기 
function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
}

// 업로드 한 파일 파일명 추출
function fileUpload(name) {
	var fileInput = name.val();
	//alert(fileInput);
	alert(name.value.substring(fileInput.lastIndexOf("\\") + 1));
	//alert(resultFileName);
	document.getElementById("#edit-WorkflowName").val(name.value.substring(fileInput.lastIndexOf("\\") + 1));
	//workflowName.innerText = resultFileName;

}


$(document).ready(function() {


	$(document).on("change", ".file-add", function() {

		$(".add-body #workflowName-add").val($(this)[0].files[0].name);
	});

	$(document).on("change", "#edit-file", function() {

		$(".edit-body #edit-WorkflowName").val($(this)[0].files[0].name);
	});

	// 날짜 형식 변환 함수
	$.dateFomatting = function(inputDate) {
		var dateString = new Date(inputDate);

		var year = dateString.getFullYear();
		var month = ('0' + (dateString.getMonth() + 1)).slice(-2);
		var day = ('0' + dateString.getDate()).slice(-2);

		var hours = ('0' + dateString.getHours()).slice(-2);
		var minutes = ('0' + dateString.getMinutes()).slice(-2);
		var seconds = ('0' + dateString.getSeconds()).slice(-2);

		var resultDate = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;

		return resultDate;
	}


	// jobName 클릭 시 해당 job 정보와 스케줄 정보 출력
	$(".jobdetail").click(function() {
		// 클릭한 a태그의 id값 가져오기
		var id = $(this).attr('id');
		// getContextPath() : 현재 경로 찾기
		var url = getContextPath() + "/jobdetails.do";

		$.ajax({
			url: url,
			type: "GET",
			data: {
				"jobId": id
			},
			contentType: "application/json; charset=UTF-8",
			success: function(result) {

				// 받아온 데이터 라벨로 뿌려주기
				$('label[for="detail-JobId"]').text(result.JobId);
				$('label[for="detail-JobName"]').text(result.JobName);
				$('label[for="detail-WorkflowName"]').text(result.WorkflowName);

				$('label[for="detail-CreateUser"]').text(result.UserName);
				$('label[for="detail-SaveDate"]').text($.dateFomatting(result.JobSaveDate));
				$("textarea[name=txtarea-note]").text(result.JobNote);
				$('#scheduleID').text(result.ScheduleId);
				$('#scheduleName').text(result.ScheduleName);
				$('#scheduleIsUse').text(result.ScheduleIsUse);
				$('#scheduleSaveDate').text($.dateFomatting(result.ScheduleSaveDate));

				if (result.JobIsUse === true) {
					$('label[for="detail-IsUse"]').text("활성화");
					$('label[for="detail-IsUse"]').html('<strong>활성화&nbsp;&nbsp;</strong><i class="fa-solid fa-circle fa-fade" style="color:#39D353; --fa-animation-duration: 1s;"></i>');
				}
				else {
					$('label[for="detail-IsUse"]').text("비활성화");
					$('label[for="detail-IsUse"]').html('<strong>비활성화&nbsp;&nbsp;</strong><i class="fa-solid fa-circle fa-fade" style="color:#dc3545; --fa-animation-duration: 1s;"></i>');
				}

				// 스케줄 타입이 True 면 옵션이 Loop 이므로 onTimeOccurDT는 공백으로 처리 
				if (result.ScheduleType === true) {
					$('#scheduleType').text("Loop");
					$('#cronExpression').text(result.CronExpression);
					$('#oneTimeOccurDT').text('');
					$('#scheduleStartDT').text($.dateFomatting(result.ScheduleStartDT));
					$('#scheduleEndDT').text($.dateFomatting(result.ScheduleEndDT));

				}
				// 스케줄 타입이 Fase 면 옵션이 OneTime 이므로 onTimeOccurDT 제외하고 공백으로 처리
				else if (result.ScheduleType === false) {
					$('#scheduleType').text("OneTime");
					$('#cronExpression').text('');
					$('#oneTimeOccurDT').text($.dateFomatting(result.OneTimeOccurDT));
					$('#scheduleStartDT').text('');
					$('#scheduleEndDT').text('');
				}
				// 그 외에는 스케줄이 등록이 안된 것이므로 모두 공백처리
				else {
					$('#scheduleID').text('');
					$('#scheduleName').text('');
					$('#scheduleIsUse').text('');
					$('#scheduleType').text('');
					$('#cronExpression').text('');
					$('#oneTimeOccurDT').text('');
					$('#scheduleStartDT').text('');
					$('#scheduleEndDT').text('');
					$('#scheduleSaveDate').text('');
				}
			},
			error: function(request, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});

	});

	$('#re-fileUpload').change(
		function() {
			if ($(this).is(':checked')) {
				$(".re-fileUpload").html('<input class="form-control form-control-sm" id="edit-file" type = "file" name = "workflowFile">');
				$("#edit-checkfile").val("checked");
				$("#edit-workflowBlob").attr("disabled", true);
			}
			else {
				$("#edit-file").remove();
				$("#edit-checkfile").val("unchecked");
				$("#edit-workflowBlob").removeAttr("disabled");
			}
		});


	/*	$('#edit-IsUse').change(function(){
			if($(this).is(':checked')){
				$(this).val("truecheck");
			}
			else{
				$(this).val("falsecheck");
			}
		});*/

	// edit 버튼 클릭 시 띄워진 모달창에 해당 job의 데이터 출력
	$(document).on("click", ".editbtn", function() {
		var selectId = $(this).data('id');
		var url = getContextPath() + "/jobdetails.do";
		var url_selectJobid = getContextPath() + "/selectjobid.do";

		// id, name, workflowname, note 데이터 가져오기
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

				if (result.JobIsUse === false) {
					$('#edit-IsUse').prop("checked", false);
				}
				else {
					$('#edit-IsUse').prop("checked", true);
				}


			},
			error: function(request, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});

		// workflowBlob 데이터 가져오기 
		// blob 데이터를 가져오는 이유는(Blob을 수정할 수도 있고 안 할 수도 있기 때문에 우선 hidden 타입에 저장)
		// 그 후 사용자가 blob을 업데이트 하면 업데이트 된 blob을 전송해주고
		// blob을 업데이트 하지 않을 시에는 hidden 타입에 저장된 blob 데이터를 다시 그대로 업데이트 시켜준다.
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




	// schedule 버튼 클릭 시 띄워진 모달창에 해당 schedule의 데이터 출력
	$(document).on("click", ".schedulebtn", function() {
		var selectId = $(this).data('id');
		var url = getContextPath() + "/jobdetails.do";
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

	$("#Cron-expression")
		.keyup(
			function() {
				var url = getContextPath() + "/cronExpression.do";
				var cron = $(this).val();
				if ($(this).val() === '') {
					$('#cron-result')
						.html(
							'<b class="CronIsVaildText" id="fail" style="font-size: 14px; color: orange">크론식을 입력해주세요</b>');
				} else {
					$
						.ajax({
							url: url,
							type: "GET",
							data: {
								"expression": cron
							},
							contentType: "application/json; charset=UTF-8",
							success: function(
								result) {
								if (result === true) {
									//$("#schedule-addbtn").removeAttr("disabled"); 
									$(
										'#cron-result')
										.html(
											'<b style="font-size: 14px; color: #39D452">올바른 크론식입니다.</b>');
								} else
									$(
										'#cron-result')
										.html(
											'<b class="CronIsVaildText" id="fail" style="font-size: 14px; color: #D42449">잘못된 크론식입니다.</b>');
								//$("#schedule-addbtn").attr("disabled",true); 
							},
							error: function(
								request,
								error) {
								alert("code: "
									+ request.status
									+ "\n"
									+ "message: "
									+ request.responseText
									+ "\n"
									+ "error: "
									+ error);

							}
						});
				}
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
		var url = getContextPath() + "/deletejob.do";
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

