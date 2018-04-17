<%@page import="model.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="../api/fullcalendar-3.9.0/lib/jquery.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- content -->

<div class="w3-container " style="height:600px; overflow:auto; ">
	<div class="w3-container " style="width: 100%;">
  		<!-- <div class="w3-card-2" style="margin-top:10px" > -->
  		 	 <div  id="content" style="height:100%;" >
  		 
  		  <font size=6>${boardType.boardname}</font>
      <%--     <c:if test="${boardType.chkprivate==1}">
          |비공개 게시판</c:if>
  		  <c:if test="${boardType.chkprivate!=1}">
  		  |공개 게시판
 		  </c:if> --%>
 		  <br> 
	<div class="w3-container" style="margin-top:10px">
		<table class="w3-table w3-card-2 w3-white w3-bordered " style="width: 90%;margin-left:5%">
			<tr>
				<th class="w3-black w3-center" colspan="4" >제목: [${article.subject}]</th>
			</tr>
			<tr height="30">
				<th width="25%" align="center">글번호</th>
				<td width="25%" align="center">${article.num}</td>
				<th width="25%" align="center">조회수</th>
				<td width="25%" align="center">${article.readcount}</td>
			</tr>
			<tr height="30">
				<th width="25%" align="center">작성자</th>
				<td width="25%" align="center">${article.writer}</td>
				<th width="25%" align="center">작성일</th>
				<td width="25%" align="center">${article.reg_date}</td>
			</tr>
			<tr height="30">
				<td width="100%" align="left" colspan="4" style="padding: 50px;"><pre>${article.content}</pre></td>
			</tr>
			
		</table> 
		<div class="w3-center w3-padding-16">
		<input class="w3-button w3-black" type="button" value="글수정" 
		onclick="document.location.href='updateForm?num=${article.num}&pageNum=${pageNum}'">
	
		<input class="w3-button w3-black" type="button" value="글삭제"
		onclick="document.location.href='deleteForm?num=${article.num}&pageNum=${article.num}'">
		
		<input class="w3-button w3-black" type="button" value="글목록"
		onclick="$('#content').load('<%=request.getContextPath()%>/board/study_board')">
		<!-- 글목록 넘어갈때 pagenum 보내줘야함 -->
		</div>
	</div> 
  		 	   
  		 	 
  		 	 
  		 	 </div>
  	<!-- 	</div> -->
    </div>




      </div>

	<%-- <br>
	<br>
	<b>글내용 보기</b>
	<div class="container">
		<table class="w3-table-all" style="width: 80%;">
			<tr height="30">
				<td width="125" align="center">글번호</td>
				<td width="125" align="center">${article.num}</td>
				<td width="125">조회수</td>
				<td width="125" align="center">${article.readcount}</td>
			</tr>
			<tr height="30">
				<td width="125">작성자</td>
				<td width="125" align="center">${article.writer}</td>
				<td width="125" align="center">작성일</td>
				<td align="center" width="125" align="center">${article.reg_date}</td>
			</tr>
			<tr height="30">
				<td align="center" width="125">글제목</td>
				<td align="center" width="375" colspan="3">${article.subject}</td>
			</tr>
			<tr height="30">
				<td align="center" width="125">글내용</td>
				<td align="left" width="375" colspan="3"><pre>${article.content}</pre></td>
			</tr>
			<tr height="30">
				<td colspan="4" class="w3-center"><input type="button"
					value="글수정"
					onclick="document.location.href='updateForm?num=${article.num}&pageNum=${pageNum}'">
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="글삭제"
					onclick="document.location.href='deleteForm?num=${article.num}&pageNum=${article.num}'">
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="답글쓰기"
					onclick="document.location.href='writeForm?num=${num}&ref=${ref}&re_step=${re_step}&re_level=${re_level}&pageNum=${pageNum}'">
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="글목록"
					onclick="document.location.href='list?pageNum=${pageNum}'">
				</td>
			</tr>
		</table>
	</div> --%>





</html>