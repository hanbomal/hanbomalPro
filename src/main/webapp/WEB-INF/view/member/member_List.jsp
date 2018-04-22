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
      
       <h6>회원관리   (회원수:${count })</h6>
      </div>
    <div class="w3-card-4">
      <div class="w3-container " style="overflow:auto; background: rgba(241, 241, 241, 0.75); ">
     
<div class="w3-container">
  <table class="w3-table  ">
    <tr>
    <th>회원번호</th>
      <th>아이디</th>
      <th>닉네임</th>
      <th><center>가입일</center></th>

     <th><center>최종방문일</center></th>
     <th>삭제 </th>
      
    </tr>
    
 
  	
  	
  	<c:forEach var="member" items="${memberList}">
     <tr id="member_List">
      <td><center>${member.num}</center></td>
      <td>${member.memberid}</td>
      <td>${member.nickname}</td>
       <td>${member.joindate}</td>
        <td>${member.lastdate}</td>
         <td>
     
                  <form method="post" action="<%=request.getContextPath() %>/member/member_deletead">
                  
                  
                  
                  
                  
                     <input type="hidden" name="memberid" value="${member.memberid}">
					<input type="hidden" name="passwd" value="${member.passwd}"> 
							
                    <input type="submit" class="w3-button w3-center w3-black w3-hover-gray" value="삭제" onclick="return button_event(this.form);">
                      
         </form>
         </td>
         
  
     
     
    </tr>
    </c:forEach>	
  	
  </table>
</div>


 
      <c:if test="${count>0 }">
       <div class="w3-center w3-padding-16">
    <div class="w3-bar">
         <c:if test="${startPage>bottomLine }">
            <a href="member_List?pageNum=${startPage-bottomLine}" class="w3-bar-item w3-button w3-hover-black">«</a>            
            
         </c:if>
         
         <c:forEach var="i" begin="${startPage }" end="${endPage }">
      
               
               <!-- pageNum넘김 -->
               <c:if test="${i!=currentPage }">
                    <a href="member_List?pageNum=${i }" class="w3-bar-item w3-button w3-hover-black">${i }</a>
               </c:if>
               <c:if test="${i==currentPage }">
                  <a href="member_List?pageNum=${i }" class="w3-bar-item w3-button w3-hover-black">${i }</a>                
               </c:if>
               </a>         
         </c:forEach>
            
            <c:if test="${endPage<pageCount}">
         
               <a href="member_List?pageNum=${startPage+bottomLine}"class="w3-bar-item w3-button w3-hover-black">»</a> 
            </c:if>

   </div>
   </div>
         </c:if>
         
</div>
      </div>
    </div>
 </div></div>

</html>

