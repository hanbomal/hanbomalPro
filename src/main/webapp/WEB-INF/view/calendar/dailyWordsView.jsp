<%@page import="controller.RserveService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="w3-modal-content w3-light-grey w3-card-4" style="max-width: 700px;">
     <div class="w3-container w3-center w3-teal">
       <h6><b>토론 기록</b></h6>
      </div>
      <div class="w3-container w3-padding" >
        <span onclick="document.getElementById('message').style.display='none'; " class="w3-button w3-display-topright">&times;</span>
   <c:if test="${isExists =='TRUE'}">
       
<div class=" w3-container w3-padding" >


	<div style="width: 100%" class="w3-margin-bottom w3-center"><b>${day }</b></div>
	
	
  <div class="w3-bar w3-black" style="width: 100%">

    <button class="w3-bar-item w3-button tablink w3-red" onclick="openSelect(event,'wordcloud')">많이 사용한 단어</button>
    <button class="w3-bar-item w3-button tablink" onclick="openSelect(event,'pie')">대화 참여 비율</button> 
    <button class="w3-bar-item w3-button tablink" onclick="loadChatHistory(${fileName },${num });openSelect(event,'chathistory')">대화 내용 보기</button>
     <a href="<%=request.getContextPath() %>/download.do?path=${num}&fileName=${fileName }.txt">
     ${realFileName }<button class="w3-bar-item w3-button tablink w3-right" onclick="">대화 내용 다운로드</button></a>
  </div>
  <div style="max-height:460px; overflow: auto;" class="w3-border">
  <div id="wordcloud" class="w3-container w3-center w3-padding  selected" style=" " >



   <img src="<%=request.getContextPath() %>/imgs/wordcloud.png" style="max-height:400px;"> 
   
  </div>

  <div id="pie" class="w3-container  w3-center w3-padding  selected" style="display:none">
   <img src="<%=request.getContextPath() %>/imgs/pie.png" style="max-height:400px;">
  </div>

  <div id="chathistory" class="w3-container w3-padding selected" style="display:none" width="100%">
    <img src="<%=request.getContextPath() %>/imgs/pie.png" width="80%">
  </div>
	
	</div>
	
	<br>

</div>
</c:if>


	<c:if test="${isExists =='FALSE'}">

<div class="w3-container w3-padding-32 w3-center">

	선택한 날짜에 대화 기록이 없습니다.
	
	</div>
	</c:if>
<div style="width: 100%" class="w3-center">
<button onclick="document.getElementById('message').style.display='none';" class="w3-button">닫기</button> </div>
    
</div></div>