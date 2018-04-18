<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../api/fullcalendar-3.9.0/lib/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- content -->
<div class="w3-container " style="height:600px; width:100%; overflow:auto;  ">
     
<div class="w3-container " style="width: 100%;">
 <!--  <div class="w3-card-2" style="margin-top:10px" > -->
 <div  id="content" style="height:100%;" >
     <font size=6>${boardType.boardname}</font>
  
     <br><br>
<div class="w3-container"><div class="w3-bar ">
  	<span >전체 글 : ${count }</span>
  <button class="w3-button w3-padding-small w3-right w3-black w3-margin-bottom" 
  title="글쓰기" onclick="$('#content').load('../board/writeForm?boardid=${boardType.boardid}&studynum=${boardType.studynum }')">+</button>
</div>
		<c:if test="${count==0 }">
			<table class="w3-table  w3-centered" style="width: 100%; border:black;">
			<tr class="w3-black">
			<td class="w3-center">게시판에 저장된 글이 없습니다.</td>
			</table>
		</c:if>

	<c:if test="${count!=0 }">
  <table class="w3-table  w3-centered" style="width: 100%; border:black;">
    <tr class="w3-black">
      <th class="w3-center" width="50">번 호</th>
      <th class="w3-center" width="250">제 목</th>
      <th class="w3-center" width="100">작성자</th>
      <th class="w3-center" width="150">작성일</th>
      <th class="w3-center" width="50">조 회</th>
    </tr>
		<!--  
		쓸수있는 el 
		studynum pageCount endPage bottomLine startPage currentPage articleList number count 
		
		articleList에 쓸수있는 변수
		num, studynum boardid writer subject ref re_step re_level reg_date readcount 등등
		-->
    <c:forEach var="article" items="${articleList}">
			<tr class="w3-hover-white" 
			onclick="$('#content').load('../board/content?num=${article.num}&pageNum=${currentPage }&boardid=${article.boardid}&studynum=${article.studynum }')">
			<td class="w3-center" width="50">${number}</td>
			<c:set var="number" value="${number-1}"/>
				<td width="250">
			<c:if test="${article.re_level>0}">	
					<img src="../imgs/level.gif" width="${5 *article.re_level}" height="16">
					<img src="../imgs/re.gif">
			</c:if>
			<c:if test="${article.re_level==0}">	
 					<img src="../imgs/level.gif" height="16"> 
 			</c:if>		
				${article.subject }
			<c:if test="${article.readcount>=20 }">
					<img src="../imgs/hot.gif" border="0" height="16"> 
			</c:if>	
				</td>
				<td class="w3-center" width="100">${article.writer}</td>
				<td class="w3-center" width="150">${article.reg_date}</td>
				<td class="w3-center" width="50">${article.readcount}</td>
			</tr>
	</c:forEach>
  </table>
  </c:if>
</div>


  <!-- Pagination -->
  <!-- 
    	<c:if test="${count>0 }">
			 <div class="w3-center w3-padding-16">
    <div class="w3-bar">
			<c:if test="${startPage>bottomLine }">
		
			<a onclick="$('#gallery').load('<%=request.getContextPath()%>/gallery/list?pageNum=${startPage-bottomLine}');" class="w3-bar-item w3-button w3-hover-black">«</a>
			</c:if>
			
	<c:forEach var="i" begin="${startPage }" end="${endPage}">
				<c:if test="${i!=currentPage }">  <a onclick="$('#gallery').load('<%=request.getContextPath()%>/gallery/list?pageNum=${i }');" class="w3-bar-item w3-button w3-hover-black">${i }</a>
				</c:if>
				<c:if test="${i==currentPage }">  <a onclick="$('#gallery').load('<%=request.getContextPath()%>/gallery/list?pageNum=${i }');" class="w3-bar-item w3-black w3-button">${i }</a>
				</c:if>
			</c:forEach>
			<c:if test="${endPage<pageCount }">
				
				<a onclick="$('#gallery').load('<%=request.getContextPath()%>/gallery/list?pageNum=${startPage+bottomLine}');" class="w3-bar-item w3-button w3-hover-black">»</a>
			</c:if>
			    </div>
  </div>
		</c:if>
  
   -->
  
  
  
  
  </div>
<!-- </div> -->


 </div>
 

      </div>
</html>