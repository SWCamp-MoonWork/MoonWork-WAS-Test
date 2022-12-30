/**
 * jsGrid Code
 */

$(function() {

	$("#dashboard-jsGrid").jsGrid({
		locale: "ko",
		editing: false,
		paging: true,
		autoload: true,
		width: "100%",
		height: "500px",
		sorting: true, // 칼럼의 헤더를 눌렀을 때, 그 헤더를 통한 정렬 

		controller: {
			loadData: function(filter) {
				return $.ajax({
					type: "GET",
					url: "/jsgrid.do",
					data: filter
				});
			}
		},

		fields: [ // 그리드 헤더 부분에 넣기 위해서 필드 지정 
			{
				name: "id",
				type: "text",
				width: 100
			}, {
				name: "name",
				type: "text",
				width: 100
			}, {
				name: "email",
				type: "text",
				width: 200
			}, {
				name: "birth",
				type: "text",
				width: 100
			}

		]
	});
});



$(function() {

	$("#schedule-jsGrid").jsGrid({
		width: "100%",
		height: "190px",
		sorting: true, // 칼럼의 헤더를 눌렀을 때, 그 헤더를 통한 정렬 

		data: sampleSchedule,

		fields: [ // 그리드 헤더 부분에 넣기 위해서 필드 지정 
			{
				name: "Id",
				type: "text",
				width: 50
			}, {
				name: "Name",
				type: "text",
				width: 170
			}, {
				name: "InUse",
				type: "text",
				width: 50
			}, {
				name: "Type",
				type: "text",
				width: 50
			}, {
				name: "OneTimeOccurDT",
				type: "text",
				width: 80
			}, {
				name: "StartDT",
				type: "text",
				width: 50
			}, {
				name: "EndDT",
				type: "text",
				width: 50
			}, {
				name: "SaveDate",
				type: "text",
				width: 50
			}

		]
	});
});

var sampleSchedule = [
	{
		"Id": "1",
		"Name": "2022/12/25 ~ 2023/12/25 매주 수요일 정기일정",
		"InUse": "On",
		"Type": "Loop",
		"OneTimeOccurDT": "",
		"StartDT": "2022/12/25",
		"EndDT": "2023/12/25",
		"SaveDate": "2022-12-01"
	},
	{
		"Id": "2",
		"Name": "	매주 일요일 db 백업",
		"InUse": "Off",
		"Type": "Loop",
		"OneTimeOccurDT": "",
		"StartDT": "2023/01/01",
		"EndDT": "2030/01/01",
		"SaveDate": "2022-12-05"
	}


]





$(function() {

	$("#host-jsGrid").jsGrid({
		width: "100%",
		height: "400px",
		sorting: true, // 칼럼의 헤더를 눌렀을 때, 그 헤더를 통한 정렬 

		data: sample,

		fields: [ // 그리드 헤더 부분에 넣기 위해서 필드 지정 
			{
				name: "HostId",
				type: "text",
				width: 100
			}, {
				name: "HostName",
				type: "text",
				width: 100
			}, {
				name: "InUse",
				type: "text",
				width: 50
			}, {
				name: "Role",
				type: "text",
				width: 100
			}, {
				name: "EndPoint",
				type: "text",
				width: 250
			}
			, {
				name: "Note",
				type: "text",
				width: 200
			}
			, {
				name: "SaveDate",
				type: "text",
				width: 100
			}

		]
	});
});

var sample = [
	{
		"HostId": "1",
		"HostName": "MainHost",
		"InUse": "On",
		"Role": "Master",
		"EndPoint": "RIE#jI3Rj3JI3291204J12",
		"Note": "마스터 노드 입니다.",
		"SaveDate": "2022-12-01"
	},
	{
		"HostId": "2",
		"HostName": "SubHost-1",
		"InUse": "Off",
		"Role": "Worker",
		"EndPoint": "UhqOuhuqhQUOH29P0@2@",
		"Note": "워커 노드 입니다.",
		"SaveDate": "2022-12-10"
	},
	{
		"HostId": "3",
		"HostName": "SubHost-2",
		"InUse": "Off",
		"Role": "Worker",
		"EndPoint": "dwoDJjdIJQ229289dj9",
		"Note": "워커 노드 입니다.",
		"SaveDate": "2022-12-30"
	},
	{
		"HostId": "4",
		"HostName": "SubHost-3",
		"InUse": "Off",
		"Role": "Worker",
		"EndPoint": "ENEDND310013DKDMDI",
		"Note": "워커 노드 입니다.",
		"SaveDate": "2022-12-20"
	},
	{
		"HostId": "5",
		"HostName": "SubHost-4",
		"InUse": "Off",
		"Role": "Worker",
		"EndPoint": "421IDJIWDIW0292D190J2190DJD",
		"Note": "워커 노드 입니다.",
		"SaveDate": "2022-12-31"
	}
]
