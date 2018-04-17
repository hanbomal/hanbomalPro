<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.MemberDAO"%>
<%@page import="model.MemberVO"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

  
<html>
 <c:if test="${chk==1}">
  
      
 

       

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- content -->
<div class="w3-container bgimg-1" style="padding:64px 16px;">
  
  
<div class="w3-section w3-row-padding">
	<div class="w3-third">&nbsp;</div>

  <div class="w3-third w3-container ">
  <div class="w3-container w3-light-gray">
      
       <h6>PASSWORD IS...</h6>
      </div>
    <div class="w3-card-4">
      <div class="w3-container " style="overflow:auto; background: rgba(241, 241, 241, 0.75); ">
     
<div class="w3-container">
  <table class="w3-table w3-center ">
    <form name="memberpasswd" class="w3-container w3-card-4 w3-white w3-text-black w3-margin w3-animate-bottom w3-round" >



<h5 class="w3-center">${memberid} 님의 비밀번호는 ..</h5>

<div class="w3-row w3-section">
  
 


<div class="w3-row w3-section">
  
    <div class="w3-rest ">
  PASSWORD    <input class="w3-input w3-border w3-light-grey " style="width:300px; display: inline-block,center;" name="passwd"  readonly="readonly" type="text" value="${member.passwd }"  >
    </div>
</div>




<p class="w3-center">



<input type="button" value="MAIN" class="w3-button w3-gray" OnClick="window.location='../page/main'">  
</p>

</form>

  </table>
</div>


 
      </div>
    </div>
  </div>
  
  
</div>
</div>
</html>
</c:if>
<c:if test="${chk!=1}">
       <script language="JavaScript">      
         alert("아이디가없거나 힌트와 비밀번호가 맞지 않습니다 :-)");
         history.go(-1);
       </script>
</c:if>


