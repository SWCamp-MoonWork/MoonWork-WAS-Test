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
			borderColor: 'rgb(75, 192, 192)',
			tension: 0.1,
			fill: false
		}]
	}
});