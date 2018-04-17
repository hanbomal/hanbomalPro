<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="../api/fullcalendar-3.9.0/lib/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div class="w3-center w3-padding"><b>회원 목록</b>(총 ${count}명)</div>
 <table class="w3-table  w3-centered" style="width: 100%; border:black;">
    <tr class="w3-black">
      <th class="w3-center" width="25%">닉네임</th>
      <th class="w3-center" width="25%">역할</th>
      <th class="w3-center" width="25%">가입일</th>
      <th class="w3-center" width="25%">최종접속일</th>
    </tr>
    <!--
    	<c:forEach var="positionList" items="${positionList }">
			<li onclick="postionInfo(${positionList.id},${positionList.studynum},'${positionList.groupposition }')">⦁&nbsp;${positionList.groupposition }</li>
		</c:forEach>
      -->
  <c:forEach var="member" items="${members }">
 	<tr class="w3-hover-white" onclick="memberInfo(${member.studynum},'${member.position }','${member.leader}','${member.memberId }')">
 	  <td class="w3-center" width="25%">${member.nickName }</td>
 	  <td class="w3-center" width="25%">${member.position }</td>
 	  <td class="w3-center" width="25%">${member.joinDate }</td>
 	  <td class="w3-center" width="25%">${member.lastDate }</td>
 	</tr>
  </c:forEach>
 </table> 
  <!-- Pagination -->
 
<c:if test="${count>0 }">
			 <div class="w3-center w3-padding-16">
    <div class="w3-bar">
			<c:if test="${startPage>bottomLine }">
		
			<a onclick="$('#memberList').load('<%=request.getContextPath()%>/page/admin_memberList?pageNum=${startPage-bottomLine}');" class="w3-bar-item w3-button w3-hover-black">«</a>
			</c:if>
			
	<c:forEach var="i" begin="${startPage }" end="${endPage}">
				<c:if test="${i!=currentPage }">  <a onclick="$('#memberList').load('<%=request.getContextPath()%>/page/admin_memberList?pageNum=${i }');" class="w3-bar-item w3-button w3-hover-black">${i }</a>
				</c:if>
				<c:if test="${i==currentPage }">  <a onclick="$('#memberList').load('<%=request.getContextPath()%>/page/admin_memberList?pageNum=${i }');" class="w3-bar-item w3-black w3-button">${i }</a>
				</c:if>
			</c:forEach>
			<c:if test="${endPage<pageCount }">
				
				<a onclick="$('#memberList').load('<%=request.getContextPath()%>/page/admin_memberList?pageNum=${startPage+bottomLine}');" class="w3-bar-item w3-button w3-hover-black">»</a>
			</c:if>
			    </div>
  </div>
		</c:if>

<div id="clickMember" class="w3-modal" style="display: none;" >
  </div>


<script>
function memberInfo(num,position,groupleader, mid){
	var studynum=num;
	var groupposition=position;
	var leader=groupleader; 
	var memberid=mid; 
	document.getElementById('clickMember').style.display='block';
	/* o(${member.studynum},'${member.position }','${member.leader}')"> */
	 $.ajax({
		type: 'POST',
		url: 'MemberInfo',
		async:false,
		data: {   
				"studynum":studynum,
				"groupposition":groupposition, 
				"leader":groupleader,
				"memberid":memberid
				
        },
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			$('#clickMember').html(data);
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
	 
} 


</script>

</body>
</html>