<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import ="member.bean.MemberDTO" %>
<%@ page import ="member.dao.MemberDAO"%>

<%

//데이터
String id = (String)session.getAttribute("memId");
// String id = 세션으로부터 id를 얻어오기

//DB
MemberDAO memberDAO = MemberDAO.getInstance();
MemberDTO memberDTO = memberDAO.getMember(id);
System.out.println(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}
</style>
</head>

<body>
<h3>회원정보수정</h3>
<form name="modifyForm" method="post" action="modify.jsp">
		
 <table border="1" cellpadding="5" cellspacing="0">
 <!-- border는 선 갯수, cellpadding은 간격, cellspacing은 선과 선사이의 간격 -->
 
  <tr>
   <td align="center" width="100">이름</td>
   <td>
    <input type="text" name="name" value = "<%=memberDTO.getName()%>">
    <div id="nameDiv"></div>
   </td>
  </tr>
 
  <tr>
   <td align="center">아이디</td>
   <td>
   <% %>
    <input type="text" name="id" value = "<%=id%>" readonly>
    <input type="button"  id='btn1' value='중복체크' disabled='true'
                                    onclick="setDisable('btn1')"/><br>
   </td>
  </tr>
  
  <tr>
   <td align="center">비밀번호</td>
   <td>
    <input type="password" name="pwd">
   </td>
  </tr>
 
  <tr>
   <td align="center">재확인</td>
   <td>
    <input type="password" name="repwd">
   </td>
  </tr>
 
  <tr>
   <td align="center">성별</td>
   <td>
    <input type="radio" name="gender" value="0" checked="checked">남
    <input type="radio" name="gender" value="1">여
   </td>
  </tr>
 
  <tr>
   <td align="center">이메일</td>
  	  	<td>
  	  		<input type="text" name="email1" value="<%=memberDTO.getEmail1()%>">@
  	  		<input type="email" list="email2" name="email2" value="<%=memberDTO.getEmail2()%>">
	 		<datalist id="email2">
	 			<option value="gmail.com">
	 			<option value="hanmail.net">
	 			<option value="naver.com">
	 		</datalist>
  	  	</td>
  	  </tr>
  	  
  	  
  <tr>
 	<td align="center">핸드폰</td>
 	<td>
 		<select name="tel1" id="tel1" style="width:70px;">
 			<option value="010">010</option>
 			<option value="011">011</option>
 			<option value="019">019</option>
 		</select>-
 		<input type="text" name="tel2" size="5" value="<%=memberDTO.getTel2()%>">-
 		<input type="text" name="tel3" size="5" value="<%=memberDTO.getTel3()%>">
 	</td>
 </tr>
 
 
 <tr>
 	<td align="center">주소</td>
 	<td>
 		<input type="text" name="zipcode" id="zipcode" value="<%=memberDTO.getZipcode()%>" readonly>
    <input type="button" value="우편번호검색" onclick="checkPost()"><br>
    <input type="text" name="addr1" id="addr1" placeholder="주소" size="50" value="<%=memberDTO.getAddr1()%>" readonly><br>
    <input type="text" name="addr2" id="addr2" placeholder="상세주소" value="<%=memberDTO.getAddr2()%>" size="50">
 	</td>
 </tr>
 
 
 <tr>
 	<td colspan="2" align="center">
 		<input type="button" value="회원정보수정" onclick="javascript:checkModify()">
 		<input type="reset" value="다시작성" onclick="location.reload()">
 	</td>
 </tr>
</table>
 </form>
 <script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
window.onload = function() {
	//document.modifyForm.gender[1].checked = true; // 0은 남자 1은여자로 들어감
	document.modifyForm.gender["<%=memberDTO.getGender()%>"].checked = true;
	document.modifyForm.email2.value = "<%=memberDTO.getEmail2()%>";
	document.modifyForm.tel1.value = "<%=memberDTO.getTel1()%>";
}

</script>
</script>
 <script type="text/javascript">
 function checkModify(){
	document.getElementById("nameDiv").innerText = "";
	
	if(document.modifyForm.name.value=="") 
		document.getElementById("nameDiv").innerText = "이름을 입력하세요";
	else if(document.modifyForm.pwd.value=="")
		alert("비밀번호를 입력하세요");
	else if(document.modifyForm.pwd.value != document.modifyForm.repwd.value)
		alert("비밀번호가 맞지 않습니다");
	else
		document.modifyForm.submit();
 }
 </script>
</body>
</html>


 <!--
 	  var gender = document.getElementsByName("gender");
     for(var i=0; i<gender.length; i++) {
   	  if(gender[i].value === "<%=memberDTO.getGender()%>") {
 	  		gender[i].checked = true;
   	  }
     }
     
     var email2 = document.getElementById("email2").options;
     for(var i=0; i<email2.length; i++) {
   	  if(email2[i].value === "<%=memberDTO.getEmail2()%>") {
   		  email2[i].selected = true;
   	  }
     }
 		
  var tel1 = document.getElementById("tel1");
  for(var i=0; i<tel1.length; i++) {
	  if(tel1[i].value === "<%=memberDTO.getTel1()%>") {
		  tel1[i].selected = true;
	 }
  }
}
-->