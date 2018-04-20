<%@page import="model.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="../api/fullcalendar-3.9.0/lib/jquery.min.js"></script>
<script>
alert("삭제된 게시물입니다.");

document.getElementById('contentTitle').innerHTML='게시판';
$('#content').load('<%=request.getContextPath()%>/board/study_board?studynum=${studynum}&boardid=${boardid}');
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- content -->


</html>