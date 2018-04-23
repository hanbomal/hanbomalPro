<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
#chathistoryDiv img {

max-height: 300px;
width:auto;
max-width: 100%;
height:auto;}

#chathistoryDiv .profileThum{
width:30px;
height:30px;
margin-bottom:5px;}
</style>
</head>
<body>
<div id="chathistoryDiv" width="100%"  >
</div>
</body>
<script>

${nameHistoryJs};
${nameHistoryJs2};
var chatHistory = [
    <c:forEach var="list" items="${chatHistoryData}" varStatus="status">
            {"name":'<c:out value="${list.name}" />'
            ,"date":'<c:out value="${list.date}" />'
            ,"content":'<c:out value="${list.content}" />'	               
            } 
            <c:if test="${!status.last}">,</c:if>
       
    </c:forEach> 
];

var chatHistoryArea = document.getElementById("chathistoryDiv");


function historyView(){
	
	for(var i=0;i<chatHistory.length;i++){
	  
	  var l0=chatHistory[i].name;
	  var l1=chatHistory[i].date;
	  var l2=chatHistory[i].content.replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&amp;/g, "&"); 

	
	if(l0=='server'){
		chatHistoryArea.innerHTML +="<div class='w3-margin-top dateTitle' style='width:100%;' align='center'>"
		+"<span class='w3-tag w3-white w3-border w3-margin-top'>"+l2+"</span></div><br>";
		
	}	
	else if(l0=='<%=session.getAttribute("memberid")%>'){
		
	          
		          chatHistoryArea.innerHTML +="<table align='right' width='100%'><tr><td><ul class='w3-ul w3-margin-bottom' style='display:block; '>"
  	  		  +"<li class='w3-large' style='border:none;' align='right'>"
  	  	          +"<span class='w3-small'>"+l1+"</span>&nbsp;"
  	  	         +"<span class='w3-panel w3-round-large w3-padding w3-right '  style='margin:0; max-width:80%; background: rgba(255, 193, 7, 0.75);'>"
  	  	          +"<span class='w3-medium w3-left' style='text-align: left;'>"+l2
  	  	          +"</span></span></li></ul></td></tr></table>";
		          
		          
	  }else{

	 chatHistoryArea.innerHTML +="<div ><table align='left' style='width:100%;'><tr><td>"
	 +"<ul class='w3-ul' style='display:block;' ><li class='w3-large' style='border:none; max-width:80%;'> "
      +"<img src='"+historyNameMap[l0]+"' class='profileThum' >&nbsp;"+historyNameMap2[l0]+"<br>"
      +" <div class='w3-panel w3-round-large w3-padding' style='margin:0; background: rgba(0, 150, 136, 0.75); display:inline-block;'>"
      +" <span class='w3-medium'><font color='white'>"+l2+"</font></span>"
    +" </div><br><span class='w3-small'>"+l1+"</span></li></ul></td></tr></table></div>"; 
     
	  
	  }
	
}

	chatHistoryArea.innerHTML +="<div class='w3-margin-top dateTitle' style='width:100%;' align='center'>"
		+"<span class='w3-tag w3-white w3-border w3-margin-top'>대화 내용 끝</span></div><br>";
	
	}
	
historyView();
</script>
</html>