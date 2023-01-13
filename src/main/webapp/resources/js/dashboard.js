/**
 * 

 const themeToggler = document.querySelector(".theme-toggler");
 
 themeToggler.addEventListener('click', () => {
 	document.body.classList.toggle('dark-theme-variables');

	themeToggler.querySelector('span:nth-child(1)').classList.toggle('active');
 	themeToggler.querySelector('span:nth-child(2)').classList.toggle('active');
 })
 */
 const background = null;
 // 체크박스 체크 시 아이콘 변경
$(document).ready(function(){
$("#dn").change(function(){         
        if($("#dn").is(":checked")){ 
           $(".toggle__handler").html("dark_mode");
            background = getComputedStyle(document.documentElement).getPropertyValue("--color-white");
        }
        else { 
           $(".toggle__handler").html("light_mode");
           background = getComputedStyle(document.documentElement).getPropertyValue("--color-white");
        }
    });
});


  // 테마 변경
function darkmodeGo () {
  const darkModeToggle = document.getElementById('dn'); // 체크박스 정의
  if (!darkModeToggle) {return !1} // 체크 박스 없을 시 작동 종료
  const Realbody = document.querySelector('body');
  darkModeToggle.addEventListener('change', function(event) {//체크박스의 변화 감지 리스너
    if (!Realbody.classList.contains('dark-theme-variables')) { // 바디에 다크모드 클래스가 없으면
      Realbody.classList.add('dark-theme-variables'); // 다크모드 추가
      localStorage.setItem('whatMode', darkModeToggle.checked); //whatMode라는 이름의 아이템에 체크박스의 체크 여부를 저장하기     
 }
    else { // 바디에 다크모드 클래스가 있으면
      Realbody.classList.remove('dark-theme-variables'); // 다크모드 클래스를 제거
      localStorage.setItem('whatMode', darkModeToggle.checked); //whatMode라는 이름의 아이템에 체크박스의 체크 여부를 저장하기     
    }
  })
}
darkmodeGo ()
document.addEventListener('DOMContentLoaded',function(){
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

// css 값 가져오기



// Zing차트 (대시보드)
ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];
var dashboard = {
	type: 'calendar',
	backgroundColor: background,
	options: {
		year: {
			text: '2023',
			visible: false
		},
		startMonth: 1,
		endMonth: 6,
		palette: ['none', '#000'],
		month: {
			item: {
				fontColor: 'gray',
				fontSize: 15
			}
		},
		weekday: {
			values: ['', 'Mon', '', 'Wed', '', 'Fri', ''],
			item: {
				fontColor: 'gray',
				fontSize: 15
			}
		},
		values: [
			['2023-01-01', 3],
			['2023-01-04', 12],
			['2023-01-05', 3],
			['2023-01-06', 4],
			['2023-01-07', 9],
			['2023-01-08', 11],
			['2023-01-11', 5],
			['2023-01-12', 5],
			['2023-02-13', 9],
			['2023-02-10', 9],
			['2023-02-13', 11],
			['2023-02-11', 5],
			['2023-02-04', 5],
			['2023-02-20', 9],
			['2023-02-28', 9],
			['2023-02-01', 11],
			['2023-04-04', 5],
			['2023-04-17', 5],
			['2023-04-27', 9],
			['2023-04-06', 9],
			['2023-05-08', 11],
			['2023-05-14', 5],
			['2023-05-15', 5],
			['2023-05-10', 9],
			['2023-05-03', 9],
			['2023-06-01', 11],
			['2023-06-14', 5],
			['2023-06-16', 5],
			['2023-06-19', 9],
			['2023-06-20', 9],

		]
	}
};

zingchart.loadModules('calendar', function() {
	zingchart.render({
		id: 'myChart',
		data: dashboard,
		height: 200,
		width: '100%'
	});
});


// Zing차트 (런 히스토리)
ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];
var runhistory = {
	"type": "line",
	"backgroundColor" : background,
	"utc": true,
	"title": {
		"text": "Run history by All hosts",
		"font-size": "24px",
		"adjust-layout": true
	},
	"plotarea": {
		"margin": "dynamic 45 60 dynamic",
	},
	"legend": {
		"layout": "float",
		"background-color": "none",
		"border-width": 0,
		"shadow": 0,
		"align": "center",
		"adjust-layout": true,
		"toggle-action": "remove",
		"item": {
			"padding": 7,
			"marginRight": 17,
			"cursor": "hand"
		}
	},
	"scale-x": {
		"min-value": 1383292800000,
		"shadow": 0,
		"step": 3600000,
		"transform": {
			"type": "date",
			"all": "%D, %d %M<br />%h:%i %A",
			"item": {
				"visible": false
			}
		},
		"label": {
			"visible": false
		},
		"minor-ticks": 0
	},
	"scale-y": {
		"line-color": "#f6f7f8",
		"shadow": 0,
		"guide": {
			"line-style": "dashed"
		},
		"label": {
			"text": "Duration",
		},
		"minor-ticks": 0,
		"thousands-separator": ","
	},
	"crosshair-x": {
		"line-color": "#efefef",
		"plot-label": {
			"border-radius": "5px",
			"border-width": "1px",
			"border-color": "#f6f7f8",
			"padding": "10px",
			"font-weight": "bold"
		},
		"scale-label": {
			"font-color": "#000",
			"background-color": "#f6f7f8",
			"border-radius": "5px"
		}
	},
	"tooltip": {
		"visible": false
	},
	"plot": {
		"highlight": true,
		"tooltip-text": "%t views: %v<br>%k",
		"shadow": 0,
		"line-width": "2px",
		"marker": {
			"type": "circle",
			"size": 3
		},
		"highlight-state": {
			"line-width": 3
		},
		"animation": {
			"effect": 1,
			"sequence": 2,
			"speed": 100,
		}
	},
	"series": [{
		"values": [
			149.2,
			174.3,
			187.7,
			147.1,
			129.6,
			189.6,
			230,
			164.5,
			171.7,
			163.4,
			194.5,
			200.1,
			193.4,
			254.4,
			287.8,
			246,
			199.9,
			218.3,
			244,
			312.2,
			284.5,
			249.2,
			305.2,
			286.1,
			347.7,
			278,
			240.3,
			212.4,
			237.1,
			253.2,
			186.1,
			153.6,
			168.5,
			140.9,
			86.9,
			49.4,
			24.7,
			64.8,
			114.4,
			137.4
		],
		"text": "Master",
		"line-color": "#007790",
		"legend-item": {
			"background-color": "#007790",
			"borderRadius": 5,
			"font-color": "white"
		},
		"legend-marker": {
			"visible": false
		},
		"marker": {
			"background-color": "#007790",
			"border-width": 1,
			"shadow": 0,
			"border-color": "#69dbf1"
		},
		"highlight-marker": {
			"size": 6,
			"background-color": "#007790",
		}
	},
	{
		"values": [
			714.6,
			656.3,
			660.6,
			729.8,
			731.6,
			682.3,
			654.6,
			673.5,
			700.6,
			755.2,
			817.8,
			809.1,
			815.2,
			836.6,
			897.3,
			896.9,
			866.5,
			835.8,
			797.9,
			784.7,
			802.8,
			749.3,
			722.1,
			688.1,
			730.4,
			661.5,
			609.7,
			630.2,
			633,
			604.2,
			558.1,
			581.4,
			511.5,
			556.5,
			542.1,
			599.7,
			664.8,
			725.3,
			694.2,
			690.5
		],
		"text": "Worker1",
		"line-color": "#009872",
		"legend-item": {
			"background-color": "#009872",
			"borderRadius": 5,
			"font-color": "white"
		},
		"legend-marker": {
			"visible": false
		},
		"marker": {
			"background-color": "#009872",
			"border-width": 1,
			"shadow": 0,
			"border-color": "#69f2d0"
		},
		"highlight-marker": {
			"size": 6,
			"background-color": "#009872",
		}
	},
	{
		"values": [
			536.9,
			576.4,
			639.3,
			669.4,
			708.7,
			691.5,
			681.7,
			673,
			701.8,
			636.4,
			637.8,
			640.5,
			653.1,
			613.7,
			583.4,
			538,
			506.7,
			563.1,
			541.4,
			489.3,
			434.7,
			442.1,
			482.3,
			495.4,
			556.1,
			505.4,
			463.8,
			434.7,
			377.4,
			325.4,
			351.7,
			343.5,
			333.2,
			332,
			378.9,
			415.4,
			385,
			412.6,
			445.9,
			441.5
		],
		"text": "Worker2",
		"line-color": "#da534d",
		"legend-item": {
			"background-color": "#da534d",
			"borderRadius": 5,
			"font-color": "white"
		},
		"legend-marker": {
			"visible": false
		},
		"marker": {
			"background-color": "#da534d",
			"border-width": 1,
			"shadow": 0,
			"border-color": "#faa39f"
		},
		"highlight-marker": {
			"size": 6,
			"background-color": "#da534d",
		}
	}
	]
};

zingchart.render({
	id: 'RunHistoryChart',
	data: runhistory,
	height: '600px',
	width: '100%'
});





// 툴팁
$(function() {
	$('.fa-regular').tooltip()
})


/**
 * ChartJs Code
 */

let myChartThree = document.getElementById('myChartThree')
	.getContext('2d');

let barChartThree = new Chart(myChartThree, {
	type: 'line', //pie, line, doughnut, polarArea
	data: {
		labels: ['1번', '2번', '3번', '4번', '5번'],
		datasets: [{
			label: '테스트 데이터',
			data: [10, 100, 100, 200, 1000],
			borderColor: '#000',
			tension: 0.1,
			fill: false
		}]
	}
});

