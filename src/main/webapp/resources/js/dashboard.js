/**
 * 
 */

    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];
    var myConfig = {
      type: 'calendar',
      options: {
        year: {
          text: '2023',
          visible: false
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
          values: ['', 'Mon', '', 'Wed', '', 'Fri', ''],
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
          ['2023-02-13', 9],
          ['2023-02-10', 9],
          ['2023-02-13', 11],
          ['2023-02-11', 5],
          ['2023-02-04', 5],
          ['2023-02-20', 9],
          ['2023-02-28', 9],
          ['2023-02-01', 11],
          ['2023-04-04', 5],
          ['2023-04-17', 5],
          ['2023-04-27', 9],
          ['2023-04-06', 9],
          ['2023-05-08', 11],
          ['2023-05-14', 5],
          ['2023-05-15', 5],
          ['2023-05-10', 9],
          ['2023-05-03', 9],
          ['2023-06-01', 11],
          ['2023-06-14', 5],
          ['2023-06-16', 5],
          ['2023-06-19', 9],
          ['2023-06-20', 9],

        ]
      }
    };
 
    zingchart.loadModules('calendar', function() {
      zingchart.render({
        id: 'myChart',
        data: myConfig,
        height: 200,
        width: '100%'
      });
    });


$(function () {
	$('.fa-regular').tooltip()
})

var exampleEl = document.getElementById('tooltip-info')
var tooltip = new bootstrap.Tooltip(exampleEl, {
  boundary: document.body // or document.querySelector('#boundary')
})

