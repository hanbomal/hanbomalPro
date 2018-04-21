<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<html> 
<head>
<title>게시판</title>
</head>
<style>
 body{
 margin : 0 auto;}
</style>
<p class="w3-left"  style="padding-left:30px;"></p>
<div class="w3-container bgimg-1" style="padding:64px 16px; " id="about;  ">
  
<div class="w3-section w3-row-padding; overflow:auto;">
	<div class="w3-quarter">&nbsp;</div>



<br>
<form method="post" name="board2_Write"  enctype="multipart/form-data"  action="<%=request.getContextPath()%>/board2/board2_WritePro" >

<input  type="hidden"   name="num" value="${num}">
<input  type="hidden"   name="ref" value="${ref}">
<input  type="hidden"   name="re_level" value="${re_level}">
<input  type="hidden"   name="re_step" value="${re_step}">
<input  type="hidden"   name="pageNum" value="${pageNum}">
<input  type="hidden"   name="writer" value="${sessionScope.memberid}">


	<div style="margin-top:10px">
		<table class="w3-table w3-card-2 w3-white w3-bordered " style="width: 60%;">
   <tr>
    <td align="right" colspan="2" >
       <a href="board2_List"> 글목록</a> 
   </td>
   </tr>
  
  <tr>
    <td  width="70"   align="center" >제 목
    </td>
    <td width="330">
   <c:if test="${num==0}">
   <input type="text" size="40" maxlength="50" name="subject">
     </c:if>
   <c:if test="${num!=0}">  
  <input type="text" size="40" maxlength="50" name="subject"
       value="[답글]"
       > </c:if>
   
   
   </td>
  </tr>
  
  <tr>
    <td  width="70"   align="center" >내 용</td>
    <td  width="330" >
     <textarea name="content" rows="13" cols="40"></textarea> </td>
  </tr>
  
     <tr>
    <td  width="70"   align="center">file</td>
    <td  width="330">
       <input type="file" size="40" maxlength="30" 
       name="uploadfile" >
       </td>
  </tr>
<tr>      
 <td colspan=2  align="center"> 
  <input type="submit" value="글쓰기" >  
  <input type="reset" value="다시작성">
  <input type="button" value="목록보기" OnClick="window.location='../board2/board2_List'">
</td></tr>   
     
</form> 


</table> 

</body>
 </div> 
</html>      