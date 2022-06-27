<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="get" action="<%=request.getContextPath()%>/login_test.do">
	
		<input name="mem_id" >
		<input type="password" name="mem_pwd">
		
		<input type="submit" value="로그인">
		
	</form>

</body>
</html>