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
   <div class="container-fluid">
      <div class="row flex-nowrap">
         <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
               <a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                  <span class="fs-5 d-none d-sm-inline">Menu</span>
               </a>
               <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                  <li class="nav-item"><a href="#"
                     class="nav-link align-middle px-0"> <i class="fs-4 bi-house"></i>
                        <span class="ms-1 d-none d-sm-inline">Home</span>
                  </a></li>
                  <li><a href="#submenu1" data-bs-toggle="collapse"
                     class="nav-link px-0 align-middle"> <i
                        class="fs-4 bi-speedometer2"></i> <span
                        class="ms-1 d-none d-sm-inline">Dashboard</span>
                  </a>
                     <ul class="collapse show nav flex-column ms-1" id="submenu1"
                        data-bs-parent="#menu">
                        <li class="w-100"><a href="#" class="nav-link px-0"> <span
                              class="d-none d-sm-inline">Item</span> 1
                        </a></li>
                        <li><a href="#" class="nav-link px-0"> <span
                              class="d-none d-sm-inline">Item</span> 2
                        </a></li>
                     </ul></li>
                  <li><a href="#" class="nav-link px-0 align-middle"> <i
                        class="fs-4 bi-table"></i> <span class="ms-1 d-none d-sm-inline">Orders</span></a>
                  </li>
                  <li><a href="#submenu2" data-bs-toggle="collapse"
                     class="nav-link px-0 align-middle "> <i
                        class="fs-4 bi-bootstrap"></i> <span
                        class="ms-1 d-none d-sm-inline">Bootstrap</span></a>
                     <ul class="collapse nav flex-column ms-1" id="submenu2"
                        data-bs-parent="#menu">
                        <li class="w-100"><a href="#" class="nav-link px-0"> <span
                              class="d-none d-sm-inline">Item</span> 1
                        </a></li>
                        <li><a href="#" class="nav-link px-0"> <span
                              class="d-none d-sm-inline">Item</span> 2
                        </a></li>
                     </ul></li>
                  <li><a href="#submenu3" data-bs-toggle="collapse"
                     class="nav-link px-0 align-middle"> <i class="fs-4 bi-grid"></i>
                        <span class="ms-1 d-none d-sm-inline">Products</span>
                  </a>
                     <ul class="collapse nav flex-column ms-1" id="submenu3"
                        data-bs-parent="#menu">
                        <li class="w-100"><a href="#" class="nav-link px-0"> <span
                              class="d-none d-sm-inline">Product</span> 1
                        </a></li>
                        <li><a href="#" class="nav-link px-0"> <span
                              class="d-none d-sm-inline">Product</span> 2
                        </a></li>
                        <li><a href="#" class="nav-link px-0"> <span
                              class="d-none d-sm-inline">Product</span> 3
                        </a></li>
                        <li><a href="#" class="nav-link px-0"> <span
                              class="d-none d-sm-inline">Product</span> 4
                        </a></li>
                     </ul></li>
                  <li><a href="#" class="nav-link px-0 align-middle"> <i
                        class="fs-4 bi-people"></i> <span
                        class="ms-1 d-none d-sm-inline">Customers</span>
                  </a></li>
               </ul>
               <hr>
               <div class="dropdown pb-4">
                  <a href="#"
                     class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
                     id="dropdownUser1" data-bs-toggle="dropdown"
                     aria-expanded="false"> <img src="https://github.com/mdo.png"
                     alt="hugenerd" width="30" height="30" class="rounded-circle">
                     <span class="d-none d-sm-inline mx-1">loser</span>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-dark text-small shadow"
                     aria-labelledby="dropdownUser1">
                     <li><a class="dropdown-item" href="#">New project...</a></li>
                     <li><a class="dropdown-item" href="#">Settings</a></li>
                     <li><a class="dropdown-item" href="#">Profile</a></li>
                     <li>
                        <hr class="dropdown-divider">
                     </li>
                     <li><a class="dropdown-item" href="#">Sign out</a></li>
                  </ul>
               </div>
            </div>
         </div>
         <div class="container" style="width: 1600px">
            <div class="row">
               
               <div class="col-sm-6">
               실행중인 노드
               <p>
               <canvas id="myChartOne"></canvas>
               </div>
               <div class="col-sm-6">
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
               </div>
            </div>
            <div class="row">
               <div class="col-sm-12">
                  <canvas id="myChartTwo"></canvas>
                  <canvas id="myChartThree"></canvas>
                  <div id="jsGrid"></div>
<script>
      let myChartOne = document.getElementById('myChartOne').getContext('2d');
      let myChartTwo = document.getElementById('myChartTwo').getContext('2d');
      let myChartThree = document.getElementById('myChartThree').getContext(
            '2d');

      let barChart = new Chart(myChartOne, {
         type : 'pie', //pie, line, doughnut, polarArea
         data : {
            labels : [ '1번', '2번', '3번', '4번', '5번' ],
            datasets : [ {
               label : '테스트 데이터',
               data : [ 10, 100, 100, 200, 1000 ]
            } ]
         }
      });

      let barChartTwo = new Chart(myChartTwo, {
         type : 'bar', //pie, line, doughnut, polarArea
         data : {
            labels : [ '1번', '2번', '3번', '4번', '5번' ],
            datasets : [ {
               label : '테스트 데이터',
               data : [ 10, 100, 100, 200, 1000 ],
               backgroundColor : [ 'red', 'rgba(255, 255, 0, 0.5)',
                     '#990000', 'skyblue', 'dodgerblue' ],
               borderWidth : 5,
               borderColor : '#000',
               hoverBorderWidth : 10
            } ]
         }
      });

      let barChartThree = new Chart(myChartThree, {
         type : 'line', //pie, line, doughnut, polarArea
         data : {
            labels : [ '1번', '2번', '3번', '4번', '5번' ],
            datasets : [ {
               label : '테스트 데이터',
               data : [ 10, 100, 100, 200, 1000 ],
               backgroundColor : [ 'red', 'rgba(255, 255, 0, 0.5)',
                     '#990000', 'skyblue', 'dodgerblue' ],
               borderWidth : 5,
               borderColor : '#000',
               hoverBorderWidth : 10
            } ]
         }
      });
   </script>

                  <!-- jsGrid 실습 -->

                  <script>
      
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      var dataMap = '<c:out value='${dataMap}'/>'
      $(function() {

         $("#jsGrid").jsGrid({
            width : "100%",
            height : "400px",
            sorting : true, // 칼럼의 헤더를 눌렀을 때, 그 헤더를 통한 정렬 
            data : dataMap,

            fields : [ // 그리드 헤더 부분에 넣기 위해서 필드 지정 
            {
               name : "ID",
               type : "text",
               width : 100
            }, {
               name : "Name",
               type : "text",
               width : 100
            }, {
               name : "Email",
               type : "text",
               width : 200
            }

            ]
         })
      })

      var clients = [ {
         "ID" : "Otto Clay",
         "Name" : 25,
         "Email" : 1
      }

      ];
   </script>
               </div>
            </div>
         </div>

      </div>
   </div>


</body>

</html>
