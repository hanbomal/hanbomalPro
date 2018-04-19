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
		<table class="w3-table w3-card-2 w3-white w3-bordered " style="width: 100%;">
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
			<c:if test="${article.filename!=null }">
			<tr height="30">
				<td width="100%"  class="w3-center" colspan="4" style="padding: 10px; height:120px">
					<div>
					 <div class="w3-dropdown-click w3-left">
   				 <button onclick="myFunction()" class="w3-button" style="padding:2px"><i class="fa fa-list" style="font-size:29px"></i></button>
   					 <div id="Demo" class="w3-dropdown-content w3-border" style="z-index:9999">
					      <div class="w3-container">Link 1</div>
					      <div class="w3-container">Link 2</div>
					      <div class="w3-container">Link 3</div>
   					 </div>
 				 </div>
								<img
									src="../fileSave/${article.filename}"
									class="w3-border w3-center"
									style="height: 100px; width: 100px;margin-left:-5%">
 				 	</div>
				</td>
			</tr>
			<tr>
				<td width="100%" class="w3-left" colspan="4" style="height:230px">:&nbsp;${article.content}</td>
			</tr>
			</c:if>
			<c:if test="${article.filename==null }">
			<tr>
				<td width="100%" class="w3-left" colspan="4" style="height:350px">:&nbsp;${article.content}</td>
			</tr>
			</c:if>
		</table>  
		<div class="w3-center w3-padding-16">
		<input class="w3-button w3-black" type="button" value="글수정" 
		onclick="$('#content').load('../board/updateForm?num=${article.num}&pageNum=${pageNum}&studynum=${article.studynum}&boardid=${article.boardid}')">
	
		<input class="w3-button w3-black" type="button" value="글삭제"
		onclick="reqDelete()">
		
		<input class="w3-button w3-black" type="button" value="글목록"
		onclick="$('#content').load('../board/study_board?pageNum=${pageNum}&studynum=${article.studynum}&boardid=${article.boardid}')">
		
		<input class="w3-button w3-black" type="button" value="답글쓰기"
		onclick="$('#content').load('../board/writeForm?num=${num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}&pageNum=${pageNum}&boardid=${article.boardid }&studynum=${article.studynum }')">
		</div>
	</div> 
	
	<div class="w3-half" style="margin-top:10px">
	
		<div class=" w3-border w3-padding" style="margin-left:5%;width:90%">
  			<input class="w3-border" style="width:85%;height:40px;"/>
  			<button class="w3-button  w3-teal" style="height:40px;margin-top:-5px"type="submit" >댓글</button>
  		</div>
  		
  		<div class="w3-container w3-card w3-light grey w3-bordered " style="margin-left:5%;height:400px; width:90%;padding-top:5px">
  			 <table  style="width: 100%; ">
  			 	<tr>
  			 	<td>
  			 			<img src="../imgs/profile.png "class="w3-center" style="width:25px;height:25px">
  			 		<font size="4"><b>gon</b></font> <font color="grey" size="2">2018.04.19.</font></td>
  			 	</tr>
  			 	<tr >
  			 		<td colspan="2" style="padding-bottom:2px">게시판 별거 아닌거 같으면서도 시간이 오래걸리네 
  			 		 </td>
  			 	</tr>
  			 	
  			 		<tr>
  			 	<td>
  			 			<img src="../imgs/profile.png "class="w3-center" style="width:25px;height:25px">
  			 		<font size="4"><b>jihye</b></font> <font color="grey" size="2">2018.04.19.</font></td>
  			 	</tr>
  			 	<tr >
  			 		<td colspan="2">배고프다
  			 		 </td>
  			 	</tr>
  			 	
  			 		<tr>
  			 	<td>
  			 			<img src="../imgs/profile.png "class="w3-center" style="width:25px;height:25px">
  			 		<font size="4"><b>hyeji</b></font> <font color="grey" size="2">2018.04.19.</font></td>
  			 	</tr>
  			 	<tr >
  			 		<td colspan="2">달빛이 비치는 곳 그곳으로 향할래 
  			 		 </td>
  			 	</tr>
  			 	
  			 </table>
  		</div> 
  		
	</div>
   </div>
      </div>
	 <!-- 
		쓸수있는 el: boardType// article, num , pageNum
  		 	 article은 BoardVO 
  		BoardVO에서 쓸수있는 변수 num, studynum, boardid, writer, subject, ref, re_step,
  		 	 re_level, reg_date, readcount, content, 등등
  		 	  
  		 	  
  		 	  document.location.href='deleteForm?num=${article.num}&pageNum=${article.num}'
  		 	  
  		 	  -->
	<script>
	  function reqDelete()
	    {	
		  if(confirm("삭제하시겠습니까?")==true){
			  $('#content').load('../board/deletePro?num=${article.num}&boardid=${article.boardid}&studynum=${article.studynum}');
		  }else{
			  return;
		  }
		  
	    }
	  
	  function myFunction() {
		    var x = document.getElementById("Demo");
		    if (x.className.indexOf("w3-show") == -1) {
		        x.className += " w3-show";
		    } else { 
		        x.className = x.className.replace(" w3-show", "");
		    }
		}
	</script>



</html>