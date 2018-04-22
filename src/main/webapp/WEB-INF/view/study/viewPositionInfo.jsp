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
        <span onclick="document.getElementById('clickPosition').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h6><i class="fa fa-trash"></i> 수정/삭제</h6>
      </header>
      <form id="positionForm" method="post">
   <input type="hidden" name="id" value="${id }" >
   <input type="hidden" name="studynum" value="${studynum }" >
  
      <div class="w3-container">
      <div style="margin-top:10px">
      <font size=3>⦁ 역할명</font>
 
      </div>
        <input id="clearName" class="w3-input" type="text" name="groupposition" value="${groupposition }">
      </div>
      <div class="w3-container">
       	<input type="submit" onclick="updateposition()" 
        class="w3-input w3-teal w3-center w3-section" value="수정">
       	<input type="submit" onclick="deleteposition()" 
        class="w3-input w3-teal w3-center w3-section" value="삭제">
        </div>
        </form>
    </div>
  
    
 <script type="text/javascript">
		function updateposition(){
			event.preventDefault();
			
			var form=$('#positionForm')[0];
			var formData= new FormData(form);
			 $.ajax({
                         type: 'POST',
              			 url: '../page/updatePosition',
              		     data: formData,
              		     processData: false,
                         contentType: false,
                         success: function(data){
                            $('#content').html(data);
                         }
                 });
			 document.getElementById('clearName').value=""; 
			 document.getElementById('addPosition').style.display='none';
			 
		}
		
		function deleteposition(){
			event.preventDefault();
			
			var form=$('#positionForm')[0];
			var formData= new FormData(form);
			 $.ajax({
                         type: 'POST',
              			 url: '../page/deletePosition',
              		     data: formData,
              		     processData: false,
                         contentType: false,
                         success: function(data){
                            $('#content').html(data);
                         }
                 });
			 document.getElementById('clearName').value=""; 
			 document.getElementById('addPosition').style.display='none';
			 
		}
</script>




</body>
</html>