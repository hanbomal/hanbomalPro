<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script type="text/javascript">

function button_event(){
	
	
	if (confirm(" 정말 삭제하시겠습니까??") == true){    //확인
	    document.form.submit();
	}else{   //취소
	    return false;
	}



}
</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- content -->
<div class="w3-container bgimg-1" style="padding:64px 16px; " id="about">
  
  
<div class="w3-section w3-row-padding">
	<div class="w3-quarter">&nbsp;</div>

  <div class="w3-half w3-container ">
  <div class="w3-container w3-black">
      
       <h6>스터디 그룹 관리  (개설된 스터디 수: ${count } 개)</h6>
      </div>
    <div class="w3-card-4">
      <div class="w3-container " style="overflow:auto; background: rgba(241, 241, 241, 0.75); ">
     
<div class="w3-container">
  <table class="w3-table  ">
    <tr>
    <th>그룹번호</th>
      <th>그룹이름</th>
      <th>그룹소개</th>
      <th>그룹장</th>
      <th>개설일</th>

    
     <th>삭제</th>
      
    </tr>
    
 
  	
  	
  	<c:forEach var="study" items="${studyList}">
     <tr id="study_List">
      <td>${study.num}</td>
      <td>${study.studyName}</td>
      <td>${study.study_intro}</td>
      <td>${study.leader}</td>
       <td>${study.openDate}</td>
       
         <td>
     
                  <form method="post" action="<%=request.getContextPath() %>/member/study_delete">
                  
                  
                  
                  
                  
                     <input type="hidden" name="studyName" value="${study.studyName}">
					
							
                  <input type="submit" class="w3-button w3-center w3-black w3-hover-gray" value="삭제" onclick="return button_event(this.form);">
                      
         </form>
         </td>
         
  
     
     
    </tr>
    </c:forEach>	
  	
  </table>
</div>


  <!-- Pagination -->

      <c:if test="${count>0 }">
       <div class="w3-center w3-padding-16">
    <div class="w3-bar">
         <c:if test="${startPage>bottomLine }">
            <a href="study_List?pageNum=${startPage-bottomLine}" class="w3-bar-item w3-button w3-hover-black">«</a>            
            
         </c:if>
         
         <c:forEach var="i" begin="${startPage }" end="${endPage }">
      
               
               <!-- pageNum넘김 -->
               <c:if test="${i!=currentPage }">
                    <a href="study_List?pageNum=${i }" class="w3-bar-item w3-button w3-hover-black">${i }</a>
               </c:if>
               <c:if test="${i==currentPage }">
                  <a href="study_List?pageNum=${i }" class="w3-bar-item w3-button w3-hover-black">${i }</a>                
               </c:if>
               </a>         
         </c:forEach>
            
            <c:if test="${endPage<pageCount}">
         
               <a href="study_List?pageNum=${startPage+bottomLine}"class="w3-bar-item w3-button w3-hover-black">»</a> 
            </c:if>

   </div>
   </div>
         </c:if>
         
</div>
      </div>
    </div>
 </div></div>

</html>

