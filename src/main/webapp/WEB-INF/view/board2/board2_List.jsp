<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.text.SimpleDateFormat"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"></head>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- content -->
<div class="w3-container bgimg-1" style="padding:64px 16px; " id="about">
  
  
<div class="w3-section w3-row-padding">
	<div class="w3-quarter">&nbsp;</div>

  <div class="w3-half w3-container ">
  <div class="w3-container w3-white">

	
      
       <h6>공지사항  (총 : ${count })개</h6>
       
      </div>
      
      
    <div class="w3-card-4">
      <div class="w3-container " style="overflow:auto; background: rgba(241, 241, 241, 0.75); ">
     
<div class="w3-container  w3-margin-top">
    <table class="w3-table  w3-centered" style="width: 100%; border:black;">
    <button class="w3-button w3-padding-small w3-right w3-black w3-margin-bottom" 
  title="글쓰기" onclick="document.location.href='<%=request.getContextPath()%>/board2/board2_Write'">+</button>
    
    <tr class="w3-black">
      <th class="w3-center" width="50">번 호</th>
      <th class="w3-center" width="250">제 목</th>
      <th class="w3-center" width="100">작성자</th>
      <th class="w3-center" width="150">작성일</th>
      <th class="w3-center" width="50">조 회</th>
    </tr>
    
 
  	
  	
  	<c:forEach var="board2" items="${board2List}">
     <tr id="board2_List" class="w3-hover-white">
      <td class="w3-center" width="50">${board2.num}</td>
      <td> <a href="<%=request.getContextPath()%>/board2/board2_content?num=${board2.num}&pageNum=${currentPage}">
      ${board2.subject}</a></td>
        <c:if test="board2.readconut>=20">
                	<img src="../img/hot.gif" border="0" height="16">
                </c:if></td>
      <td>${board2.writer}</td>
       <td>${board2.regdate}</td>
        <td>${board2.readcount}</td>
      
         
  
     
     
    </tr>
    </c:forEach>	
  	
  </table>
  <p class="w3-right w3-padding-right-large">
		
		
</div>


  <!-- Pagination -->
 <div class="w3-center">
		<c:if test="${count>0 }">
			<c:if test="${startPage>bottomLine }">
				<a href="board2_List?pageNum=${startPage-bottomLine}">[이전]</a>				
				
			</c:if>
			
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
		
					<a href="board2_List?pageNum=${i}">
					<!-- pageNum넘김 -->
					<c:if test="${i!=currentPage }">
							[${i}]
					</c:if>
					<c:if test="${i==currentPage }">
						<font color='black'>[${i}]</font>						
					</c:if>
					</a>			
			</c:forEach>
				
				<c:if test="${endPage<pageCount}">
			
					<a href="board2_List?pageNum=${startPage+bottomLine}">[다음]</a>	
				</c:if>

	
			</c:if>
			
</div>
      </div>
    </div>
  </div>
  
  
</div>
</div>
</html>