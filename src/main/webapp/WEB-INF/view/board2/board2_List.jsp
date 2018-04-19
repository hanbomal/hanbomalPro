<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.text.SimpleDateFormat"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"></head>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- content -->
<div class="w3-container bgimg-1" style="padding:64px 16px; " id="about">
  
  
<div class="w3-section w3-row-padding">
	<div class="w3-quarter">&nbsp;</div>

  <div class="w3-half w3-container ">
  <div class="w3-container w3-black">
  <p class="w3-right w3-padding-right-large">
	
      
       <h6>전체글수   (총 : ${count })</h6>
      </div>
    <div class="w3-card-4">
      <div class="w3-container " style="overflow:auto; background: rgba(241, 241, 241, 0.75); ">
     
<div class="w3-container">
  <table class="w3-table  ">
    <tr>
    <th>번호</th>
      <th>글쓴이</th>
      <th>제목</th>
      <th>날짜</th>
     <th>조회수</th>
   <c:if test="${article.re_level>0}">
	<img src="../images/level.gif"
	width="${5 * article.re_level}" height="16"> 
	<img src="../images/re.gif">
	</c:if> 
	<c:if test="${article.re_level==0}">
	 <img src="../images/level.gif"  height="16">
		</c:if>
      
    </tr>
    
 
  	
  	
  	<c:forEach var="board2" items="${board2List}">
     <tr id="board2_List">
      <td>${board2.num}</td>
      <td>${board2.writer}</td>
      <td>${board2.subject}</td>
       <td>${board2.regdate}</td>
        <td>${board2.readcount}</td>
      
         
  
     
     
    </tr>
    </c:forEach>	
  	
  </table>
  <p class="w3-right w3-padding-right-large">
		<a href="board2_Write">글쓰기</a>	</p>
</div>


  <!-- Pagination -->
 <div class="w3-center">
		<c:if test="${count>0 }">
			<c:if test="${startPage>bottomLine }">
				<a href="board2_List?pageNum=${startPage-bottomLine}">[이전]</a>				
				
			</c:if>
			
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
		
					<a href="board2_List?pageNum=${i}">
					<!-- pageNum넘김 -->
					<c:if test="${i!=currentPage }">
							[${i}]
					</c:if>
					<c:if test="${i==currentPage }">
						<font color='black'>[${i}]</font>						
					</c:if>
					</a>			
			</c:forEach>
				
				<c:if test="${endPage<pageCount}">
			
					<a href="board2_List?pageNum=${startPage+bottomLine}">[다음]</a>	
				</c:if>

	
			</c:if>
			
</div>
      </div>
    </div>
  </div>
  
  
</div>
</div>
</html>