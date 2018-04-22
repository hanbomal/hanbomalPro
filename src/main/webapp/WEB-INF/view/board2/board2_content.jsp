
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<p class="w3-left"  style="padding-left:30px;"></p>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- content -->

<div class="w3-container bgimg-1" style="padding:64px 16px; " id="about;  ">
  		 	 
  		 	<div class="w3-container w3-center " style="width: 100%; margin: 0% auto;">
  		 	 <div  id="content" style="height:80%; margin: 0% 15%">
  		
 		  <br> 
	<div class="w3-container ">

		<table class="w3-table w3-card-2 w3-white w3-bordered " style="width: 80%; margin-left:10%">
			<tr>
				<th class="w3-black w3-center" colspan="4" >[공지사항]
				
			</tr>
			
			
			<tr height="30">
				<td width="25" align="center"><b>제목</b></td>
				<td width="25" align="center">${article.subject}</td>
	 	<td width="25" align="center"><b>글번호</b></td>
				<td width="25" align="center">${article.num}</td>
			</tr>
			
			<tr height="30">
			
			
				<td width="25" align="center"><b>작성자</b></td>
				<td width="25" align="center">${article.writer}</td>
				<td width="25" align="center"><b>작성일</b></td>
				<td width="25" align="center">${article.regdate}</td>
			</tr>
			
			
			<c:if test="${article.filename!=null }">
			<tr height="30">
				<td width="100%"  class="w3-center" colspan="4" style="padding: 10px; height:120px">
					<div>
					 <div class="w3-dropdown-click w3-left">
   				
   				
   			
 				 </div>
								<img
									src="../fileSave2/${article.filename}"
									class="w3-border w3-center"
									style="max-height:400px;">
 				 	</div>
				</td>
			</tr>
			
			<tr height="50">
				<td width="100%"  class="w3-center" colspan="4" style="padding: 10px; height:120px">
					<div class="w3-center">
					 <div class="w3-dropdown-click w3-left">
   				 ${article.content }
   			
 				 </div>
 				 	
				</td>
			</tr>
			

			
			</c:if>
			
			<c:if test="${article.filename==null }">
			
			<tr height="100">
				<td width="60%"  class="w3-center" colspan="4" style="padding: 50px; height:120px">
				
					 <div class="w3-dropdown-click w3-left">
   			
   		
   				<pre>${article.content }</pre>
   			
 				 </div>
						
 				 	
				</td>
			</tr>
			
		
			

			
			
			</c:if>
			
		
			</table> 
		<div class="w3-center w3-padding-16">
		<c:if test="${sessionScope.memberid eq 'admin'}">
		<input class="w3-button w3-black" type="button" value="글수정 "    onclick="document.location.href=
 'board2_update?num=${article.num}&pageNum=${pageNum}'">
		
		
		<input class="w3-button w3-black" type="button" value="글삭제"
		  onclick="document.location.href=
 'board2_deletePro?num=${article.num}'">
		</c:if>
		<input class="w3-button w3-black" type="button" value="글목록"
		onclick="document.location.href='board2_List?pageNum=${pageNum}'">
		
	
		</div>
	</div> 
	
	
  		
  		
  		
   </div>
   </div>
      </div>

	


</html>