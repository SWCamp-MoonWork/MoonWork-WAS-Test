

var d = new Date();
var endDay = new Date(d.getTime() - (d.getTimezoneOffset() * 60000)).toISOString().slice(0, -1);

//10800000 3시간 전
var startDay = new Date(d.getTime() - (d.getTimezoneOffset() * 60000 + 1800000)).toISOString().slice(0, -1);

console.log("현재시간: " + endDay);
console.log("30분 전: " + startDay);


function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
}

const runhistory =
{
	"type": "line",
	"utc": false,
	"title": null,
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
	"scale-x": null,
	"scale-y": {
		"line-color": "#f6f7f8",
		"shadow": 0,
		"guide": {
			"line-style": "dashed"
		},
		"label": {
			"text": "Run Duration(ms)",
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
	"series": null
};

// Zing차트 (런 히스토리)
//ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];
window.addEventListener('load', function() {


	var getstartDT = new Date(startDay);
	var resultStartDT = getstartDT.getTime();
	console.log("대시보드"+resultStartDT);

	var getendDT = new Date(endDay);
	var resultEndDT = getendDT.getTime();
	console.log("대시보드"+resultEndDT);

	const dashboardChartURL = getContextPath() + "/getChartGraph.do";


	let newDataSets_Zing = [];
	let boderColorArray = ["#04db68","#af232e", "#122191", "#59adf2", "#470570",  "#122191", "#243f34"];

	$.ajax({
		url: dashboardChartURL,
		type: "GET",
		data: {
			st: startDay,
			et: endDay
		},
		success: function(ChartData) {
			console.log(ChartData.length);
			
			if(ChartData.length == 0){
			 document.getElementById("DashRunHistoryChart").innerHTML = "Sorry, No data for the last 30 minutes.";	
			}
			console.log("대시보드그래프성공" + ChartData);
			
			
			for(var i = 0; i < ChartData.length; i++){
				
			newDataSets_Zing.push({
				"values": ChartData[i].y_data,			// y축
				"text": ChartData[i].label,		// 라벨이름
				"line-color": boderColorArray[i],
				"legend-item": {
					"background-color": boderColorArray[i],
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
			});
		}
		
		
			runhistory.series = newDataSets_Zing;
			runhistory["scale-x"] = {
				"min-value": resultStartDT,         //startDT
				"max-value": resultEndDT,         //endDT
				"shadow": 0,
				"step": 500,            // 1800000 = 1시간       // 간격 각 값에 1대1 대응        //60000 = 1분
				"transform": {
					"type": "date",
					"all": "%D, %d %M<br />%h:%i %A %s",
					"item": {
						"visible": false
					}
				},
				"label": {
					"visible": false
				},
				"minor-ticks": 0
			};




			zingchart.render({
				id: "DashRunHistoryChart",
				width: "100%",
				height: 350,
				data: runhistory
			});
		},
		error: function(e) {
			console.log(e);
		}
	}) 	//ajax



});


