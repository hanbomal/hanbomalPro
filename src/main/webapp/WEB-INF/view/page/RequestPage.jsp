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

  <div class="w3-half w3-container ">
  <div class="w3-container w3-white w3-padding">
      
       <font size=3>신청 목록</font>	<font>&nbsp;(총  ${count} 건)</font>
       
       
       <select class="w3-right w3-select" style="width:10%;padding:4px"  
			onchange="">
  			 <%--  <option value="${chk}" selected disabled="disabled">
  			  <c:if test="${chk!='byDate'}">정확도순</c:if>
  			  <c:if test="${chk=='byDate'}">최신순</c:if>
  			  </option> style="display:inline-block;"--%>
			
  			  <option value="byDate">대기</option>
  			  <option value="byName">승인</option>
  			  <option value="byDate">거절</option>
			</select>
					 
      </div>
    <div class="w3-card-4 ">
      <div class="w3-container " id="req1" style="overflow:auto; height:600px; background: rgba(241, 241, 241, 0.75); ">
<div class="w3-container w3-padding-16">
  
  	
 		<c:if test="${count==0 }">
			<div class="w3-center w3-padding-top">
			<table class="w3-table table-bordered w3-center" width="100%">
			<tr  >
			<td class="w3-center w3-padding"><br>
			<span class="w3-tag w3-white w3-border">신청 내역이 없습니다.</span><br><br></td>
			</table>
			</div>
		</c:if>
  	
  	
  	
  	
  	<c:if test="${count>0}">
  	
  	<table class="w3-table  w3-centered" style="width: 100%; border:black; ">
    <tr class="w3-black">
      <th style="width:30%">신청일</th>
      <th style="width:40%">그룹명</th>
      <th style="width:30%">상태</th>
    </tr>
  	<c:forEach var="group" items="${reqList}">
     <tr id="acep">
      <td style="width:30%">${group.joinDate }</td>
      <td style="width:40%"><b>${group.studyName}</b></td>
      <c:if test="${group.status==2}">
      <td style="width:30%"><i class="fa fa-check"></i>승인 (${group.position })</td>
      </c:if>
      <c:if test="${group.status==1}">
      <td style="width:30%">승인 대기중</td>
      </c:if>
    </tr>
    </c:forEach>	
     </table>
  	</c:if>
</div>
<!-- x effect 
<span onclick="document.getElementById('acep').style.display='none'">&times;</span> -->

  <!-- Pagination -->
  <c:if test="${count>0 }">
			 <div class="w3-center w3-padding-16">
    <div class="w3-bar">
			<c:if test="${startPage>bottomLine }">
			<a href="<%=request.getContextPath()%>/page/RequestPage?pageNum=${startPage-bottomLine}" class="w3-bar-item w3-button w3-hover-black">«</a>
			</c:if>
			
	<c:forEach var="i" begin="${startPage }" end="${endPage}">              
				<c:if test="${i!=currentPage }">  <a href="<%=request.getContextPath()%>/page/RequestPage?pageNum=${i }" class="w3-bar-item w3-button w3-hover-black w3-padding">${i }</a>
				</c:if>
				<c:if test="${i==currentPage }">  <a href="<%=request.getContextPath()%>/page/RequestPage?pageNum=${i }" class="w3-bar-item w3-black w3-button w3-padding">${i }</a>
				</c:if>
			</c:forEach>
			<c:if test="${endPage<pageCount }">
				
				<a href="<%=request.getContextPath()%>/page/RequestPage?pageNum=${startPage+bottomLine}" class="w3-bar-item w3-button w3-hover-black">»</a>
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