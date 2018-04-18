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
  		 	 <div  id="content" style="height:100%;" >
  		  <font size=6>${boardType.boardname}</font>
 		  <br> 
	<div class="w3-half" style="margin-top:10px">
		<table class="w3-table w3-card-2 w3-white w3-bordered " style="width: 95%;">
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
				<td width="100%" class="w3-center" colspan="4" style="padding: 10px; height:350px">
					<c:if test="${article.filename!=null }">
								<img
									src="<%=request.getContextPath()%>/fileSave/${article.filename}"
									class="w3-border w3-center"
									style="height: 100px; width: 100px">
					</c:if>
				<pre class="w3-left">${article.content}</pre></td>
			</tr>
			
		</table> 
		<div class="w3-center w3-padding-16">
		<input class="w3-button w3-black" type="button" value="글수정" 
		onclick="document.location.href='updateForm?num=${article.num}&pageNum=${pageNum}'">
	
		<input class="w3-button w3-black" type="button" value="글삭제"
		onclick="document.location.href='deleteForm?num=${article.num}&pageNum=${article.num}'">
		
		<input class="w3-button w3-black" type="button" value="글목록"
		onclick="$('#content').load('<%=request.getContextPath()%>/board/study_board?pageNum=${pageNum}&studynum=${article.studynum}&boardid=${article.boardid}')">
		
		<input class="w3-button w3-black" type="button" value="답글쓰기"
		onclick="$('#content').load('<%=request.getContextPath()%>/board/writeForm?num=${num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}&pageNum=${pageNum}')">
		</div>
	</div> 
	
	<div class="w3-half" style="margin-top:10px">
  <input class="w3-border" style="width:85%;height:40px;margin-left:-15px"/>
  	<button class="w3-button  w3-teal" style="height:40px;margin-top:-5px"type="submit" >댓글</button>
  	</div>
	
   </div>
      </div>
	 <!-- 
		쓸수있는 el: boardType// article, num , pageNum
  		 	 article은 BoardVO 
  		BoardVO에서 쓸수있는 변수 num, studynum, boardid, writer, subject, ref, re_step,
  		 	 re_level, reg_date, readcount, content, 등등
  		 	  -->




</html>