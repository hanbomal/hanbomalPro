<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="dao.MemberDAO"%>
<%@page import="model.MemberVO"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>ID CHECK</title>
</head>
<body>

<c:if test="${result}">
 

 
<body>
   <div class="w3-container w3-black w3-center w3-round" style="height: 350px;">
      <div class="w3-container w3-white w3-round" style="padding: 4%; margin: 50px 0% 0% 0%;">
         <span>이미 사용중인 ID 입니다.</span>
         
         <a href="#" onclick = "opener.document.memberInfo.memberid.focus(); window.close();">닫기</a>


      </div>
   </div>
</c:if>   
 <c:if test="${!result}"><%-- <% } else { %> --%>
   <div class="w3-container w3-black w3-center w3-round" style="height: 350px;">
      <div class="w3-container w3-white w3-round" style="padding: 4%; margin: 50px 0% 0% 0%;">
         <span><b>${memberid}</b>은 사용하실 수 있는 ID 입니다.</span>
         <a href="#" onclick = "opener.document.memberInfo.nickname.focus(); window.close();">닫기</a>
      </div>
   </div>
</c:if><%-- <% } %> --%>
</body>
</html>