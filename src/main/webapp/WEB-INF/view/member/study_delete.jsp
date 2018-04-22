<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="dao.StudyDAO"%>
<%@page import="model.StudyVO"%>  
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
 
    
        
      <c:if test="${chk==1}">
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	
	<script type="text/javascript">
		alert("${studyName} 이(가) 삭제되었습니다");
	</script>
</c:if>	
