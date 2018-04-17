<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.profileView input[type="file"] { 
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

</style>
<script>
var file = document.querySelector('#input-file');

file.onchange = function () { 
    var fileList = file.files ;

    var reader = new FileReader();
    reader.readAsDataURL(fileList [0]);

    reader.onload = function  () {
        document.querySelector('#prothum').src = reader.result ;
    }; 
}; 

	
	function profileChange(){
		
		event.preventDefault();

		  var form = $('#memberInfoForm')[0];
  	    var formData = new FormData(form);
  	    
  	    
  	  if( document.getElementById('input-file').value==""){
   	
			formData.append("photo", '<c:out value="${memberInfo.photo}" />');		
  	  }
  	    
  	   	
	  $.ajax({
 	        type: "POST",
 	        enctype: 'multipart/form-data',
 	        url: "profileChange",
 	        data: formData,
 	        processData: false,
 	        contentType: false,
 	        cache: false,
 	        timeout: 600000,
 	        success: function (data) {
 	        
 	        	document.getElementById('myStudyInfo').style.display='none';
 	        	$('#content').html(data);
 	        },
 	        error: function (e) {
 	            console.log("ERROR : ", e);
 	        }
 	      
 	    });
		
		
	}
</script>

</head>
<body>

    <div class="w3-modal-content w3-light-grey w3-card-4" style="max-width: 400px;">
     <div class="w3-container w3-center w3-teal">
       <h6><b>내 정보 수정</b></h6>
      </div>
      <div class="w3-container w3-padding" >
        <span onclick="document.getElementById('myStudyInfo').style.display='none';" class="w3-button w3-display-topright">&times;</span>
       
<div class=" w3-center  w3-container w3-padding profileView" id="modal">
	<form id="memberInfoForm"  method="post" enctype="multipart/form-data">
		
	<ul class="w3-ul w3-light-grey"><li><label>닉네임</label>
	<input type="text" id="title" name="nickName" class="w3-input w3-border" value="${memberInfo.nickName }"></li>
	
	
	<li><label>프로필 사진</label>
	<div id="PREVIEW_IMG_DIV">
	<c:if test="${(memberInfo.photo!=null)&&(memberInfo.photo!='')}">
	<img src="<%=request.getContextPath() %>/fileSave/${memberInfo.photo }" id="prothum" width="100%" height="auto" class="w3-margin-top">
	</c:if>
	<c:if test="${(memberInfo.photo==null)||(memberInfo.photo=='') }">
	<img src="<%=request.getContextPath() %>/imgs/profile.png" id="prothum" width="100%" height="auto" class="w3-margin-top">
	</c:if>
	</div>
	<li><input type="file" id="input-file" name="uploadfile" class="upload-hidden"><label for="input-file" class="w3-button w3-padding-small uploadlabel" >사진 변경하기</label></li> 
	

	
	<li><button class="w3-button"  onclick="profileChange();">확인</button>
	
	<input type="button" class="w3-button" onclick="document.getElementById('myStudyInfo').style.display='none';" value="취소"></li>
	
	
	</ul> 
	<input type="hidden" name="memberId" value="${memberInfo.memberId }">
	<input type="hidden" name="studynum" value="${memberInfo.studynum }">
	



            </form>




</div>
   </div>
    </div>
    

</body>
</html>