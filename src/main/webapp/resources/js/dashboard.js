
let bg = null;

let fire = null;

// 현재 경로 구하기 
function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
}


// 체크박스 체크 시 아이콘 변경
$(document).ready(function() {

	$("#dn").change(function() {
		if ($("#dn").is(":checked")) {
			$(".toggle__handler").html("dark_mode");
		}
		else {
			$(".toggle__handler").html("light_mode");
		}
	});


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


	//ChartJS 데이터 뿌려주기

	getChartGraph();



	$(".hostdetail").click(function() {

		const id = $(this).attr('id');
		const hostdetailurl = getContextPath() + "/getjobofhost.do";
		console.log("클릭");
		$.ajax({
			url: hostdetailurl,
			type: 'GET',
			data: {
				"hostId": id
			},
			contentType: "application/json; charset=UTF-8",
			success: function(result) {
				console.log("아작스 진입");
				$('.jobofhost-body').empty();
				for (var i = 0; i < result.length; i++) {

					$('.jobofhost-body').append(
						'<tr>' +
						'<td>' + result[i].JobId + '</td>' +
						'<td>' + result[i].JobName + '</td>' +
						'<td>' + $.dateFomatting(result[i].LastRun) + '</td>' +
						'<td>' + $.dateFomatting(result[i].NextRun) + '</td>' +
						'<tr>'
					);
				}

			},
			error: function(request, error) {
				console.log("에러");
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}


		});


	});



});



// 테마 변경
function darkmodeGo() {

	const darkModeToggle = document.getElementById('dn'); // 체크박스 정의
	if (!darkModeToggle) { return !1 } // 체크 박스 없을 시 작동 종료
	const Realbody = document.querySelector('body');
	darkModeToggle.addEventListener('change', function(event) {//체크박스의 변화 감지 리스너
		if (!Realbody.classList.contains('dark-theme-variables')) { // 바디에 다크모드 클래스가 없으면
			Realbody.classList.add('dark-theme-variables'); // 다크모드 추가
			localStorage.setItem('whatMode', darkModeToggle.checked); //whatMode라는 이름의 아이템에 체크박스의 체크 여부를 저장하기  


		}
		else { // 바디에 다크모드 클래스가 있으면
			Realbody.classList.remove('dark-theme-variables'); // 다크모드 클래스를 제거
			modeofcalendar = 'light';
			localStorage.setItem('whatMode', darkModeToggle.checked); //whatMode라는 이름의 아이템에 체크박스의 체크 여부를 저장하기     

		}
	})
}

function openMenu() {
	$('#hidden-menu').animate({
		left: '2%',
		opacity: 1
	}, 400);
	$('.dashboard').animate({
		padding: '35px 20px 50px 230px'
	}, 400);
	$('.read').animate({
		padding: '20px 40px 30px 205px'
	}, 400);
	$('.history').animate({
		padding: '50px 60px 30px 220px'
	}, 400);
	$('.hosts').animate({
		padding: '35px 50px 50px 230px'
	}, 400);
	//$('.dashboard').css({"padding-left": "15%"});
	$(this).addClass('active-1');
	$('.hamburger').removeClass('fa-bars');
	$('.hamburger').addClass('fa-xmark');
	$('#sidebar .nav li').removeClass('menu-hover');
}

function closeMenu() {
	$('#hidden-menu').animate({
		left: '-10%',
		opacity: 1
	}, 400);
	$('.dashboard').animate({
		padding: '35px 100px 50px'
	}, 400);
	$('.read').animate({
		padding: '20px 80px 30px'
	}, 400);
	$('.history').animate({
		padding: '50px 80px 30px'
	}, 400);
	$('.hosts').animate({
		padding: '35px 100px 50px'
	}, 400);
	$(this).removeClass('active-1');
	$('.hamburger').removeClass('fa-xmark');
	$('.hamburger').addClass('fa-bars');
	$('#sidebar .nav li').addClass('menu-hover');
}








// 햄버거 버튼 클릭 이벤트 
var burger = $('.menu-trigger');

burger.each(function(index) {
	var $this = $(this);

	$this.on('click', function(e) {
		e.preventDefault();
		$(this).toggleClass('active-' + (index + 1));
	})
});


// localStorage 에 숫자를 넣으면 setItem을 해도 계속 똑같은 값만 나온다.
// localStorage는 string 데이터 타입만 지원하기 떄문에 숫자를 넣으려면 json 타입으로 넣어야한다.
$(burger).on("click", function() {


	if (localStorage.getItem('menuToggle') === 'close') {
		openMenu();
		localStorage.setItem('menuToggle', 'open');
		console.log("open" + localStorage.getItem('menuToggle'));

	} else {
		closeMenu();

		localStorage.setItem('menuToggle', 'close');
		console.log("close" + localStorage.getItem('menuToggle'));
	}
})

darkmodeGo()
document.addEventListener('DOMContentLoaded', function() {

	const Realbody = document.querySelector('body');
	const whatMode = localStorage.getItem('whatMode'); //whatMode 아이템 값 불러오기
	if (whatMode === "false") { // 체크 여부가 false라면, 라이트모드입니다. 이 때 false는 문자열 타입이므로 "" 안에 적어야 합니다.

		return !1; // 라이트모드이므로 아무런 행동을 할 필요가 없습니다.
	}
	else { // 다크모드라면 
		const darkModeToggle = document.getElementById('dn'); //체크박스를 획득
		darkModeToggle.checked = true; // 체크박스에 체크를 해주기
		Realbody.classList.add('dark-theme-variables'); // 다크모드를 body에 걸어주기




	}
})


document.addEventListener('DOMContentLoaded', function() {


	if (localStorage.getItem('menuToggle') === 'close') {
		console.log("menu close")
		return !1;
	}
	else {
		console.log("menu open]")
		openMenu();
	}
})







// Zing차트 (대시보드)
//ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];
var dashboard_light = {
	type: 'calendar',
	backgroundColor: null,	//null : 배경색없음
	options: {
		year: {
			text: '2023',
			visible: false
		},
		startMonth: 1,
		endMonth: 12,
		palette: ['none', '#39d353'],
		month: {
			item: {
				fontColor: 'grey',
				fontSize: 13

			}
		},
		weekday: {
			values: ['', 'Mon', '', 'Wed', '', 'Fri', ''],
			item: {
				fontColor: 'grey',
				fontSize: 12
			}
		},
		day: {
			borderColor: 'white',		//light : white  dark : #202528
			borderWidth: 5,
			inactive: { // Use this object to style the cells of all inactive days.
				backgroundColor: 'rgba(233, 238, 245, 1)'		//light : rgba(233, 238, 245, 1) dark: #000
			}
		},
		values: [
			['2023-01-01', 3],
			['2023-01-04', 12],
			['2023-01-05', 3],
			['2023-01-06', 4],
			['2023-01-01', 3],
			['2023-01-10', 12],
			['2023-02-07', 3],
			['2023-02-08', 4],
			['2023-02-01', 3],
			['2023-02-06', 12],
			['2023-02-03', 3],
			['2023-02-05', 4],
			['2023-02-02', 3],
			['2023-03-14', 12],
			['2023-03-17', 3],
			['2023-03-18', 4],
			['2023-03-25', 3],
			['2023-04-26', 12],
			['2023-04-21', 3],
			['2023-04-08', 4],
			['2023-04-04', 3],
			['2023-04-11', 12],
			['2023-04-13', 3],
			['2023-04-28', 4],
			['2023-04-30', 3],
			['2023-05-12', 12],
			['2023-05-01', 3],
			['2023-05-04', 4],
			['2023-05-05', 3],
			['2023-07-07', 12],
			['2023-07-10', 3],
			['2023-07-17', 4],
			['2023-08-20', 3],
			['2023-08-27', 12],
			['2023-09-17', 3],
			['2023-09-06', 4],
			['2023-10-04', 3],
			['2023-10-02', 12],
			['2023-10-01', 3],
			['2023-11-07', 4],
			['2023-11-01', 3],
			['2023-11-11', 12],
			['2023-11-14', 3],
			['2023-12-16', 4],
			['2023-12-18', 3],
			['2023-12-20', 12],
			['2023-12-22', 3],
			['2023-12-02', 4],
			['2023-12-01', 3],
			['2023-12-04', 12],
			['2023-12-05', 3],
			['2023-12-06', 4],
		]
	}
};


zingchart.loadModules('calendar', function() {

	zingchart.render({
		id: 'myCalendarChart',
		data: dashboard_light,
		height: 200,
		width: '100%'
	});
});







// 툴팁
$(function() {
	$('.fa-regular').tooltip()
})


/**
 * ChartJs Code
 */


function getChartGraph() {

	var boderColorArray = ["rgba(57, 211, 83, 0.5)", "#d33959", "#7c4ed4", "#88E031", "#D44D24", "#44D4AD", "#D48024"];
	var backgroundColor= ["rgba(57, 211, 83, 0.3)", "rgba(211, 57, 89, 0.3)", "rgba(124, 78, 212, 0.3)"];

	var URL = getContextPath() + "/getChartGraph.do";
	var newDataSets=[];
	
	$.ajax({
		url: URL,
		type: "GET",
		success: function(ChartData) {
			console.log("성공" + ChartData);
			for(var i = 0; i < ChartData.length; i++){
				console.log("borderColor" + ChartData[i].borderColor);
				console.log("label" + ChartData[i].label);
				console.log("x_data" + ChartData[i].x_data);
				console.log("y_list" + ChartData[i].y_data);
				
				newDataSets.push({
					label: ChartData[i].label,
					borderColor: boderColorArray[i],
					data: ChartData[i].y_data,
					fill: false
				});
			}// 컨트롤러에서 넘겨준 데이터 아주 잘찍힘
			
			
			new Chart(document.getElementById('myChartThree'), {
				type: 'line', //pie, line, doughnut, polarArea
				data: {
					labels: ChartData[0].x_data,				// 모든 작업의		
					datasets: newDataSets
					
				},
				options: {
					responsive: false,
					maintainAspectRatio: false,
					legend: false,/*{
						labels: {
							fontColor: "rgba(128, 128, 128, 1)",
							fontSize: 14
						} 
					},*/
					scales: {
						yAxes: [{
							ticks: {
								min: 0,
								beginAtZero: true,
								stepSize: 0.1,
								fontColor: "rgba(128, 128, 128, 1)",
								fontSize: 14,
							},
							gridLines: {
								color: "rgba(128, 128, 128, 1)",
								lineWidth: 0.5
							}
						}],
						xAxes: [{
							ticks: {
								fontColor: "rgba(128, 128, 128, 1)",
								fontSize: 14
							},
							gridLines: {
								color: "rgba(128, 128, 128, 1)",
								lineWidth: 0.5
							}
						}]
					}
				}
			});
		},
		error: function(e) {
			console.log(e);
		}
	}) 	//ajax
}	//getChartGraph


//	.getContext('2d');


