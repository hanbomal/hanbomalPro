<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<div>

<span class="w3-left w3-padding w3-margin-bottom" style="width:100%;" align="left"><font class="w3-large">${gallery.name }</font>&nbsp;&nbsp;(${gallery.formatDate})</span>



</div>

<img class="w3-card-4" id="img01" src="<%=request.getContextPath() %>/fileSave/${gallery.filename}" style="max-width:100%; max-height:500px; cursor:pointer;" onclick=popupResize(this)>

<p/>

<c:if test="${(gallery.content!='')&&(gallery.content!=null)}">
<span class="w3-left w3-padding" style="width:100%;" align="left">
내용 : ${gallery.content }</span>
</c:if>

<c:if test="${isRe=='FALSE' }">

<div class="w3-container w3-center w3-light-grey w3-margin-top">
       <button class="w3-button" onclick="imageToChat(${gallery.num});">채팅방으로 다시 보내기</button>
       
       <c:if test="${memberid==gallery.name}">
       <button class="w3-button" onclick=" document.getElementById('viewModal').style.display='none';deleteImage(${gallery.num});">삭제하기</button>
       </c:if>
      </div>
      </c:if>

</html>