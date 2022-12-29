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
		height: "400px",
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
		locale: "ko",
		editing: false,
		paging: true,
		autoload: true,
		width: "100%",
		height: "400px",
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

