
### WAS 폴더 구조
```
+---java\com\swcamp\moonwork
|      |   HomeController.java              // Login 관련 API 호출 컨트롤러
|      |   
|      +---controller   // 메뉴 별로 컨트롤러 구분
|      |       DashboardController.java     // Dashboard (대시보드 데이터 Read)
|      |       HostsContorller.java         // Host (호스트 정보 Read)
|      |       JobHistoryController.java    // JobHistory (Runs 데이터 Read)
|      |       JobListController.java       // JobList (Job CRUD, Cron 유효성검사)
|      |       UsersController.java         // User (User CRUD, ID 중복검사)
|      |       
|      \---model
|          \---dto      // 모델 정의
|              HostDTO.java
|              JobDetailDTO.java
|              JobDTO.java
|              RunsDTO.java
|              ScheduleDTO.java
|              UserDTO.java
|              WorkflowDTO.java
|                           
\---webapp
    +---resources
    |   +---css     // CSS 폴더
    |   |       dashboard.css       // CSS 변수 지정, 상단바, 사이드메뉴, 테이블 등 공통엘리먼트 CSS 속성 지정     
    |   |       home.css            // Login 화면 CSS
    |   |       jobdetails.css   
    |   |       joblist.css         // joblist 화면 CSS
    |   |       
    |   +---img     // IMG 폴더 (favicon..)
    |   |       all.png
    |   |       cancel-event.png
    |   |       cancel.png
    |   |       dark_mode.png
    |   |       detail.png
    |   |       failure.png
    |   |       moonwork_favicon.ico
    |   |       moonwork_logo.png
    |   |       new.png
    |   |       play.png
    |   |       plus.png
    |   |       success.png
    |   |       
    |   \---js     // JavaScript 폴더
    |           chartjs.js
    |           columnEvent.js
    |           dashboard.js    
    |           home.js
    |           jobhistory.js
    |           joblist.js
    |           jsgrid.js
    |           userEvent.js
    |           
    \---WEB-INF
        |   web.xml
        |   
        +---spring
        |   |   root-context.xml
        |   |   
        |   \---appServlet
        |           servlet-context.xml
        |           
        \---views   화면 폴더 (.jsp)
            |   home.jsp        // Login 화면, 시작페이지
            |   
            +---dashboard
            |       Dashboard.jsp       // 대시보드
            |       
            +---hosts
            |       Hosts.jsp           // 호스트 리스트
            |       
            +---jobhistory
            |       JobHistory.jsp      // 런 히스토리
            |       
            +---joblist
            |       JobDetails.jsp
            |       JobList.jsp         // 작업 리스트
            |       
            \---users
                    Users.jsp           // 
```
