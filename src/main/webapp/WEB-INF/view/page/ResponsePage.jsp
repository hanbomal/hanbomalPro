<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="../api/fullcalendar-3.9.0/lib/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- content -->
<div class="w3-container bgimg-1" style="padding:64px 16px; " id="about">
  
<div class="w3-section w3-row-padding">
	<div class="w3-quarter">&nbsp;</div>

  <div class="w3-half w3-container " >
  <div class="w3-container w3-white w3-padding">
      
       
       <font size=3>신청 목록</font>	<font>&nbsp;(총  ${count} 건)</font>
			
      </div>
    <div class="w3-card-4">
      <div class="w3-container " id="res" style="overflow:auto;height:600px; background: rgba(241, 241, 241, 0.75); ">
     
<div class="w3-container ">
 
  	 
 		<c:if test="${count==0 }">
			<div class="w3-center w3-padding-top">
			<table class="w3-table table-bordered w3-center" width="100%">
			<tr  >
			<td class="w3-center w3-padding"><br>
			<span class="w3-tag w3-white w3-border">요청 내역이 없습니다.</span><br><br></td>
			</table>
			</div>
		</c:if>
  	
  	
  	
  	<c:if test="${count>0}">
  	 <table class="w3-table  w3-centered" style="width: 100%; border:black;">
    <tr  class="w3-black">
      <th style="width:25%">신청일</th>
      <th style="width:30%">그룹명</th>
      <th style="width:25%">신청자</th>
      <th style="width:20%">상태</th>
    </tr>
  	<c:forEach var="group" items="${resList}">
     <tr>
      <td style="width:25%">${group.joinDate }</td>
      <td style="width:30%"><b>${group.studyName}</b></td>
      <td style="width:25%">${group.memberId}</td>
      <td style="width:20%">
       <c:if test="${group.status==1}">
      <form method="post" action="sendRedirect" >
      	<input type="hidden" name="memberId" value="${group.memberId}">
      	<input type="hidden" name="studyName" value="${group.studyName}">
      	<button type="submit" name="yes" value="yes" class="w3-button w3-black w3-padding-small">수락</button>
      	<button type="submit" name="no" value="no" class="w3-button w3-red w3-padding-small">거절</button>
      </form>
      </c:if>
  </td>
    </tr> 
    </c:forEach>	
  </table>
  	</c:if>
</div>


  <!-- Pagination -->
  <c:if test="${count>0 }">
			 <div class="w3-center w3-padding-16">
    <div class="w3-bar">
			<c:if test="${startPage>bottomLine }">
		
			<a href="<%=request.getContextPath()%>/page/ResponsePage?pageNum=${startPage-bottomLine}" class="w3-bar-item w3-button w3-hover-black">«</a>
			</c:if>
			
	<c:forEach var="i" begin="${startPage }" end="${endPage}">
				<c:if test="${i!=currentPage }">  <a href="<%=request.getContextPath()%>/page/ResponsePage?pageNum=${i }" class="w3-bar-item w3-button w3-hover-black">${i }</a>
				</c:if>
				<c:if test="${i==currentPage }">  <a href="<%=request.getContextPath()%>/page/ResponsePage?pageNum=${i }" class="w3-bar-item w3-black w3-button">${i }</a>
				</c:if>
			</c:forEach>
			<c:if test="${endPage<pageCount }">
				
				<a href="<%=request.getContextPath()%>/page/ResponsePage?pageNum=${startPage+bottomLine}" class="w3-bar-item w3-button w3-hover-black">»</a>
			</c:if>
			    </div>
  </div>
		</c:if>  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
      </div>
    </div>
  </div>
  
  
</div>
</div>
</html>