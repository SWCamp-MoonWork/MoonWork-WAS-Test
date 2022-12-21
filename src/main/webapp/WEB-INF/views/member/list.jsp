<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>		
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
</head>
<body>

	<!-- 데이터 리스트 -->
	<h1>Member List</h1>
	<input type="button" value="회원 등록" onclick="location.href='write'">
	<table border="1" width="600px">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Email</th>
			<th>Birth</th>
		</tr>
		<!-- MemberController에서 model을 통해 넘겨준 변수명(items)과 동일해야 함 -->
		<!-- items 리스트에서 하나씩. dto 값 출력 -->
		<c:forEach var="row" items="${items}">
			<tr>
				<td>${row.id}</td>
				<td><a
					href="${pageContext.request.contextPath}/member/view?id=${row.id}">
						${row.name}</a></td>
				<td>${row.email}</td>
				<td>${row.birth}</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- Chartjs 실습 -->
	<div class="container">
		<div class="row">
			<div class="col-md-6"> <!-- 차트를 정렬하기 위해 부트스트랩 그리드 옵션 사용 -->
				<canvas id="myChartOne"></canvas>
			</div>
			<div class="col-md-6">
				<canvas id="myChartTwo"></canvas>
			</div>
			<div class="col-md-6">
				<canvas id="myChartThree"></canvas>
			</div>
		</div>
	</div>
	<script>
	let myChartOne = document.getElementById('myChartOne').getContext('2d');
	let myChartTwo = document.getElementById('myChartTwo').getContext('2d');
	let myChartThree = document.getElementById('myChartThree').getContext('2d');
	
	let barChart = new Chart(myChartOne, {
		type : 'pie', //pie, line, doughnut, polarArea
		data : {
			labels : ['1번', '2번', '3번', '4번', '5번'],
			datasets : [{
				label : '테스트 데이터',
				data : [
					10,
					100,
					100,
					200,
					1000
				]
			}]
		}
	});
	
	let barChartTwo = new Chart(myChartTwo, {
		type : 'bar', //pie, line, doughnut, polarArea
		data : {
			labels : ['1번', '2번', '3번', '4번', '5번'],
			datasets : [{
				label : '테스트 데이터',
				data : [
					10,
					100,
					100,
					200,
					1000
				],
				backgroundColor:[
					'red',
					'rgba(255, 255, 0, 0.5)',
					'#990000',
					'skyblue',
					'dodgerblue'
				],
				borderWidth : 5,
				borderColor : '#000',
				hoverBorderWidth : 10
			}]
		}
	});
	
	let barChartThree = new Chart(myChartThree, {
		type : 'line', //pie, line, doughnut, polarArea
		data : {
			labels : ['1번', '2번', '3번', '4번', '5번'],
			datasets : [{
				label : '테스트 데이터',
				data : [
					10,
					100,
					100,
					200,
					1000
				],
				backgroundColor:[
					'red',
					'rgba(255, 255, 0, 0.5)',
					'#990000',
					'skyblue',
					'dodgerblue'
				],
				borderWidth : 5,
				borderColor : '#000',
				hoverBorderWidth : 10
			}]
		}
	});

	</script>
	
	<!-- jsGrid 실습 -->
	        <div id="jsGrid"></div>
        <script>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        	var dataMap = '<c:out value='${dataMap}'/>'
            $(function () {

                $("#jsGrid").jsGrid({
                    width: "100%",
                    height: "400px",
                    sorting: true, // 칼럼의 헤더를 눌렀을 때, 그 헤더를 통한 정렬 
                    data: dataMap,

                    fields: [ // 그리드 헤더 부분에 넣기 위해서 필드 지정 
                        { name: "ID", type: "text", width: 100 },
                        { name: "Name", type: "text", width: 100 },
                        { name: "Email", type: "text", width: 200 }
                      
                    ]
                })
            })

            var clients = [
                { "ID": "Otto Clay", "Name": 25, "Email": 1 }
               
            ];

        </script>

</body>
</html>
