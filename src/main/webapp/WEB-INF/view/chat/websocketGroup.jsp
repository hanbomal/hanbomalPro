<%@page import="model.RelationVO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

	     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

     <%
    String name=request.getParameter("name");
    if(name==null) name="무명";
    
    String group=request.getParameter("group");
    if(group==null) group="우리끼리";
    
    %>

		
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="../api/date.js"></script>

<meta charset="UTF-8">

<script>
$( function() {
   
    $( "#resizable" ).resizable({
    	
    });
  } );
  
  
var fileCheck=document.getElementById('fileUpload');
$(document).ready(function(){
	  var fileTarget = $('.filebox .upload-hidden');

	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            var filename = $(this)[0].files[0].name;
	        } else {
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        }
	
	        $('.upload-name').val(filename);
	    document.getElementById('upload-nameBox').style.display='block';
	       
	    
	    
	    });
	}); 


function sendEvent(){
	
	$('#sendinput').submit(function(event){
		 
		  var data=$(this).serialize();
		  update(data);
		   document.getElementById('addDay').style.display='none';
		   document.getElementById('message').style.display='block';
			  
			  event.preventDefault();} );
}


function resetFile(){
	 document.getElementById('upload-nameBox').style.display='none';
	 document.getElementById('upload-display').style.display='none';
	 document.getElementById('fileUpload').value="";
}






</script>
<style type="text/css">



.filebox input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
    
}


/* named upload */
.filebox .upload-name {
    display: inline-block;
    padding: .5em .75em;
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}

pre {
margin:0;
padding:0;
font-size: inherit;
font-family: inherit;
font-style: inherit;
font: inherit;
  white-space: pre-wrap;
}

.redColor{background-color:red;}

/* imaged preview */ 
.filebox .upload-display { 
/* 이미지가 표시될 지역 */
 margin-bottom: 5px; } 
 
 @media(min-width: 768px) {
  .filebox .upload-display { 
  display: inline-block;
   margin-right: 5px;
    margin-bottom: 0; } } 
    
.filebox .upload-thumb-wrap {
 /* 추가될 이미지를 감싸는 요소 */
 display: inline-block;
  width: 54px; 
  padding: 2px; 
  vertical-align: middle;
  border: 1px solid #ddd;
  border-radius: 5px;
   background-color: #fff; } 
      
.filebox .upload-display img {
 /* 추가될 이미지 */ 
 display: block; 
 max-width: 100%; 
 width: 100% \9; 
 height: auto; }

#messageWindow img {

max-height: 300px;
width:auto;
max-width: 100%;
height:auto;}

#messageWindow .profileThum{
width:30px;
height:30px;
margin-bottom:5px;}

</style>
</head>



<body>

 <!--  대화내용 div  -->

  <div class="w3-container "  style="margin:0; padding:0;">

      <div class="w3-container w3-padding" style="height:500px;    overflow-x: hidden;  overflow-y: auto; background: inherit;" id="messageWindow">
   
      </div>
      
<!-- 전송창부분   -->    
<form id="form" onsubmit="event.preventDefault();" enctype="multipart/form-data" method="post" >

      <div class="w3-container w3-white " >
     
      <div class="w3-panel w3-round-large w3-border w3-padding " >
   <div id="upload-nameBox" style="display: none;">
   <span  class="w3-tag w3-white " style="font-size:12px;"> 
 <input class="upload-name " id="upload-name" disabled="disabled">
 <button class="w3-button w3-padding-small " onclick="resetFile();">&times;</button>
 </span>
 </div>
 
  <table style="width: 100%;"><tr><td style="width: 90%;">
  
  <textarea  id="inputMessage" class="w3-input" wrap=hard  style="border:0; display: inline-block; " 
  onkeydown="checkKey(event.keyCode);"></textarea></td><td>
  	<button class="w3-button  w3-teal" type="submit" onclick="if((inputMessage.value!='')||(fileCheck.value!='')){send();}" id="submitBtn" >전송</button>
  	
  	</td>
  </table>
  
   </div> <div class="filebox bs3-primary preview-image">
    
     <div class="w3-bar " style="margin-bottom: 7px; margin-left:10px; margin-right:20px;">
   
    <label for="fileUpload" class="w3-button w3-padding-small" id="addfilebtn">
    <i class="fa fa-file-image-o" style="font-size:24px;" ></i></label> 
  <input type="file" id="fileUpload" name="uploadfile" class="upload-hidden"> 

<label class="w3-button w3-padding-small">
<i class="fa fa-file-text-o" style="font-size:24px"></i></label>

<label class="w3-button w3-padding-small">
<i class="fa fa-hashtag" style="font-size:24px"></i></label>&nbsp;&nbsp;

<label><i class="fa fa-search w3-margin-left" style="font-size:20px"></i></label>&nbsp;
<input type="text" class="w3-input  w3-hover-light-grey" 
style="display: inline-block; width: 140px; " id="searchText" placeholder="검색어 입력" value="">

<span class="w3-right w3-margin-right w3-tag w3-white w3-border" >
<font color="w3-grey" style="font-size:12px;" id="curCount"></font></span>
</div>

 </div>
 
 
  </div>
  <input type="hidden" name="name" value="${memberid}">
  <input type="hidden" name="studynum" value="${group}">
  
  </form>
  </div>

<input id="isEmpty" type="hidden" value="${isEmpty }">
  <!-- 전송창부분 끝 -->

</body>
<script type="text/javascript">


var lastday=${lastday};
var today =new Date().toString('yyyyMMdd');


 var isEmpty=document.getElementById('isEmpty').value;

 var memArr=new Array();
  var chatdata = [
	    <c:forEach var="list" items="${chatdata}" varStatus="status">
	            {"name":'<c:out value="${list.name}" />'
	            ,"date":'<c:out value="${list.date}" />'
	            ,"content":'<c:out value="${list.content}" />'	               
	            } 
	            <c:if test="${!status.last}">,</c:if>
	       
	    </c:forEach>
	];
  

  ${nameJs};
  ${nameJs2};
  ${nameJs3};

        var textarea = document.getElementById("messageWindow");
      
      
     <%--   var webSocket = new WebSocket(
   'ws://211.238.142.34:8080<%=request.getContextPath()%>/webGroup?name='
   		+encodeURIComponent('<%=name%>')+'&group='+encodeURIComponent('<%=group%>')); --%>
    		
		 var webSocket = new WebSocket(
				    'ws://localhost:8080<%=request.getContextPath()%>/webGroup?name='
				    		+encodeURIComponent('<%=name%>')+'&group='+encodeURIComponent('<%=group%>'));
    		 
    		 
        var inputMessage = document.getElementById('inputMessage');
    
    webSocket.onerror = function(event) {     onError(event)   };
    webSocket.onopen = function(event) {     onOpen(event)    };
    webSocket.onmessage = function(event) {   onMessage(event) };
    
    function testProcess(data){
    	
    	var t=data.trim();
		var tmp=t.substr(t.indexOf('[')+1,t.lastIndexOf(']')-1);
		/* alert(tmp); */
    	var cutTmp = tmp.split('] [');

    	for(var i=0;i<cutTmp.length;i++){
    		cutTmp[i].trim();
    	}
    	return cutTmp;

    }
    function onMessage(event) {
    	 if(event.data.substr(0,16)=='===fromServer==='){
      		var serverMessage=event.data.substr(16,event.data.length);
      		var fromServer=serverMessage.split(',');
      		
      		
      		
      		document.getElementById("curMember").innerHTML ="";
      		
      		//var curmem="";
      		var count=0;
      		for(var i=0; i<fromServer.length-1;i++){
      			
      			var groupAndName=fromServer[i].split("-");
      			var memArrForList=new Array();
      			if(groupAndName[0]==<%=group%>){
      				count++;
      				
      				//curmem+=groupAndName[1]+",";
      				memArr[groupAndName[1]]={
      						nick:groupAndName[2],
      						photo:'<%=request.getContextPath()%>'+groupAndName[3],
      						position:groupAndName[4]
      						
      						
      				};
      				memArrForList[groupAndName[1]]={
      						nick:groupAndName[2],
      						photo:groupAndName[3],
      						position:groupAndName[4]
      						
      						
      				};
      				
      			
      				document.getElementById("curMember").innerHTML +=
      		      		"<a href='#' class='w3-bar-item w3-button'><img src='<%=request.getContextPath()%>"+memArrForList[groupAndName[1]].photo+"' class='profileThum' >&nbsp;"+memArrForList[groupAndName[1]].nick+"&nbsp;("+memArrForList[groupAndName[1]].position+")</a>"; 
      			
      			}
      			
      			
      		
      		
      		}
      		
      		
      		/* for(var i=1;i<=count;i++){
      		document.getElementById("curMember").innerHTML +=
      		"<a href='#' class='w3-bar-item w3-button'><img src='"+map[memArr[i]]+"' class='profileThum' >&nbsp;"+map2[memArr[i]]+"&nbsp;("+map3[memArr[i]]+")</a>"; 
      		} */
      		
      	
      		
      		
      		document.getElementById("curCount").innerHTML ='현재 접속자 : '+count+'명'; 
      		 textarea.scrollTop=textarea.scrollHeight;
      		return;
      	}
    	 
    	 
    	
    	 
     var texts=testProcess(event.data);

  /*    
  textarea.innerHTML +="<table align='left' style='width:100%;'><tr><td><ul class='w3-ul' style='display:block;' ><li class='w3-large' style='border:none; max-width:80%;'> "
      +texts[0]+
      "<span class='w3-small'>&nbsp;"+texts[1]+"</span><br>"
      +" <div class='w3-panel w3-round-large w3-padding' style='margin:0; background: rgba(0, 150, 136, 0.75); display:inline-block;'>"
      +" <span class='w3-medium'><font color='white'>"+texts[2]+"</font></span>"
    +" </div></li></ul></td></tr></table>";  */
    
    
    textarea.innerHTML +="<div><table align='left' style='width:100%;'><tr><td>"
		 +"<ul class='w3-ul' style='display:block;' ><li class='w3-large' style='border:none; max-width:80%;'> "
	        +"<img src='"+memArr[texts[0]].photo+"' class='profileThum' >&nbsp;"+memArr[texts[0]].nick+"<br>"
	        +" <div class='w3-panel w3-round-large w3-padding' style='margin:0; background: rgba(0, 150, 136, 0.75); display:inline-block;'>"
	        +" <span class='w3-medium'><font color='white'>"+texts[2]+"</font></span>"
	      +" </div><br><span class='w3-small'>"+texts[1]+"</span></li></ul></td></tr></table></div>"; 
  
  
    
         textarea.scrollTop=textarea.scrollHeight;
         
        
         }
    function onOpen(event) {
    	
    
    	
     	if(chatdata.length!=0){
    	 textarea.innerHTML += "<span class='w3-small'>대화 내용은 3일치까지 표시됩니다.</span><br>";  }
         
	for(var i=0;i<chatdata.length;i++){
		  
		  var l0=chatdata[i].name;
		  var l1=chatdata[i].date;
		var l2=chatdata[i].content.replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&amp;/g, "&"); 
		 //var l2=chatdata[i].content.replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&amp;/g, "&").replace(/&quot;/g, "\""); 
		  
		
		if(l0=='server'){
			textarea.innerHTML +="<div class='w3-margin-top dateTitle' style='width:100%;' align='center'>"
			+"<span class='w3-tag w3-white w3-border w3-margin-top'>"+l2+"</span></div><br>";
			
		}	
		else if(l0=='<%=name%>'){
			
		          
			 textarea.innerHTML +="<div><table align='right' width='100%'><tr><td><ul class='w3-ul w3-margin-bottom' style='display:block; '>"
   	  		  +"<li class='w3-large' style='border:none;' align='right'>"
   	  	          +"<span class='w3-small'>"+l1+"</span>&nbsp;"
   	  	         +"<span class='w3-panel w3-round-large w3-padding w3-right '  style='margin:0; max-width:80%; background: rgba(255, 193, 7, 0.75);'>"
   	  	          +"<span class='w3-medium w3-left' style='text-align: left;'>"+l2
   	  	          +"</span></span></li></ul></td></tr></table></div>";
   	     
			
			 /*  textarea.innerHTML +="<div ><table align='right' width='100%'><tr><td><ul class='w3-ul w3-margin-bottom' style='display:block; '>"
				  +"<li class='w3-large' style='border:none;' align='right'>"
			          +"<span class='w3-small'>"+l1+"</span>&nbsp;"
			         +"<span class='w3-panel w3-round-large w3-padding w3-right '  style='margin:0; max-width:80%; background: rgba(255, 193, 7, 0.75);'>"
			          +"<span class='w3-medium messageClass' style='text-align: left;'>"+l2+"</span></span></li></ul></td></tr></table></div>";
		           */
			  
		  }else{

			  /* 
			 
			 textarea.innerHTML +="<div><table align='left' style='width:100%;'><tr><td><ul class='w3-ul' style='display:block;' >"
			 +"<li class='w3-large' style='border:none; max-width:80%;'><img src='"+map[l0]+"' class='profileThum' >";
			  textarea.innerHTML +=l0+
			      "<span class='w3-small'>&nbsp;"+l1+"</span><br>"
			      +" <div class='w3-panel w3-round-large w3-padding' style='margin:0; background: rgba(0, 150, 136, 0.75); display:inline-block;'>"
			      +" <span class='w3-medium'><font color='white'>"+l2+"</font></span>"
			    +" </div></li></ul></td></tr></table></div>";  
			      */
			  
			  
			  
		//시간이 아래쪽에 있는 거
		
		 textarea.innerHTML +="<div><table align='left' style='width:100%;'><tr><td>"
		 +"<ul class='w3-ul' style='display:block;' ><li class='w3-large' style='border:none; max-width:80%;'> "
	        +"<img src='"+map[l0]+"' class='profileThum'>&nbsp;"+map2[l0]+"<br>"
	        +" <div class='w3-panel w3-round-large w3-padding' style='margin:0; background: rgba(0, 150, 136, 0.75); display:inline-block;'>"
	        +" <span class='w3-medium'><font color='white'>"+l2+"</font></span>"
	      +" </div><br><span class='w3-small'>"+l1+"</span></li></ul></td></tr></table></div>"; 
	       
		  
		  
		  }
		
	}
      
    
             textarea.scrollTop=textarea.scrollHeight;
            
             
            
    
    }
    
    
    function onError(event) {     alert(event.data);   }
  
    function send() {
    	today=new Date().toString('yyyyMMdd');
    	
    	var rename="";
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
         
         if((lastday!=today)||(isEmpty=='true')){
        	
        	 var todaytext=new Date().toString('yyyy년 MM월 dd일');
       

        	 
        	 textarea.innerHTML +="<div class='w3-margin-top dateTitle' style='width:100%;' align='center'>"
     			+"<span class='w3-tag w3-white w3-border w3-margin-top'>"+todaytext+"</span></div><br>";
        	 
         	lastday=today;
         	isEmpty='false';
         }
        
      
        	
       if( document.getElementById('fileUpload').value!=""){
    	   
    	   var form = $('#form')[0];
    	    var formData = new FormData(form);
    	    
    	   
			var filename=document.getElementById('upload-name').value;
			
			formData.append("content", inputMessage.value);
			
    	   
		
    	    $.ajax({
    	        type: "POST",
    	        enctype: 'multipart/form-data',
    	        url: "../chatcontroller/fileUpload",
    	        data: formData,
    	        processData: false,
    	        contentType: false,
    	        cache: false,
    	        timeout: 600000,
    	        success: function (data) {
    	      
       	   rename=data;
       	  inputMessage.value="<img src=<%=request.getContextPath()%>/fileSave/"+rename+"><br>"+inputMessage.value;
       	    
       	 textarea.innerHTML +="<div height=300px><table  align='right' width='100%'><tr><td><ul class='w3-ul w3-margin-bottom' style='display:block; '>"
			  +"<li class='w3-large' style='border:none;' align='right'>"
		          +"<span class='w3-small'>"+nowText+"</span>&nbsp;"
		         +"<span class='w3-panel w3-round-large w3-padding w3-right '  style='margin:0; max-width:80%; background: rgba(255, 193, 7, 0.75);'>"
		          +"<span class='w3-medium' style='text-align: left;'><pre>"+inputMessage.value+"</pre></span></span></li></ul></td></tr></table></div>";
		          
		        
		          
		          
		          resetFile();
	    
       	
       	if(document.getElementById('contentTitle').innerHTML=='사진첩'){
       		
       	$('#content').load('<%=request.getContextPath()%>/gallery/list?memberid=<%=name%>&studynum=<%=group%>');
       	}
       	
       	
       	inputMessage.focus();
	   
	    webSocket.send(inputMessage.value.trim());
 			  
       inputMessage.value = "";
       
       textarea.scrollTop=textarea.scrollHeight;

       
    	        },
    	        error: function (e) {
    	            console.log("ERROR : ", e);
    	        }
    	      
    	    });
    	 
    	    
           
    	    
       }else{
    	   
    	   textarea.innerHTML +="<div><table  align='right' width='100%'><tr><td><ul class='w3-ul w3-margin-bottom' style='display:block; '>"
 			  +"<li class='w3-large' style='border:none;' align='right'>"
 		          +"<span class='w3-small'>"+nowText+"</span>&nbsp;"
 		         +"<span class='w3-panel w3-round-large w3-padding w3-right '  style='margin:0; max-width:80%; background: rgba(255, 193, 7, 0.75);'>"
 		          +"<span class='w3-medium' style='text-align: left;'><pre>"+inputMessage.value+"</pre></span></span></li></ul></td></tr></table></div>";
       
       
        
		 textarea.scrollTop=textarea.scrollHeight;
        
         webSocket.send(inputMessage.value.trim());
  			  
        inputMessage.value = "";
       }
         
         
         
         document.getElementById('searchText').value='';
            
             
             $("#messageWindow > div").show();
         
       textarea.scrollTop=textarea.scrollHeight;
			
	
    
      
    
    }
    
    
    
    
    
    $(document).ready(function() {
        $('#searchText').keyup(function() {
            var k = $(this).val();
          	if(k==""||k==null){
            	/* $("#messageWindow > div").show();
            	 textarea.scrollTop=textarea.scrollHeight; */
            	k=" ";
            	 var temp = $("#messageWindow > div>table:contains('" + k + "')");
             	$('.dateTitle').show();
                     $(temp).parent().show(); 
                     textarea.scrollTop=textarea.scrollHeight;         
          	}
            	 
            	 
          	else{
            
            $("#messageWindow > div").hide();
            var temp = $("#messageWindow > div>table:contains('" + k + "')");
    	$('.dateTitle').show();
            $(temp).parent().show(); }
           
        
    })
    })
    
    
    
    
    

function checkKey(e){
    if(!e){ e = window.event; }
    var code = e.keyCode ? e.keyCode : e.charCode;
    var shift = e.shiftKey;
  
    if(!shift&&(code==13)){ 
    	
    	event.preventDefault(); 
    	
    	if((inputMessage.value!='')||(fileCheck.value!='')){
    		send(); }
    	}
	
	
	
	
	}


	document.getElementById('inputMessage').onkeypress = checkKey;
	 
	

//preview image 

var imgTarget = $('.preview-image .upload-hidden'); 
imgTarget.on('change', function(){
var parent = $(this).parent();

parent.children('.upload-display').remove();
if(window.FileReader){ 
//image 파일만
if (!$(this)[0].files[0].type.match(/image\//)) 
	return;

var reader = new FileReader(); 
reader.onload = function(e){
	var src = e.target.result;
	
	parent.prepend('<div class="upload-display" id="upload-display"><div class="upload-thumb-wrap w3-display-container "><img src="'+src+'" class="upload-thumb"></div></div>'); 
	
	//document.getElementById('addfilebtn').style.display='none';
	} 

reader.readAsDataURL($(this)[0].files[0]); 
} else { 
	$(this)[0].select();
	$(this)[0].blur(); 
	var imgSrc = document.selection.createRange().text; 
	parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'); 
	
	var img = $(this).siblings('.upload-display').find('img'); 
	img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")"; 
	
}

});





/*   ------------------------------------------- */
 



</script>
</html>





    
