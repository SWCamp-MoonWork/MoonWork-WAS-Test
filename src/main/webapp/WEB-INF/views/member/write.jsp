<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>
</head>
<body>
	<h1>회원 등록</h1>
	<form name="form1" method="post"
		action="${pageContext.request.contextPath}/member/insert">
		<table border="1" width="460px">
			<tr>
				<th>ID</th>
				<td><input name="id"></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input name="password" type="password"></td>
			</tr>
			<tr>
				<th>Name</th>
				<td><input name="name"></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input name="email" type="email"></td>
			</tr>
			<tr>
				<th>Birth</th>
				<td><input name="birth" type="date"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="등록">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
