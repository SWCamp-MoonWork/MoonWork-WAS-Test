
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


//보류
function login() {

	var userName = $('#userName').val();
	var password = $('#password').val();

	const loginurl = getContextPath() + "/login.do";

	$.ajax({
		url: loginurl,
		type: "GET",
		data: {
			"userName": userName,
			"password": password
		},
		success: function(result) {

			if (result == 'success') {
				console.log("된다");
				return true;
			}
			else if (result == 'fail') {
				console.log("안된다");
				return false;
			}
			else {
				alert("error");
			}

		},
		error: function(request, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});

}


function durationTimeSet(seconds) {
var hour = parseInt(seconds/3600) < 10 ? '0'+ parseInt(seconds/3600) : parseInt(seconds/3600);
var min = parseInt((seconds%3600)/60) < 10 ? '0'+ parseInt((seconds%3600)/60) : parseInt((seconds%3600)/60);
var sec = seconds % 60 < 10 ? '0'+seconds % 60 : seconds % 60;


return hour+":"+min+":" + sec;
}



$(document).ready(function() {

	//$.GetRecentFiveJobState();




	// 최근 5개 작업의 성공 실패 여부 구하기
	/* 
	바깥 Ajax는 job 리스트를 가져온다.
	그 후 반복문으로 job의 id를 검색하면서 또다른 Ajax의 request Data에 넣어준다
	안쪽 Ajax는 컨트롤러로 넘겨준 jobid에 해당하는 response를 List<RunsDTO>로 받게되는데
	받아온 리스트를 반복문을 사용해서 성공실패여부를 검색한다.
	검색 결과가 10이면 성공했다는 의미이므로 append를 사용해서 동적으로 초록색 아이콘을 넣어주고
	11이면 실패했다는 의미이므로 빨간색 아이콘을 넣어준다.
	나머지 값이 들어오면 성공 실패도 아니므로 흰색 아이콘을 넣어준다.
	
	하지만 Ajax안에 Ajax를 사용하는 것은 그다지 권장하지 않는 방법이라고 한다.
	Promise를 사용하여 더 간단하고 클린하게 코드를 작성 할 수 있지만 
	기한 내에 눈으로 보여지는 완성물을 만들기 위해서 사용법이 잘 숙지되어있는 Ajax를 사용했다. 	
	*/
	//$.GetRecentFiveJobState = function(){
	const getCountURL = getContextPath() + "/getTotalJobList.do";
	const runsState = getContextPath() + "/getRecentRuns.do";

	$.ajax({	// job리스트 가져오기
		url: getCountURL,
		type: "GET",
		//async : false,
		success: function(result) {	//result = job리스트
			$.each(result, function(index, value) {
				$.ajax({	// 특정 jobid에 따른 runs 데이터 가져오기
					url: runsState,
					type: "GET",
					data: {
						getjobid: result[index].jobId
					},
					success: function(data) {	// data = job아이디에 따른 runs 데이터
						for (var i = 0; i < 5; i++) {
							if (data[i].State == '10') {
								console.log("성공job");
								$('#state' + data[i].jobId).append('<i class="fa-regular fa-circle-check fa-lg" style="color:green; margin-right:2px"></i>');
							}
							else if (data[i].State == '11') {
								console.log("실패job");
								$('#state' + data[i].jobId).append('<i class="fa-regular fa-circle-xmark fa-lg" style="color:red; margin-right:2px"></i>');
							}
							else {
								console.log("여부 없음");
								//$('#state' + data[i].jobId).append('<i class="fa-regular fa-circle fa-lg" style="color:var(--color-black); margin-right:2px"></i>');
							}
						};
					},
					error: function(request, error) {
						alert("runsState 에러 code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
					}
				});
			});
		},
		error: function(request, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});

	//}











	// 업로드한 파일명 추출
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


	// RunsChart 생성 함수
	$.drawingRunsChart = function(runsData) {
		var runchart = document.getElementById(
			'modalchart').getContext('2d');

		var labelsOfRunsId = [];
		var duration = [];


		for (var i = 0; i < runsData.length; i++) {
			var startDT = new Date(runsData[i].StartDT);
			
			var hour = startDT.getHours();
			var min = startDT.getMinutes();
			var sec = startDT.getSeconds();
			
			
			
			console.log(hour + ':' + min + ':' + sec);
			labelsOfRunsId.push(hour + ':' + min + ':' + sec);
			duration.push(parseInt(runsData[i].Duration));
		}
		
		var chartjs = new Chart(runchart,{
				type: 'bar', //pie, line, doughnut, polarArea
				data: {
					labels: labelsOfRunsId,
					datasets: [{
						//label: 'Run Duration',
						data: duration,
						borderColor: '#7B4ED4',
						fill: true,
						backgroundColor: 'rgba(123, 78, 212, 0.5)'
					}]
				},
				options: {
					responsive: false,
					legend: false,
					animation : {
						duration:0
					},
					scales: {
						yAxes: [{
							ticks: {
								min: 0,
								beginAtZero: true,
								stepSize: 100,
								fontColor: "rgba(128, 128, 128, 1)",
								fontSize: 14,
							},
							gridLines: {
								color: "rgba(128, 128, 128, 1)",
								lineWidth: 0.1
							}
						}],
						xAxes: [{
							categoryPercentage: 0.7,
            				maxBarThickness: 20,
							ticks: {
								fontColor: "rgba(128, 128, 128, 1)",
								fontSize: 20
							},
							gridLines: {
								color: "rgba(128, 128, 128, 1)",
								lineWidth: 0.5
							}
						}]
					}
				}
			});

	}


	// jobName 클릭 시 해당 job 정보와 스케줄 정보 출력
	$(".jobdetail").click(function() {
		// 클릭한 a태그의 id값 가져오기
		const id = $(this).attr('id');
		// getContextPath() : 현재 경로 찾기
		const detailurl = getContextPath() + "/jobdetails.do";

		$.ajax({
			url: detailurl,
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


	// 소스코드 재첨부 체크박스 변경 시 이벤트
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


	// edit 버튼 클릭 시 띄워진 모달창에 해당 job의 데이터 출력
	$(document).on("click", ".editbtn", function() {
		var selectId = $(this).data('id');
		const editurl = getContextPath() + "/jobdetails.do";
		var url_selectJobid = getContextPath() + "/selectjobid.do";

		// id, name, workflowname, note 데이터 가져오기
		$.ajax({
			url: editurl,
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
		const scheduleurl = getContextPath() + "/jobdetails.do";
		$.ajax({
			url: scheduleurl,
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



	// Runs 버튼 클릭 시 jobid에 해당하는 Runs 데이터의 최근 20개 가져오기
	$(document).on("click", ".runsbtn", function() {
		
		var resulthtml;
		let runsState;

		var selectId = $(this).data('id');
		console.log(selectId);
		const runsurl = getContextPath() + "/GetLastTwentyRunsData.do";
		$.ajax({
			url: runsurl,
			type: "GET",
			data: {
				"jobId": selectId
			},
			contentType: "application/json; charset=UTF-8",
			success: function(runsData) {
				
				if(runsData.length > 0){
					for (var i = 0; i < runsData.length; i++) {
					
					let tt = durationTimeSet(runsData[i].Duration);

					
					if (runsData[i].State == '10') {
						runsState = '성공';
					}
					else {
						runsState = '실패';
					}
					
					var htmls = '<tr id="resultRunsData-tr">' +
						'<td>' + runsData[i].RunId + '</td>' +
						'<td>' + runsData[i].WorkflowName + '</td>' +
						'<td>' + $.dateFomatting(runsData[i].StartDT) + '</td>' +
						'<td>' + $.dateFomatting(runsData[i].EndDT) + '</td>' +
						'<td>' + tt + '</td>' +
						'<td>' + runsState + '</td>' +
						'<td><button type="button" class="btn RunsResultData" data-bs-toggle="modal" data-bs-target="#resultDataModal" data-id=' + runsData[i].RunId + '>보기</button></td>' +
						'<tr>'

				resulthtml += htmls

					}
				$('.runsData-tbody').html(resulthtml);
				$.drawingRunsChart(runsData);
				}
				
				else{
				$('.runsData-tbody').empty();
				$.drawingRunsChart(runsData);
				}
				

			},
			error: function(request, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});
	});
	
	$(document).on("click", ".RunsResultData", function() {
		
		var RunsId = $(this).data('id');
		const resultDataUrl = getContextPath() + "/getResultData.do";
		

		$.ajax({
			url: resultDataUrl,
			type: "GET",
			data: {
				RunId : RunsId
			},
			contentType: "application/json; charset=UTF-8",
			success: function(result) {
				console.log(result.ResultData);
				$("textarea[name=ResultDataNote]").text(result.ResultData);

			},
			error: function(request, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});
	});


	// 크론식 유효성 검사 함수
	// ajax를 사용하여 사용자가 값을 입력할 때마다 이벤트를 감지해 컨트롤러와 통신한다.
	$("#Cron-expression")
		.keyup(
			function() {
				const cronurl = getContextPath() + "/cronExpression.do";
				var cron = $(this).val();
				if ($(this).val() === '') {
					$('#cron-result')
						.html(
							'<b class="CronIsVaildText" id="fail" style="font-size: 14px; color: orange">크론식을 입력해주세요</b>');
				} else {
					$
						.ajax({
							url: cronurl,
							type: "GET",
							data: {
								"expression": cron
							},
							contentType: "application/json; charset=UTF-8",
							success: function(
								result) {
								if (result === true) {

									$(
										'#cron-result')
										.html(
											'<b style="font-size: 14px; color: #39D452">올바른 크론식입니다.</b>');
								} else
									$(
										'#cron-result')
										.html(
											'<b class="CronIsVaildText" id="fail" style="font-size: 14px; color: #D42449">잘못된 크론식입니다.</b>');
 
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




	//작업이 실행중인지 아닌지에 대한 상태를 실시간으로 가져오기
	var targeturl = getContextPath() + "/getstate.do";
	setInterval(function() {
		$.ajax({
			url: targeturl,
			type: 'GET',
			//data: JSON.stringify(param),
			contentType: "application/json; charset=UTF-8",
			success: function(result) {

				for (var i = 0; i < result.length; i++) {
					if (result[i].State == 1) {
						$('#loading' + result[i].JobId).addClass('fa-spin');
					}
					else {
						$('#loading' + result[i].JobId).removeClass('fa-spin');
					}
				}
			},
			error: function(e) {
				console.log(e);
			}
		});
	}, 2000); // End setTimeout(function()


	// 이게맞나..? 일단 보류
	$(document).on("click", ".refreshbtn", function() {

		$.ajax({
			url: getContextPath() + "/joblist.do",
			type: 'GET',
			success: function(result) {

				console.log("새로고침 성공");
			},
			error: function(e) {
				console.log(e);
			}
		});


	});


});




var myModal = document.getElementById('myModal')
var myInput = document.getElementById('myInput')

// 모달창 바깥을 클릭해도 창이 꺼지지 않도록 함
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

	}
}
