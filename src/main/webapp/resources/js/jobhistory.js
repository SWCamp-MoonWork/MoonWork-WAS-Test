
getZingChartGraph();
	var newDataSets_Zing = [];

function getZingChartGraph() {


	var ZingURL = getContextPath() + "/getChartGraph.do";

	$.ajax({
		url: ZingURL,
		type: "GET",
		success: function(ZingChartData) {
			console.log("성공" + ZingChartData);
			for (var i = 0; i < ZingChartData.length; i++) {
				console.log("borderColor" + ZingChartData[i].borderColor);
				console.log("label" + ZingChartData[i].label);
				console.log("x_data" + ZingChartData[i].x_data);
				console.log("y_list" + ZingChartData[i].y_data);

				newDataSets_Zing.push({
					"values": ZingChartData[i].y_data,			// 배열
					"text": ChartData[i].label,		// 라벨이름
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
				});

			}
		},
		error: function(e) {
			console.log(e);
		}
	})
}


// Zing차트 (런 히스토리)
ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];
var runhistory = {
	"type": "line",
	"backgroundColor": null,
	"utc": true,
	"title": {
		"text": "Run Duration of Jobs",
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
	"series": newDataSets_Zing
};

zingchart.render({
	id: 'RunHistoryChart',
	data: runhistory,
	height: '600px',
	width: '100%'
});
