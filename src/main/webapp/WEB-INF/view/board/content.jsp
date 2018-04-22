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
<script >
$(document).ready(function(){   
	$('#comment').load('../board/CommentBox?studynum=${article.studynum}&boardid=${article.boardid }&num=${num}'); 
	});
</script>

<div class="w3-container " style="height:600px; overflow:auto; ">
  		 	 
  		 	 <div class="w3-container">
  		 	 <div  id="content" style="height:100%;" >
  		  <h4>${boardType.boardname}</h4>
 		  <br> 
	<div  class="w3-container w3-margin-top w3-center w3-margin-left w3-margin-right">
<!-- =======
	<div style="margin-top:10px;margin-bottom:10px">
>>>>>>> branch 'master' of https://github.com/hanbomal/hanbomalPro.git -->
		<table class="w3-table w3-card-2 w3-white w3-bordered " style="width: 100%;">
			<tr>
				<th class="w3-black" colspan="4" >제목: [${article.subject}]
				<button class="w3-black w3-button w3-right w3-padding-small" onclick="boardToChat(${article.num},'<c:out value="${memberid }"/>');">채팅방으로 다시 보내기</button></th>
			</tr>
			
			
			<tr height="30">
				<td width="25" align="center"><b>글번호</b></td>
				<td width="25" align="center">${article.num}</td>
				<td width="25" align="center"><b>조회수</b></td>
				<td width="25" align="center">${article.readcount}</td>
			</tr>
			
			<tr height="30">
				<td width="25" align="center"><b>작성자</b></td>
				<td width="25" align="center">${article.writer}</td>
				<td width="25" align="center"><b>작성일</b></td>
				<td width="25" align="center">${article.reg_date}</td>
			</tr>
			
			
			<c:if test="${article.filename!=null }">
			<tr height="30">
				<td width="100%"  class="w3-center" colspan="4" style="padding: 10px; height:120px">
					<div>
					 <div class="w3-dropdown-click w3-left">
   				 <button onclick="myFunction()" class="w3-button" style="padding:2px">
   				
   				<!-- checkList -->
   				<i class="fa fa-eye" style="font-size:32px"></i>
   				 
   				 </button>
   					 <div id="Demo" class="w3-dropdown-content w3-border" style="z-index:99">
   					    <div class="w3-container w3-black w3-padding-small">읽은 사람(총:${readerList.size()}명)</div>
   					  <c:forEach var="List" items="${readerList}">
					      <div class="w3-container w3-padding-small">
					      <i class="fa fa-check"></i>${List.reader }(${List.readerposition })
					      </div>
   					  </c:forEach>
   					 </div>
 				 </div>
								<img
									src="../fileSave/${article.filename}"
									class="w3-border w3-center"
									style="max-height:400px;">
 				 	</div>
				</td>
			</tr>
<%-- <<<<<<< HEAD
			
			<tr >
				<td width="100%" class="w3-left" colspan="4"  style="height:200px; overflow: auto;"><pre style="width: 100%;">${article.content}</pre></td>
			</tr>
			
======= --%>
			<%-- <tr>
				<td width="100%" class="w3-left w3-black" colspan="4" style="height:230px; overflow: auto;"><pre style="width: 100%;">${article.content}</pre></td>
			</tr> --%>
			
			</c:if>
			
			
			<c:if test="${article.filename==null }">
			 <tr>
				<td width="100%"  class="w3-left" colspan="4" style="height:350px; overflow: auto;">
				<div class="w3-dropdown-click w3-left">
   				 <button onclick="myFunction()" class="w3-button" style="padding:2px">
   				
   				<!-- checkList -->
   				<i class="fa fa-eye" style="font-size:32px"></i>
   				 
   				 
   				 </button>
   					 <div id="Demo" class="w3-dropdown-content w3-border" style="z-index:99">
   					    <div class="w3-container w3-black w3-padding-small">읽은 사람(총:${readerList.size()}명)</div>
   					  <c:forEach var="List" items="${readerList}">
					      <div class="w3-container w3-padding-small">
					      <i class="fa fa-check"></i>${List.reader }(${List.readerposition })
					      </div>
   					  </c:forEach>
   					 </div>
 				 </div>
					
				
				<pre>${article.content}</pre>
				
				</td> 
			</tr> 
			
			
			</c:if>
		</table>  
			<c:if test="${article.filename!=null }">
			<div class="w3-left w3-card-2 w3-white w3-margin-bottom"  style="height:350px;width:100%; overflow: auto;">
			<pre class="w3-left w3-padding">${article.content}</pre>
			</div>
			</c:if>
			
		<div class="w3-center w3-padding-16">
		<input class="w3-button w3-black" type="button" value="글수정" 
		onclick="$('#content').load('../board/updateForm?num=${article.num}&pageNum=${pageNum}&studynum=${article.studynum}&boardid=${article.boardid}')">
	
		<input class="w3-button w3-black" type="button" value="글삭제"
		onclick="reqDelete()">
		
		<input class="w3-button w3-black" type="button" value="글목록"
		onclick="$('#content').load('../board/study_board?pageNum=${pageNum}&studynum=${article.studynum}&boardid=${article.boardid}')">
		
		<input class="w3-button w3-black" type="button" value="답글쓰기"
		onclick="$('#content').load('../board/writeForm?num=${article.num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}&pageNum=${pageNum}&boardid=${article.boardid }&studynum=${article.studynum }')">
		</div>
	</div> 
	
	
  		
  		<div id="comment" class="w3-container w3-card w3-light grey w3-bordered " style="margin-left:5%;height:400px; width:90%;padding-top:5px">
  			 
  		</div> 
  		
   </div>
   </div>
      </div>
	 <!-- 
		쓸수있는 el: boardType// article, num , pageNum, commentList, readerList 
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
	  
	  
	  function boardToChat(id,memberid){
			
			var memberid=memberid;
			var boardMessage="";
			
			
			 var now = new Date();
			 var nowText="";
		     var nowHour = now.getHours();
		     var nowMt = now.getMinutes();
		     if(nowMt<10){
		    	 nowMt='0'+nowMt;
		     }
		   
		     if ( nowHour <12   ) {
		    

		       nowText='오전 ' + nowHour + ':' + nowMt;

		     } else if (  nowHour >= 12   ) {
			
		    	 if(nowHour>=13){
		    		 nowHour=nowHour-12;
		    	 }
		    	 nowText='오후 ' + nowHour + ':' + nowMt;
		    	 
		     	}
		     
		   
		     var article;
		     
		     $.ajax({
		    	 url : "../board/loadArticle", 
		    	 method : "GET",  
		    	 dataType:"JSON",
		    	 data:{"id":id,
		    			"group":<c:out value="${studynum}"/>,
		    			"boardid":<c:out value="${boardid}"/>
		    			}, 
		    	 success : function(json) {
		    	        
		    	   //alert(JSON.stringify(json));       
		    	   
		    	        article=JSON.parse(JSON.stringify(json));
		    	      

		    	  	  textarea.innerHTML +="<div><table align='right' width='100%'><tr><td><ul class='w3-ul w3-margin-bottom' style='display:block; '>"
		    	  		  +"<li class='w3-large' style='border:none;' align='right'>"
		    	  	          +"<span class='w3-small'>"+nowText+"</span>&nbsp;"
		    	  	         +"<span class='w3-panel w3-round-large w3-padding w3-right '  style='margin:0; max-width:80%; background: rgba(255, 193, 7, 0.75);'>"
		    	  	          +"<span class='w3-medium w3-left' style='text-align: left;'>"+memberid+"님이 게시글 다시 보내기를 하셨습니다.<p/><b>게시판 : </b>"+article.boardname+"<br>"
		    	  	          +"<b>글제목: </b>"+article.title+"<br><b>글쓴이: </b>"+article.writer+"<br><b>올린날짜: </b>"+article.date+"<p/><br>"
		    	  	          +"<button class=w3-button onclick=$('#content').load('../board/content?num="+id+"&studynum="+article.studynum+"&boardid="+article.boardid+"');document.getElementById('contentTitle').innerHTML='게시판';>게시글 보기</button>"
		    	  	          +"</span></span></li></ul></td></tr></table></div>";
		    	     
		    	      
		    	  	 textarea.scrollTop=textarea.scrollHeight;
		    	      
		    	  	 
		    	  	 boardMessage=memberid+"님이 게시글 다시 보내기를 하셨습니다.<p/><b>게시판 : </b>"+article.boardname+"<br>"
		 	          +"<b>글제목: </b>"+article.title+"<br><b>글쓴이: </b>"+article.writer+"<br><b>올린날짜: </b>"+article.date+"<p/><br>"
		  	          +"<button class=w3-button onclick=$('#content').load('../board/content?num="+id+"&studynum="+article.studynum+"&boardid="+article.boardid+"');document.getElementById('contentTitle').innerHTML='게시판';>게시글 보기</button>";
		  	          
		  	          
		    	       webSocket.send(boardMessage.trim());
		    	 
		    	 
		    	 },
		    	 error : function(XHR, textStatus, errorThrown) {
		    	        
		    	     alert("Error: " + textStatus);      
		    	     alert("Error: " + errorThrown);
		    	 
		    	 }
		    	});


		 }
		      
	  
	  
	</script>



</html>