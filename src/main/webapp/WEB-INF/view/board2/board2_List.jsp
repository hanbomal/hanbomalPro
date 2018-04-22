<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.text.SimpleDateFormat"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- content -->
<div class="w3-container bgimg-1" style="padding:64px 16px; " id="about">
  
  
<div class="w3-section w3-row-padding">
   <div class="w3-quarter">&nbsp;</div>

  <div class="w3-half w3-container " id="content">
  <div class="w3-container w3-white">

   
      
       <h6>공지사항  (총 : ${count })개</h6>
       
      </div>
      
      
    <div class="w3-card-4">
      <div class="w3-container " style="overflow:auto; height:600px;  background: rgba(241, 241, 241, 0.75); ">
     
<div class="w3-container  w3-margin-top">
    <c:if test="${sessionScope.memberid eq 'admin'}">
    <button class="w3-button w3-padding-small w3-right w3-black w3-margin-bottom" 
  title="글쓰기" onclick="goWrite()">+</button>
    </c:if>
    
    <c:if test="${count==0 }">
			<div class="w3-center w3-padding-top">
			<table class="w3-table table-bordered w3-center" width="100%">
			<tr  >
			<td class="w3-center w3-padding"><br>
			<span class="w3-tag w3-white w3-border">저장된 글이 없습니다.</span><br><br></td>
			</tr>
			</table>
			</div>
		</c:if>
    
       	<c:if test="${count>0}">
       	<table class="w3-table  w3-centered" style="width: 100%; border:black; ">
		    <tr class="w3-black">
		      <th class="w3-center" width="50">번 호</th>
		      <th class="w3-center" width="250">제 목</th>
		      <th class="w3-center" width="100">작성자</th>
		      <th class="w3-center" width="150">작성일</th>
		    </tr>
    
     <c:forEach var="board2" items="${board2List}">
     <tr id="board2_List" class="w3-hover-white" onclick="goContent(${board2.num},${currentPage})">
      <td class="w3-center" width="50">${number}</td>
         <c:set var="number" value="${number-1}"/>
      <td>${board2.subject}</td>
      <td>${board2.writer}</td>
       <td>${board2.regdate}</td>
    </tr>
    </c:forEach>   
  </table>
     </c:if>
      
      
</div>


  <!-- Pagination -->

      <c:if test="${count>0 }">
       <div class="w3-center w3-padding-16">
    <div class="w3-bar">
         <c:if test="${startPage>bottomLine }">
            <a href="board2_List?pageNum=${startPage-bottomLine}" class="w3-bar-item w3-button w3-hover-black">«</a>            
            
         </c:if>
         
         <c:forEach var="i" begin="${startPage }" end="${endPage }">
      
               
               <!-- pageNum넘김 -->
               <c:if test="${i!=currentPage }">
                    <a href="board2_List?pageNum=${i }" class="w3-bar-item w3-button w3-hover-black">${i }</a>
               </c:if>
               <c:if test="${i==currentPage }">
                  <a href="board2_List?pageNum=${i }" class="w3-bar-item w3-button w3-hover-black">${i }</a>                
               </c:if>
         </c:forEach>
            
            <c:if test="${endPage<pageCount}">
         
               <a href="board2_List?pageNum=${startPage+bottomLine}"class="w3-bar-item w3-button w3-hover-black">»</a> 
            </c:if>

   </div>
   </div>
         </c:if>
         
</div>
      </div>
    </div>
 </div></div>

<script>
function goWrite(){
location.href="../board2/board2_Write";
}
function goContent(boardnum, currentpage){
var num=boardnum;
var pageNum=currentpage;
location.href="../board2/board2_content?num="+num+"&pageNum="+pageNum;
}

</script>
</html>


<!-- ----- -->

