<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
    <div class="w3-modal-content w3-card-4" style="max-width: 700px;">
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
      <div style="margin-top:20px;margin-left:15px">
      <font size=3>[${nickName} 님]</font><br>
    <div style="padding-top:10px">
      <font size=3>역할부여: </font>
   <!-- 쓸수있는 el들 leader groupposition studynum memberid AllPosition nickName-->
      <!--  리스트를 가지고와야함-->
 	  <select class="w3-select w3-center" name="positionSelect" style="width:500px">
 	  
 	  	<c:if test="${groupposition=='default' }">
 	  		<c:if test="${AllPosition.size()==0 }">
		 	  	<option selected="selected" disabled="disabled" ><font color="gray">역할명을 추가하세요.</font></option>
 	  		</c:if>
 	  		<c:if test="${AllPosition.size()>0 }">
 	  				<c:if test="${memberid==leader }">
		 			  	<option selected="selected" disabled="disabled" ><font color="gray">방장</font></option>
 	  				</c:if>
 	  				<c:if test="${memberid!=leader }">
		 			  	<option selected="selected" disabled="disabled" ><font color="gray">회원</font></option>
 	  					</c:if>
	 	  		<c:forEach items="${AllPosition}" var="List">
	 	  	 	<option value="${List.groupposition}">${List.groupposition}</option>
	 	  		</c:forEach>
 	  		</c:if>
 	  	
 	  	
 	  	</c:if>
 	  	<c:if test="${groupposition!='default' }">
 	  	<option value="${groupposition}" selected="selected" disabled="disabled">${groupposition}</option>
 	  		<c:forEach items="${AllPosition}" var="List">
 	  	 	<option value="${List.groupposition}">${List.groupposition}</option>
 	  		</c:forEach>
 	  	</c:if>
 	  
 	  
 	  </select>
 	  <button class="w3-button" type="submit" onclick="grantPosition()">저장</button>
 	  	  </div>
      </div>
      </div>
        <c:if test="${memberid!=leader}">
      <div class="w3-container w3-padding-24 w3-center">
       	<input type="button" onclick="changeLeader('${memberid}',${studynum })" 
        class=" w3-teal w3-center  w3-padding  w3-button" value="방장위임">
       	<input type="button" onclick="banishMember('${memberid}',${studynum })" 
        class=" w3-red w3-center w3-padding  w3-button" value="추방하기">
        </div>
        </c:if>
        </form>
          <c:if test="${memberid==leader}">
            <div class="w3-container w3-padding-16 w3-center">
       	<button onclick="document.getElementById('clickMember').style.display='none'" 
        class=" w3-black w3-center w3-padding  w3-button" >나가기</button>
            </div>
          </c:if>
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
		function changeLeader(id,studynum){
			var memberid=id;
			var num=studynum;
			  if(confirm("방장을 넘기시겠습니까?")==true){
				 $.ajax({
						type: 'POST',
	              		url: '../page/changeLeader',
						async:false,
						data: {  
									"memberid":memberid,
									"studynum":num
				        },
						contentType:"application/x-www-form-urlencoded; charset=UTF-8",
						success: function(data) {
						       $('#content').html(data);
						},
						error: function(request, status, error) {
							alert(error);
						}
	                 });
				 document.getElementById('clickMember').style.display='none';
			  }else{
				  return;
			  }
			
			
			 
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