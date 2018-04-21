<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
function showMyInfo(){
	var name="<c:out value='${memberid}'/>";
	var group="<c:out value='${study.num}'/>";
	
	document.getElementById('myStudyInfo').style.display='block';
	
	
	 $.ajax({
		type: 'POST',
		url: 'showMyInfo',
		async:false,
		data: {    "name" : name,
					"group":group
        },
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			$('#myStudyInfo').html(data);
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
	 
 
}

function leaveQuestion(){
	var name="<c:out value='${memberid}'/>";
	var group="<c:out value='${study.num}'/>";
	
	document.getElementById('myStudyInfo').style.display='block';
	
	
	 $.ajax({
		type: 'POST',
		url: 'leaveQuestion',
		async:false,
		data: {    "name" : name,
					"group":group
        },
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			$('#myStudyInfo').html(data);
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
	 
}
</script>
</head>
<body>
<div class="w3-container w3-padding" style="height: 600px; overflow:auto; " >
<div style="width: 100%;" class="w3-container w3-margin-left w3-margin-bottom">
<div class="w3-bar  w3-padding w3-margin-bottom">&nbsp;
<button class="w3-button w3-padding-small w3-right w3-margin-left  w3-black w3-hover-red w3-margin-bottom" title="방 나가기"
  onclick="leaveQuestion();">방 나가기</button>&nbsp;

  <button class="w3-button w3-padding-small w3-right  w3-black w3-margin-bottom" title="내 정보 수정"
  onclick="showMyInfo();">내 정보 수정</button>&nbsp;
  
</div>
<div class="w3-half">



<table class='w3-table w3-bordered w3-hoverable' style="border:black;" align="center">

<tr><td class="w3-black" width="130px">이름</td><td><b>${study.studyName }</b></td>
</tr>
<tr><td class="w3-black">개설일</td><td>${study.openDate }</td></tr>
<tr><td class="w3-black">소개</td><td>${study.study_intro}</td></tr>
<tr><td class="w3-black ">대표 사진</td><td class="w3-padding"><img src="<%=request.getContextPath() %>/fileSave/${study.study_pro}"  style="width:80%;height:auto;" class="w3-card-4 w3-border"></td></tr>




</table>
</div>
<div class="w3-half" style="max-height: 450px; overflow:auto;">
<table style="width: 90%;" class="w3-table w3-hoverable w3-bordered w3-margin-right">
<tr><td class="w3-black" colspan="2">회원 목록&nbsp;<span class="w3-small">(총 ${memberCount}명)</span></td></tr>
<c:forEach var="member" items="${members }"><tr><td>
	
	
	
	<c:if test="${(member.photo!=null)&&(member.photo!='')}"><img src="<%=request.getContextPath()%>/fileSave/${member.photo}" width="30px"></c:if>
	<c:if test="${(member.photo==null)||(member.photo=='')}"><img src="<%=request.getContextPath()%>/imgs/profile.png" width="30px"></c:if>
	${member.nickName } (${member.memberId }) 
	<c:if test="${member.memberId ==member.leader}">
	<span class="w3-tag w3-teal w3-border w3-small">방장</span>
	</c:if>

	</td>
	<td width="40%">
	<c:if test="${(member.position!=null)&&(member.position!='')}">
	${member.position }</c:if>
	
	</td>
	</tr></c:forEach>
</table>

</div>
</div>
</div>

<!-- 모달 -->
<div id="myStudyInfo" class="w3-modal" style="display: none;" >
   
  </div>
  



</body>
</html>