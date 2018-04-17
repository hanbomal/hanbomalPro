<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 
 
 <c:if test="${chk==1}">
      <script language="JavaScript"> 
  
 </script>
       <meta http-equiv="Refresh" 
    	  content="0;url=member_update" >
 
</c:if>
<c:if test="${chk!=1}">
       <script language="JavaScript">      
         alert("비밀번호가 맞지 않습니다");
         history.go(-1);
       </script>
</c:if>
       