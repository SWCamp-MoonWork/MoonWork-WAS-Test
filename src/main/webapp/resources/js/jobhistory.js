

var d = new Date();
var endDay = new Date(d.getTime() - (d.getTimezoneOffset() * 60000)).toISOString().slice(0, -1);

//10800000 3시간 전
var startDay = new Date(d.getTime() - (d.getTimezoneOffset() * 60000 + 10800000)).toISOString().slice(0, -1);

document.getElementById('endDate').value = endDay
document.getElementById('startDate').value = startDay

console.log("현재시간: " + endDay);
console.log("3시간 전: " + startDay);


function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
}

const runhistory =
{
	"background-color": "none",
	"type": "line",
	"utc": false,
	"title": {
		"text": "Runs History of Jobs",
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
	console.log(resultStartDT);

	var getendDT = new Date(endDay);
	var resultEndDT = getendDT.getTime();
	console.log(resultEndDT);

	const URL = getContextPath() + "/RunHistoryGraph.do";


	let newDataSets_Zing = [];
	let boderColorArray = ["#04db68","#af232e", "#122191", "#59adf2", "#470570",  "#122191", "#243f34"];




	$.ajax({
		url: URL,
		type: "GET",
		data: {
			st: startDay,
			et: endDay
		},
		success: function(ChartData) {

			console.log("얌마" + typeof (ChartData.y_data));

			console.log("런히스토리성공" + ChartData);
			
			
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
				id: "RunHistoryChart",
				width: "100%",
				height: 400,
				data: runhistory
			});
		},
		error: function(e) {
			console.log(e);
		}
	}) 	//ajax



});

function getChartInDate() {

	let setEndDate = document.getElementById('endDate').value;
	let setStratDate = document.getElementById('startDate').value;
	
	
	var get_setstartDT = new Date(setStratDate);
	var result_setStartDT = get_setstartDT.getTime();
	console.log(result_setStartDT);

	var get_setendDT = new Date(setEndDate);
	var result_setEndDT = get_setendDT.getTime();
	console.log(result_setEndDT);
	
	
	const URL = getContextPath() + "/RunHistoryGraph.do";
	let newDataSets_Zing = [];
	let boderColorArray = ["#04db68","#af232e", "#122191", "#59adf2", "#470570",  "#122191", "#243f34"];
	$.ajax({
		url: URL,
		type: "GET",
		data: {
			st: setStratDate,
			et: setEndDate
		},
		success: function(ChartData) {

			console.log("런히스토리성공" + ChartData);

			for (var i = 0; i < ChartData.length; i++) {


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

				runhistory.series = newDataSets_Zing;
			}
			
			runhistory["scale-x"] = {
				"min-value": result_setStartDT,         //startDT
				"max-value": result_setEndDT,         //endDT
				"shadow": 0,
				"step": 60000,            // 1800000 = 1시간       // 간격 각 값에 1대1 대응        //60000 = 1분
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
				id: "RunHistoryChart",
				width: "100%",
				height: 400,
				data: runhistory
			});
		},
		error: function(e) {
			console.log(e);
		}
	}) 	//ajax
}

function getChartOption(optionId) {
	let setEndDate = document.getElementById('endDate').value;
	let setStratDate = document.getElementById('startDate').value;
	console.log(optionId);
	if(optionId == "last10"){
		
		
		var last10Date = new Date(d.getTime() - (d.getTimezoneOffset() * 60000 + 600000)).toISOString().slice(0, -1);
		document.getElementById('startDate').value = last10Date;
		setEndDate = endDay;
		setStratDate = last10Date;
	}else if(optionId == "last30"){
		var last30Date = new Date(d.getTime() - (d.getTimezoneOffset() * 60000 + 1800000)).toISOString().slice(0, -1);
		document.getElementById('startDate').value = last30Date;
		setEndDate = endDay;
		setStratDate = last30Date;
	}else if(optionId == "last60"){
		var last60Date = new Date(d.getTime() - (d.getTimezoneOffset() * 60000 + 3600000)).toISOString().slice(0, -1);
		document.getElementById('startDate').value = last60Date;
		setEndDate = endDay;
		setStratDate = last60Date;
	}else if(optionId == "last120"){
		var last120Date = new Date(d.getTime() - (d.getTimezoneOffset() * 60000 + 7200000)).toISOString().slice(0, -1);
		document.getElementById('startDate').value = last120Date;
		setEndDate = endDay;
		setStratDate = last120Date;
	}else if(optionId == "last720"){
		var last720Date = new Date(d.getTime() - (d.getTimezoneOffset() * 60000 + 43200000)).toISOString().slice(0, -1);
		document.getElementById('startDate').value = last720Date;
		setEndDate = endDay;
		setStratDate = last720Date;
	}
	else{
		console.log("실패");
		
	}


	
	
	var get_setstartDT = new Date(setStratDate);
	var result_setStartDT = get_setstartDT.getTime();
	console.log(result_setStartDT);

	var get_setendDT = new Date(setEndDate);
	var result_setEndDT = get_setendDT.getTime();
	console.log(result_setEndDT);
	
	
	const URL = getContextPath() + "/RunHistoryGraph.do";
	let newDataSets_Zing = [];
	let boderColorArray = ["#04db68","#af232e", "#122191", "#59adf2", "#470570",  "#122191", "#243f34"];
	$.ajax({
		url: URL,
		type: "GET",
		data: {
			st: setStratDate,
			et: setEndDate
		},
		success: function(ChartData) {

			console.log("런히스토리성공" + ChartData);

			for (var i = 0; i < ChartData.length; i++) {


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

				runhistory.series = newDataSets_Zing;
			}
			
			runhistory["scale-x"] = {
				"min-value": result_setStartDT,         //startDT
				"max-value": result_setEndDT,         //endDT
				"shadow": 0,
				"step": 60000,            // 1800000 = 1시간       // 간격 각 값에 1대1 대응        //60000 = 1분
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
				id: "RunHistoryChart",
				width: "100%",
				height: 400,
				data: runhistory
			});
		},
		error: function(e) {
			console.log(e);
		}
	}) 	//ajax
}
