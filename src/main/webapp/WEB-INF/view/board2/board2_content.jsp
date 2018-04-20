<%@page import="model.Board2VO"%>
<%@page import="dao.Board2DAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- content -->
<div class="w3-container bgimg-1" style="padding:64px 16px; " id="about">
  
  
<div class="w3-section w3-row-padding">
	<div class="w3-quarter">&nbsp;</div>

  <div class="w3-half w3-container ">
  <div class="w3-container w3-white">
      
       <h6>공지사항</h6>
      </div>
    <div class="w3-card-4">
      <div class="w3-container " style="overflow:auto; background: rgba(241, 241, 241, 0.75); ">
     
<div class="w3-container">
  <table class="w3-table  ">
  <tr>
				<th class=" w3-center" colspan="4" >${article.subject}</th>
			</tr>
  </table>
    <table class="w3-table ">
				<th width="25" align="center"><b><h7>글번호</h7></b></th>
				<th width="25" align="center">${article.num}</th>
				<th width="25" align="center"><b>조회수</b></th>
				<th width="25" align="center">${article.readcount}</th>
			
			
				<th width="25" align="center"><b>작성자</b></th>
				<th width="25" align="center">${article.writer}</th>
				<th width="25" align="center"><b>작성일</b></th>
				<th width="25" align="center">${article.regdate}</th>
			</tr>
			</table>
			<table class="w3-table w3-border">
			<c:if test="${article.filename!=null }">
			
				<td width="100%"  class="w3-center" colspan="4" style="padding: 10px; height:120px">
					
 				 
								<img
									src="../fileSave2/${article.filename}"
									class="w3-border w3-center"
									style="max-height:800%">
									<div>
									
									
									</div>
 				 
 				 	
				</td>
		
			<tr>
				<td width="100%" class="w3-left " colspan="4" style="height:230px; overflow: auto;">${aritcle.content}</td>
			</tr>
			</c:if>
			<c:if test="${board2.filename==null }">
			<tr>
				<td width="100%"  class="w3-left" colspan="4" style="height:350px; overflow: auto;"><pre>${article.content}</pre></td> 
			</tr>
			</c:if>
    
 
  	
  
  	
  </table>
  

<input type="button" value="글수정" onclick="document.location.href='<%=request.getContextPath()%>/board2/board2_update?num=${article.num}&pageNum=${pageNum}'">
			&nbsp;&nbsp;&nbsp;&nbsp;
			
			
<input type="button" value="글삭제" onclick="document.location.href='<%=request.getContextPath()%>/board2/board2_deletePro?num=${article.num}&pageNum=${pageNum}'">
			&nbsp;&nbsp;&nbsp;&nbsp;
</div>
</div>
</div>
</div>
</div>

</div>


 
</html>  