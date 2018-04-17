<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="dao.MemberDAO"%>
<%@page import="model.MemberVO"%>  
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
        
      <c:if test="${chk==1}">
      <script language="JavaScript"> 
 alert("GOOD BYE :-D");
 </script>
 <c:remove var="memberid" scope="session"/>
  <meta http-equiv="Refresh" 
content="0;url=../page/main" >
</c:if>
<c:if test="${chk!=1}">
       <script language="JavaScript">      
         alert("비밀번호가 맞지 않습니다");
         history.go(-1);
       </script>
</c:if>
       