<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="../api/fullcalendar-3.9.0/lib/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
function onClick(num) {
	
		$.ajax({
            type: "POST",
            url: "../gallery/imageView",
            data: {    "num" : num,
            	"memberid" : '<c:out value="${memberid}"/>'
               },
            success: function(data) {
            	document.getElementById("modal_imageContent").innerHTML=data;
            
            }, error: function() {
                alert('실패');
            }
        });
		
		document.getElementById("viewModal").style.display='block';

		
		}

</script>

<style>
.thumbnail-wrappper {
 /* width: 25%; */ 
}

 .thumbnail {
 position: relative; 
padding-top: 100%; /* 1:1 ratio */ 
overflow: hidden; 
} 

.thumbnail .centered {
 position: absolute;
 top: 0; left: 0;
 right: 0; bottom: 0;
 -webkit-transform: translate(50%,50%); 
-ms-transform: translate(50%,50%);
 transform: translate(50%,50%);
 } 

.thumbnail .centered .thum { 
position: absolute;
 top: 0; left: 0; 
max-width: 100%;
 height: auto;
 -webkit-transform: translate(-50%,-50%);
 -ms-transform: translate(-50%,-50%);
 transform: translate(-50%,-50%); 
}

li {
list-style: none;}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- content -->
<input type="hidden" value="${memberid }" id="chkMem">
<div class="w3-container " id="gallery" style="height:600px; overflow:auto; ">
 <div class="w3-container"><div class="w3-bar w3-padding ">
 <!-- <button class="w3-button w3-padding-small w3-left w3-light-grey">목록보기</button> -->
  	<span >전체 사진 : ${count }</span>
  		<c:if test="${count!=0 }">	
 <span class="w3-right w3-small w3-tag w3-white w3-border">사진을 채팅창에 끌어다 놓으면 다시 전송됩니다.</span>
 </c:if>
</div></div>
 <div class="w3-row w3-container " >
 
 
 		<c:if test="${count==0 }">
			<div class="w3-center w3-padding-top">
			<table class="w3-table table-bordered w3-center" width="100%">
			<tr  >
			<td class="w3-center w3-padding"><br>
			<span class="w3-tag w3-white w3-border">업로드된 사진이 없습니다.</span><br><br></td>
			</table>
			</div>
		</c:if>
		
		<c:if test="${count!=0 }">	
		<ul>
<c:forEach var="gallery" items="${galleryList}">
<li>
<div class="w3-quarter w3-container w3-margin-bottom ">
 
  
<c:if test="${gallery.name==memberid}"> 
  <div class="w3-display-container w3-card-4 w3-white thumbnail-wrapper">
    
     <div class="thumbnail w3-topbar  w3-border-amber "> 
	<div class="centered ">
	
		    <img draggable="true" ondragstart="drag(event)" 
		    
		    src="<%=request.getContextPath()%>/fileSave/${gallery.filename}" class="thum" id="${gallery.num }" style="width: 100%; cursor:pointer;  max-height: 300px;"
		     onclick="onClick(${gallery.num})">
		     
		     	    
		      </div>
    </div>
    
    <div class="w3-display-topright w3-display-hover">
            <button title="삭제" onclick="deleteImage(${gallery.num});this.parentElement.parentElement.parentElement.style.display='none';" class="w3-button w3-padding-small w3-small w3-black w3-circle">&times;</button>
          </div>
 
    </div>
</c:if> 
  <c:if test="${gallery.name!=memberid}">
  <div class="w3-display-container w3-topbar  w3-border-teal w3-card-4 w3-white thumbnail-wrapper">
    
     <div class="thumbnail"> 
	<div class="centered ">
	
		    <img draggable="true" ondragstart="drag(event)" 
		    
		    src="<%=request.getContextPath()%>/fileSave/${gallery.filename}" class="thum" id="${gallery.num }" style="width: 100%; cursor:pointer; max-height: 300px;"
		     onclick="onClick(${gallery.num})">
		    
		    </div>
    </div>
   
    </div>
</c:if> 

    <p><span class="w3-small">${gallery.formatDate }</span><br>
    <span class="w3-tag w3-white w3-border">${gallery.name }</span></p>
 

</div>

</li>
</c:forEach>
</ul>
</c:if>
</div>


<!-- Pagination -->

<c:if test="${count>0 }">
			 <div class="w3-center w3-padding-16">
    <div class="w3-bar">
			<c:if test="${startPage>bottomLine }">
		
			<a onclick="$('#gallery').load('<%=request.getContextPath()%>/gallery/list?pageNum=${startPage-bottomLine}');" class="w3-bar-item w3-button w3-hover-black">«</a>
			</c:if>
			
	<c:forEach var="i" begin="${startPage }" end="${endPage}">
				<c:if test="${i!=currentPage }">  <a onclick="$('#gallery').load('<%=request.getContextPath()%>/gallery/list?pageNum=${i }');" class="w3-bar-item w3-button w3-hover-black">${i }</a>
				</c:if>
				<c:if test="${i==currentPage }">  <a onclick="$('#gallery').load('<%=request.getContextPath()%>/gallery/list?pageNum=${i }');" class="w3-bar-item w3-black w3-button">${i }</a>
				</c:if>
			</c:forEach>
			<c:if test="${endPage<pageCount }">
				
				<a onclick="$('#gallery').load('<%=request.getContextPath()%>/gallery/list?pageNum=${startPage+bottomLine}');" class="w3-bar-item w3-button w3-hover-black">»</a>
			</c:if>
			    </div>
			    
			    
  </div>
		</c:if>




</div>

  
<div id="modal01" class="w3-modal" onclick="this.style.display='none'">
  <span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
  <div class="w3-modal-content w3-animate-zoom">
   
  </div>
</div>
     
     
   <!--사진 보기 모달 -->
     <div id="viewModal" class="w3-modal" >
     
    <div class="w3-modal-content w3-light-grey w3-card-4" style="max-width: 600px;">
     <div class="w3-container w3-center w3-teal">
       <h6><b>사진 보기</b></h6>
      </div>
      <div class="w3-container w3-padding" >
        <span onclick="document.getElementById('viewModal').style.display='none';" class="w3-button w3-display-topright">&times;</span>
       
<div class="w3-center  w3-container w3-padding" id="modal_imageContent">
	
</div>
   </div>
 
  
   
    </div>
  </div>


<script>

function imageToChat(id){
	var imgSrc=document.getElementById(id).src;
	var chkMem=document.getElementById("chkMem").value;
	var  galleryMessage="";
	
	 var now = new Date();
	 var nowText="";
     var nowHour = now.getHours();
     var nowMt = now.getMinutes();
     if(nowMt<10){
    	 nowMt='0'+nowMt;
     }
   
     if ( nowHour <12   ) {
    

       nowText='오전 ' + nowHour + ':' + nowMt;

     } else if (  nowHour >= 12   ) {
	
    	 if(nowHour>=13){
    		 nowHour=nowHour-12;
    	 }
    	 nowText='오후 ' + nowHour + ':' + nowMt;
    	 
     	}
     
     
	  textarea.innerHTML +="<table align='right' width='100%'><tr><td><ul class='w3-ul w3-margin-bottom' style='display:block; '>"
		  +"<li class='w3-large' style='border:none;' align='right'>"
	          +"<span class='w3-small'>"+nowText+"</span>&nbsp;"
	         +"<span class='w3-panel w3-round-large w3-padding w3-right '  style='margin:0; max-width:80%; background: rgba(255, 193, 7, 0.75);'>"
	          +"<span class='w3-medium'>"+chkMem+"님이 사진 다시 보내기를 하셨습니다.<p/><img src='"+imgSrc+"'></span></span></li></ul></td></tr></table>";
   
    
	 textarea.scrollTop=textarea.scrollHeight;
    
	 
	 galleryMessage=chkMem+"님이 사진 다시 보내기를 하셨습니다.<p/><img src="+imgSrc+">";
	 
     webSocket.send(galleryMessage.trim());
     
     document.getElementById('viewModal').style.display='none';
     
	
	
}

function deleteImage(num){
	
	$.ajax({
        type: "POST",
        url: "../gallery/deleteImage",
        data: {    "num" : num
           },
        success: function(data) {
        	//$('#content').html(data);
        	
        	$('#content').load('<%=request.getContextPath()%>/gallery/list'); 
        }, error: function() {
            alert('실패');
        }
    });
	

	
}


function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    //alert(document.getElementById(data).id);
    imageToChat(document.getElementById(data).id);
    
    
    
    
    
    //ev.target.appendChild(document.getElementById(data));
}



</script>

</html>