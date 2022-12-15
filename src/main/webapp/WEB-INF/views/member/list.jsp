<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<title>Member List</title>
</head>
<body>

	<h1>Member List</h1>
	<input type="button" value="회원 등록" onclick="location.href='write'">
	<table border="1" width="600px">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Email</th>
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
		</tr>
		</c:forEach>
	</table>
	
<script>
  const labels = [
    'No 1 CPU',
    'No 2 CPU'
  ];

  const data = {
    labels: labels,
    datasets: [{
      label: 'CPU Monitoring',
      backgroundColor: ['rgb(255, 99, 132)', 'rgb(255, 205, 86)'],
      data: [40,0],
      hoverOffset: 4
    }]
  };

  const config = {
    type: 'doughnut',
    data: data,
    options: {}
  };
</script>
	<div>
	  <canvas id="myChart"></canvas>
	</div>
	
	<script>
  const myChart = new Chart(
    document.getElementById('myChart'),
    config
  );
</script>

</body>
</html>
