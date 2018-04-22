<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<html>
<head>
<title>게시판</title>
</head>


<p class="w3-left"  style="padding-left:30px;"></p>
	<div class="w3-quarter">&nbsp;</div>


<!-- arrow_back -->

<div class="w3-container bgimg-1" style="padding:64px 16px; " id="about">
<div class="w3-container w3-center " style="width: 100%; margin: 0% auto;">

    <div  id="content" style="height:80%; margin: 0% 15%;" >
                 
  

      
    
 <div class="w3-container w3-margin-top w3-padding-32">
      <form id="uploadform" method="post" name="writeform" enctype="multipart/form-data" action="<%=request.getContextPath()%>/board2/board2_WritePro">
              <input type="hidden" name="writer" value="${memberid}">
                 <input  type="hidden"   name="num" value="${num}">
<input  type="hidden"   name="ref" value="${ref}">
<input  type="hidden"   name="re_level" value="${re_level}">
<input  type="hidden"   name="re_step" value="${re_step}">
<input  type="hidden"   name="pageNum" value="${pageNum}">
             
       
           
      <table class="w3-table w3-card-2 w3-white w3-bordered " style="width: 80%;margin-left:10% ">
         <tr>
               <c:if test="${num==0 }">
                  <th class="w3-black w3-center" colspan="2" >[글쓰기]</th>
               </c:if>
               <c:if test="${num!=0 }">
                  <th class="w3-black w3-center" colspan="2" >[답글쓰기]</th>
               </c:if>
         </tr>
            <tr>
               <th  width="10%" class=" w3-center">제 목</th>
               <td width="90%">
               
               <c:if test="${num==0}">
                  <input type="text" size="40" maxlength="50" 
                  name="subject" required="required" class="w3-input w3-border-0 w3-hover-light-grey">
               </c:if>
               <c:if test="${num!=0}">
                  <input type="text" size="40" maxlength="50" value="[답글] "
                  name="subject" required="required" class="w3-input w3-border-0 w3-hover-light-grey">
               </c:if>
               
                  
                  
               </td>
            </tr>
            <tr>
               <th  width="10%" class=" w3-center">내 용</th>
               <td width="90%"><textarea name="content" rows="15" cols="40"
               class="w3-input w3-border-0 w3-hover-light-grey" required="required"
               ></textarea>
               </td>
            </tr>
            <tr>
               <td colspan=2 align="center">
                <input type="file" name="uploadfile" id="uploadfile">
               </td>
            </tr>
         </table>
            <div class="w3-center w3-padding-16">
            
         <input type="button" value="목록보기" class="w3-black  w3-button" 
               onclick="document.location.href='board2_List?pageNum=${pageNum}'">
               <button type="submit" onclick="upload()" class=" w3-button w3-black">
               <i class="fa fa-check"></i>확인</button>
               
               <input type="reset" value="다시작성"
               class=" w3-black  w3-button ">
               
         </div>
      </form> 
   </div>  
   
</div></div></div>


</html>