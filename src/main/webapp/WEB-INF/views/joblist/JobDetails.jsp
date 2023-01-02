<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 
<head>
  <meta charset="utf-8">
  <title>ZingSoft Demo</title>
 
  <script nonce="undefined" src="https://cdn.zingchart.com/zingchart.min.js"></script>
  <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
<script src="https://kit.fontawesome.com/fe820bbe93.js"
	crossorigin="anonymous"></script>
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/dashboard.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
  <style></style>
</head>
 
<body>
  <div id='myChart'></div>
  
							<canvas id="myChartTwo"></canvas>
							 
  <script>
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];
    var myConfig = {
      type: 'calendar',
      options: {
        year: {
          text: '',
          visible: true
        },
        startMonth: 1,
        endMonth: 6,
        palette: ['none', '#21f364'],
        month: {
          item: {
            fontColor: 'gray',
            fontSize: 15
          }
        },
        weekday: {
          values: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
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
          ['2023-01-13', 9],
          ['2023-01-14', 9],

        ]
      }
    };
 
    zingchart.loadModules('calendar', function() {
      zingchart.render({
        id: 'myChart',
        data: myConfig,
        height: 200,
        width: '50%'
      });
    });
  </script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
 <script src="<%=request.getContextPath()%>/resources/js/chartjs.js"></script>
</body>
 
</html>