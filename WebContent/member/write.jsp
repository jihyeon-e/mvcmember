<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.bean.MemberDTO" %>
<%@ page import="member.dao.MemberDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(su==1){ %>
	회원가입 성공!!<br><br>
	<input type="button" value="로그인" onclick="location.href='loginForm.jsp'">
	
<%}else{ %>	
	회원가입 실패!!
<%} %>	
</body>
</html>