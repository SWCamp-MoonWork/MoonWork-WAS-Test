/**
 * ChartJs Code
 */

let myChartTwo = document.getElementById('myChartTwo')
	.getContext('2d');
let myChartThree = document.getElementById('myChartThree')
	.getContext('2d');

let barChartTwo = new Chart(myChartTwo, {
	type: 'bar', //pie, line, doughnut, polarArea
	data: {
		labels: ['1번', '2번', '3번', '4번', '5번'],
		datasets: [{
			label: '테스트 데이터',
			data: [10, 100, 100, 200, 1000],
			backgroundColor: [ 'rgba(255, 99, 132, 0.2)',
				'rgba(255, 159, 64, 0.2)',
				'rgba(255, 205, 86, 0.2)',
				'rgba(75, 192, 192, 0.2)',
				'rgba(54, 162, 235, 0.2)'],
			borderWidth: 1,
			borderColor: ['rgb(255, 99, 132)',
				'rgb(255, 159, 64)',
				'rgb(255, 205, 86)',
				'rgb(75, 192, 192)',
				'rgb(54, 162, 235)'],
			hoverBorderWidth: 1
		}]
	}
});
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