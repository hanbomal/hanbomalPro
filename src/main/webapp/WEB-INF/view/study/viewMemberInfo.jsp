<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 쓸수있는 el들 leader groupposition studynum memberid AllPosition nickName-->
</head>
<body>
    <div class="w3-modal-content w3-card-4" style="max-width: 400px;">
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('clickMember').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h6>회원관리</h6>
      </header>
      <form id="memberForm" method="post">
   <input type="hidden" name="studynum" value="${studynum }" > 
   <input type="hidden" name="memberid" value="${memberid }" > 
   <input type="hidden" name="leader" value="${leader }" > 
      <div class="w3-container">
      <div style="margin-top:10px">
      <font size=3>[${nickName} 님]</font><br>
      <font size=3>⦁ 역할부여</font>
   
      <!--  리스트를 가지고와야함-->
 	  <select class="w3-select w3-center" name="positionSelect" style="width:220px">
 	  	<option value="${groupposition}" selected="selected">${groupposition}</option>
 	  	<c:forEach items="${AllPosition}" var="List">
 	  	 	<option value="${List.groupposition}">${List.groupposition}</option>
 	  	</c:forEach>
 	  </select>
 	  <button class="w3-button" type="submit" onclick="grantPosition()"><i class="fa fa-save" style="font-size:26px"></i></button>
      </div>
    <%--     <input id="clearName" class="w3-input" type="text" name="groupposition" value="${groupposition }"> --%>
      </div>
      <div class="w3-container">
       	<input type="submit" onclick="changeLeader()" 
        class="w3-input w3-teal w3-center w3-section w3-half w3-padding w3-button" value="방장위임">
       	<input type="submit" onclick="banishMember()" 
        class="w3-input w3-red w3-center w3-section w3-half w3-padding w3-button" value="추방하기">
        </div>
        </form>
    </div>
  
    
 <script type="text/javascript">
 			function grantPosition(){
			event.preventDefault();
			
			var form=$('#memberForm')[0];
			var formData= new FormData(form);
			 $.ajax({
	                  type: 'POST',
	       			 url: '../page/grantPosition',
	       		     data: formData,
	       		     processData: false,
	                  contentType: false,
	                  success: function(data){
	                     $('#content').html(data);
	                  }
	          });
			 document.getElementById('clearName').value=""; 
			 document.getElementById('clickMember').style.display='none';
			 
		}
		function changeLeader(){
			event.preventDefault();
		
			var form=$('#memberForm')[0];
			var formData= new FormData(form);
			 $.ajax({
                         type: 'POST',
              			 url: '../page/changeLeader',
              		     data: formData,
              		     processData: false,
                         contentType: false,
                         success: function(data){
                            $('#content').html(data);
                         }
                 });
			 document.getElementById('clearName').value=""; 
			 document.getElementById('clickMember').style.display='none';
			 
		}
		
		function banishMember(){
			event.preventDefault();
			
			var form=$('#memberForm')[0];
			var formData= new FormData(form);
			 $.ajax({
                         type: 'POST',
              			 url: '../page/banishMember',
              		     data: formData,
              		     processData: false,
                         contentType: false,
                         success: function(data){
                            $('#content').html(data);
                         }
                 });
			 document.getElementById('clearName').value=""; 
			 document.getElementById('clickMember').style.display='none';
			 
		}
</script>




</body>
</html>