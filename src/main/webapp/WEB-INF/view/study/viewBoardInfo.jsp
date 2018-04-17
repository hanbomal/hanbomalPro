<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
    <div class="w3-modal-content w3-card-4" style="max-width: 400px;">
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('clickBoard').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h6><i class="fa fa-plus"></i> 수정/삭제</h6>
      </header>
      <form id="boardForm" method="post">
   <input type="hidden" name="studynum" value="${studynum }" >
   <input type="hidden" name="boardid" value="${boardid }" >
 
      <div class="w3-container">
      <div style="margin-top:10px">
      <font size=3>⦁ 게시판 이름</font>
 
      </div>
        <input id="clearName" class="w3-input" type="text" name="boardname" value="${boardname }">
      </div>
      <div class="w3-container">
       	<input type="submit" onclick="updateboard()" 
        class="w3-input w3-teal w3-center w3-section" value="수정">
       	<input type="submit" onclick="deleteboard()" 
        class="w3-input w3-teal w3-center w3-section" value="삭제">
        </div>
        </form>
    </div>
  
    
 <script type="text/javascript">
		function updateboard(){
			event.preventDefault();
			
			var form=$('#boardForm')[0];
			var formData= new FormData(form);
			 $.ajax({
                         type: 'POST',
              			 url: '../page/updateBoardType',
              		     data: formData,
              		     processData: false,
                         contentType: false,
                         success: function(data){
                            $('#content').html(data);
                         }
                 });
			 document.getElementById('clearName').value=""; 
			 document.getElementById('makeBoard').style.display='none';
			 
		}
		
		function deleteboard(){
			event.preventDefault();
			
			var form=$('#boardForm')[0];
			var formData= new FormData(form);
			 $.ajax({
                         type: 'POST',
              			 url: '../page/deleteBoardType',
              		     data: formData,
              		     processData: false,
                         contentType: false,
                         success: function(data){
                            $('#content').html(data);
                         }
                 });
			 document.getElementById('clearName').value=""; 
			 document.getElementById('makeBoard').style.display='none';
			 
		}
</script>




</body>
</html>