<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="../api/fullcalendar-3.9.0/lib/jquery.min.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 

<script>
$(document).ready(function(){   
document.getElementById('contentTitle').innerHTML='달력';

$('#content').load('<%=request.getContextPath()%>/calcontroller/listview?num=${group}');
$('#chat').load('<%=request.getContextPath()%>/chatcontroller/intro?group=${group}&name=${memberid }');  


 
 
});

 $( function() {
    $( "#draggable" ).draggable({ handle: "#handle" });
    $( "#draggable2" ).draggable({ handle: "#contentTitle" });
    $( "#resizable" ).resizable({
    	
         minHeight: 600,
         minWidth: 500
    });
  } );
 

 
 
  </script>
 

<!--  
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<!--  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
 
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}

pre {
margin:0;
padding:0;
font-size: inherit;
font-family: inherit;
font-style: inherit;
font: inherit;
  white-space: pre-wrap;
}


#draggable .profileThum{
width:30px;
height:30px;
margin-bottom:5px;}
</style>

<!-- content -->
<div class="w3-container bgimg-1" style="padding:128px 16px; " >
  
  
<div class="w3-section w3-row-padding">

<div class="w3-third w3-container w3-margin-bottom"  id="draggable" >
   
      <div class="w3-container w3-white">
      <h6 style="display: inline-block; cursor: move;" id="handle">실시간 토론</h6>  
      <div class="w3-dropdown-hover w3-right w3-small " style="margin-top:5px;"> 
    <button class="w3-button">접속자 목록</button>
    <div class="w3-dropdown-content w3-bar-block w3-border" id="curMember" style="max-height:300px; overflow:auto;">
      <a href="#" class="w3-bar-item w3-button">접속자 없음</a> 
   </div></div>
      </div>
     <div class="w3-card-4">
 <!-- 채팅 div -->
  <div class="w3-container ui-widget-content" id="chat" ondrop="drop(event)" ondragover="allowDrop(event)" style="padding:0; margin:0; overflow:auto; background: rgba(241, 241, 241, 0.75); ">

      </div>
  
      </div>
    </div>


  <div class="w3-twothird w3-container resizable1" id="draggable2" >
  <div class="w3-container w3-white"><h6  style="display: inline-block; cursor: move;" id="contentTitle"></h6>
  <button class="w3-button w3-right "
  onclick="$('#content').load('<%=request.getContextPath()%>/gallery/list?memberid=${memberid }&studynum=${group }');document.getElementById('contentTitle').innerHTML='사진첩'">사진첩</button>
    <div class="w3-dropdown-hover w3-right"> 
    <button class="w3-button ">게시판</button>
    <div class="w3-dropdown-content w3-bar-block w3-border" style="z-index: 5;" id="boardlistDropdown">
      <c:if test="${typeList.size()>0}">
      	    <c:forEach var="typeList" items="${typeList}">
     			 <a href="#" class="w3-bar-item w3-button" onclick="$('#content').load('../board/study_board?studynum=${typeList.studynum }&boardid=${typeList.boardid}');document.getElementById('contentTitle').innerHTML='게시판'">${typeList.boardname }</a> 
			</c:forEach>
	  </c:if>
   </div></div>
<%-- 
<!-- 전 -->  
    <button class="w3-button w3-right w3-dropdown-hover " onclick="$('#content').load('<%=request.getContextPath()%>/board/study_board');document.getElementById('contentTitle').innerHTML='게시판'">게시판</button>

    <div id="reload" class="w3-dropdown-content w3-bar-block w3-border" style="z-index: 5;">
    <a>ddd</a>
    </div> 
      <c:if test="${typeList.size()>0}">
<!-- ========= -->
      <div class="w3-dropdown-hover w3-right"> 
    <button class="w3-button " onclick="$('#content').load('<%=request.getContextPath()%>/board/study_board');document.getElementById('contentTitle').innerHTML='게시판'">게시판</button>
    <div class="w3-dropdown-content w3-bar-block w3-border" style="z-index: 5;" id="boardlistDropdown">
<!--후  -->
    
    
	  
	   --%>
	  
  
  
  
  <button class="w3-button w3-right " onclick="$('#content').load('<%=request.getContextPath()%>/calcontroller/listview?num=${group }');document.getElementById('contentTitle').innerHTML='달력'">달력</button>
      </div>
    <div class="w3-card-4" >
      
      <!-- 내용 div -->
      <div  id="content" style="height:100%; background: rgba(241, 241, 241, 0.75);" >

      </div>
      
      <!-- 내용끝 -->
      
      <div class="w3-container w3-padding w3-light-grey ">
      <c:if test="${study.leader==memberid }">
      <span class="w3-right w3-margin-right">
      <button class="w3-button" 
      onclick="$('#content').load('<%=request.getContextPath()%>/page/study_admin?studynum=${group }');document.getElementById('contentTitle').innerHTML='스터디 관리'">스터디 관리</button></span>
      </c:if>
      <span class="w3-right w3-margin-right">
      <button class="w3-button" onclick="$('#content').load('<%=request.getContextPath()%>/page/study_info?studynum=${group }');document.getElementById('contentTitle').innerHTML='스터디 정보'">스터디 정보</button></span> 
      
      </div>
    </div>
  </div>
  

</div>

</div>



<script>
function onClickReview(num) {
	
		$.ajax({
            type: "POST",
            url: "../gallery/imageViewRe",
            data: {    "num" : num,
            	"memberid" : '<c:out value="${memberid}"/>'
               },
            success: function(data) {
            	document.getElementById("modal_imageContent_re").innerHTML=data;
            
            }, error: function() {
                alert('실패');
            }
        });
		
		document.getElementById("viewModal_re").style.display='block';

		
		}

</script>
 <!--사진 다시보기 모달 -->
     <div id="viewModal_re" class="w3-modal" style="display: none;">
     
    <div class="w3-modal-content w3-light-grey w3-card-4" style="max-width: 600px;">
     <div class="w3-container w3-center w3-teal">
       <h6><b>사진 보기</b></h6>
      </div>
      <div class="w3-container w3-padding" >
        <span onclick="document.getElementById('viewModal_re').style.display='none';" class="w3-button w3-display-topright">&times;</span>
       
<div class="w3-center  w3-container w3-padding" id="modal_imageContent_re">
	
</div>
   </div>
 
  
   
    </div>
  </div>

<script>
function reviewSchedule(id) {
	
		$.ajax({
            type: "POST",
            url: "../calcontroller/contentsReview",
            data: {    "id" : id,
            	
               },
            success: function(data) {
            	document.getElementById("modal_schedule_re").innerHTML=data;
            
            }, error: function() {
                alert('실패');
            }
        });
		
		document.getElementById("viewSchedule_re").style.display='block';

		
		}

</script>
 <!--일정 다시보기 모달 -->
         <div id="viewSchedule_re" class="w3-modal" >
<div id="modal_schedule_re" class=" w3-container w3-padding">
</div>  </div>
    

  
	
</html>