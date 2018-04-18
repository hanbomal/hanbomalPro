<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
function leaveConfirm(){
	
	event.preventDefault();

	 var formData = $("#leaveConfirmForm").serialize();
	
  $.ajax({
      cache : false,
      url :"leaveConfirm",
      type : 'POST', 
      data : formData, 
      success : function(data) {
    		document.getElementById('myStudyInfo').style.display='none';
    		location.href = "main";
    		
      }, 

      error : function(xhr, status) {
          alert(xhr + " : " + status);
      }
  }); 
	
}
</script>
<body>
<div class="w3-modal-content w3-light-grey w3-card-4" style="max-width: 400px;">
     <div class="w3-container w3-center w3-teal">
       <h6><b>탈퇴 확인</b></h6>
      </div>
      <div class="w3-container w3-padding" >
        <span onclick="document.getElementById('myStudyInfo').style.display='none';" class="w3-button w3-display-topright">&times;</span>
  
<div class=" w3-center  w3-container w3-padding-32 profileView" id="modal">
	<p>정말 탈퇴하시겠습니까?</p>

</div>
<form id="leaveConfirmForm"> 
 
<c:if test="${memberInfo.leader==memberInfo.memberId }">
   
 
<div class="w3-container w3-padding w3-border">
<c:if test="${membercount>1 }">
방장 넘기기<p/>
<select class="w3-input" style="display: inline-block;" name="leader">


<c:forEach var="member" items="${memberlist }">

<c:if test="${member.memberId!=memberInfo.memberId }">
<option value="${member.memberId }">${member.memberId }</option>
</c:if>

</c:forEach>

</select>

</c:if>

<c:if test="${membercount==1 }">
남은 회원이 없어 방이 삭제됩니다.
</c:if>
</div>


</c:if>



<input type="hidden" name="memberId" value="${memberInfo.memberId }">
<input type="hidden" name="studynum" value="${memberInfo.studynum }">
	

<div class="w3-center w3-margin-top">
<button class="w3-button w3-hover-red" onclick="leaveConfirm();">확인</button>&nbsp;
<input type="button" class="w3-button" onclick="document.getElementById('myStudyInfo').style.display='none';" value="취소">
</div>
</form>
   </div>
    </div>
</body>
</html>