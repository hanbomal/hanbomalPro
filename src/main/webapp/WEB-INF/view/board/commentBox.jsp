<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class=" w3-border w3-padding" style="margin-left:5%;width:90%">
			<form id="commentform" method="post">
			<input type="hidden" name="studynum" value=${article.studynum }>
			<input type="hidden" name="boardid" value=${article.boardid }>
			<input type="hidden" name="writer" value=${memberInfo.nickName }> 
			<input type="hidden" name="profile" value=${memberInfo.photo }> 
			<input type="hidden" name="num" value=${article.num }> 
  			<input class="w3-border" style="width:90%;height:40px;" type="text" name="content"/>
  			<button class="w3-button  w3-black" 
  			onclick="addComment()" 
  			style="height:40px;margin-top:-5px"type="submit" >댓글</button>
  			</form>
  		</div>

<table  style="width: 100%; " >
  			 	
 	 		 	<c:forEach items="${commentList}" var="List">
  			 	<tr>
  			 	<td>
  			 	
  			 	
  			 	<c:if test="${List.profile!=null }">
  			 			<img src="../fileSave/${List.profile } "class="w3-center" style="width:25px;height:25px">
  			 	</c:if>
  			 	<c:if test="${List.profile==null }">
  			 			<img src="../imgs/profile.png"class="w3-center" style="width:25px;height:25px">
  			 	</c:if>
  			 			
  			 			
  			 			
  			 		<font size="4"><b>${List.writer } </b></font> <font color="gray" size="2">${List.commentdate } </font></td>
  			 	</tr>
  			 	<tr >
  			 		<td colspan="2" style="padding-bottom:2px">${List.content }
  			 		 </td>
  			 	</tr>
  			 	</c:forEach>
  			 	
  			 </table>
  			<script >
  			 function addComment()
  		    {	
  			   event.preventDefault();
  				
  				var form=$('#commentform')[0];
  				var formData= new FormData(form);
  				 $.ajax({
  	                        type: 'POST',
  	             			 url: '../board/addComment',
  	             		     data: formData,
  	             		     processData: false,
  	                        contentType: false,
  	                        success: function(data){
  							     $('#comment').html(data);
  					},
  					error: function(request, status, error) {
  						alert(error);
  					}
  				});
  		    }
  			</script>
</body>
</html>