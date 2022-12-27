<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsgrid</title>
</head>
<body>
<div> 

<c:forEach items="${data }" var="list" >

<div>${list}</div>

</c:forEach> 

</div>
</body>
</html>