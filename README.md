+---java
|   \---com
|       \---swcamp
|           \---moonwork
|               |   HomeController.java
|               |   
|               +---controller
|               |       DashboardController.java
|               |       HostsContorller.java
|               |       JobHistoryController.java
|               |       JobListController.java
|               |       UsersController.java
|               |       
|               \---model
|                   \---dto
|                           HostDTO.java
|                           JobDetailDTO.java
|                           JobDTO.java
|                           RunsDTO.java
|                           ScheduleDTO.java
|                           UserDTO.java
|                           WorkflowDTO.java
|                           
+---resources
|       log4j.xml
|       mybatis-config.xml
|       
\---webapp
    +---resources
    |   +---css
    |   |       dashboard.css
    |   |       home.css
    |   |       jobdetails.css
    |   |       joblist.css
    |   |       
    |   +---img
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
    |   \---js
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
        \---views
            |   home.jsp
            |   
            +---dashboard
            |       Dashboard.jsp
            |       
            +---hosts
            |       Hosts.jsp
            |       
            +---jobhistory
            |       JobHistory.jsp
            |       
            +---joblist
            |       JobDetails.jsp
            |       JobList.jsp
            |       
            \---users
                    Users.jsp
