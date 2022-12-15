<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
</head>
<body>
    <h1>Hello Spring!</h1>
    <p>
 	   <!-- ${pageContext.request.contextPath}: Context root(springMVC)가 들어감 -->
 	   <a href="${pageContext.request.contextPath}/member/list">Show members</a>
    </p>
</body>
</html>  