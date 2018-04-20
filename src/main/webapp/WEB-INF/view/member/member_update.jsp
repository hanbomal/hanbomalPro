<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.MemberDAO"%>
<%@page import="model.MemberVO"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


 


<script>



  function checkValue()
    {
      
        if(!document.memberInfo.nickname.value){
            alert("닉네임을 입력하세요.");
            return false;
        }
        
      
        if(!document.memberInfo.passwd.value){
            alert("비밀번호를 입력하세요.");
            return false;
        }
        
        if(document.memberInfo.passwd.value != document.memberInfo.passchk.value){
        	alert("비밀번호 확인란에 비밀번호를 동일하게 입력하세요.");
            return false;
        } 
       
        else
        	alert("수정완료 되었습니다")
    }
  </script>
  
<html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- content -->
<div class="w3-container bgimg-1" style="padding:64px 16px;">
  
  
<div class="w3-section w3-row-padding">
	<div class="w3-third">&nbsp;</div>

  <div class="w3-third w3-container ">
  <div class="w3-container w3-light-gray">
      
       <h6>MY PAGE</h6>
      </div>
    <div class="w3-card-4">
      <div class="w3-container " style="overflow:auto; background: rgba(241, 241, 241, 0.75); ">
     
<div class="w3-container">
  <table class="w3-table  ">
    <form method="post" name="memberInfo" class="w3-container w3-card-4 w3-white w3-text-black w3-margin w3-animate-bottom w3-round" 
 action="member_updatePro" onsubmit="return checkValue()" >

<input type="hidden" name="num" value="${member.num }">

<input type="hidden" name="lastdate" value="${member.lastdate }">

<%----<h6 class="w3-right">*는 필수 입력입니다.</h6> --%>



<!-- 아이디 -->
<div class="w3-row w3-section">
 
    <div class="w3-rest">
    ID
   <input class="w3-input w3-border w3-light-grey" style="width:300px; display: inline-block,center;" name="memberid" type="text" readonly="readonly" value="${member.memberid}" style="margin-left: 2%;">
    </div>
</div>


<!-- 닉네임  -->
<div class="w3-row w3-section ">

    <div class="w3-rest">
NICKNAME      <input class="w3-input w3-border w3-light-grey" style="width:300px; display: inline-block,center;" name="nickname" type="text"  value="${member.nickname}" required>
    </div>
</div>

<!-- 패스워드 -->
<div class="w3-row w3-section">
  
    <div class="w3-rest">
  PASSWORD    <input class="w3-input w3-border w3-light-grey" style="width:300px; display: inline-block,center;" name="passwd" type="password" value="${member.passwd}" required>
    </div>
</div>



<!-- 패스워드 확인  -->
<div class="w3-row w3-section">
  
    <div class="w3-rest">
 PASSWORD CHECK     <input class="w3-input w3-border w3-light-grey"  name="passchk" type="password" placeholder="Password Check*" style="width:300px; display: inline-block,center;"required>
    </div>
</div>

<!-- 가입일-->
<div class="w3-row w3-section">
 
    <div class="w3-rest">
     JOIN DATE <input class="w3-input w3-border w3-light-grey" style="width:300px; display: inline-block,center;" name="memberid" type="text" readonly="readonly" value="${member.joindate}" style="margin-left: 2%;">
    </div>
</div>

 
QUESITION 
<!-- 비밀번호찾기 문항   -->
<div class="w3-row w3-section">
 
     <div class="w3-rest">
   <select class="w3-select w3-border  w3-light-grey" name="passwdq" style="width:300px; display: inline-block,center;" value="${member.passwdq}"required>
   

    <option value="" >비밀번호 힌트를 선택하세요.</option>
      <c:if test="${member.passwdq==1}">
    <option value="1" selected>당신이 졸업한 초등학교는?</option>
    </c:if><c:if test="${member.passwdq!=1}">
      <option value="1">당신이 졸업한 초등학교는?</option>
    </c:if>
      <c:if test="${member.passwdq==2}">
    <option value="2" selected>당신의 반려동물의 이름은?</option>
    </c:if><c:if test="${member.passwdq!=2}">
      <option value="2">당신의 반려동물의 이름은?</option>
    </c:if>  <c:if test="${member.passwdq==3}">
    <option value="3" selected>당신이 태어난 고향은?</option>
    </c:if><c:if test="${member.passwdq!=3}">
      <option value="3">당신이 태어난 고향은?</option>
    </c:if>  <c:if test="${member.passwdq==4}">
    <option value="4" selected>당신의 어머니의 성함은?</option>
    </c:if><c:if test="${member.passwdq!=4}">
      <option value="4">당신의 어머니의 성함은?</option>
    </c:if>  <c:if test="${member.passwdq==5}">
    <option value="5" selected>당신의 아버지의 성함은?</option>
    </c:if><c:if test="${member.passwdq!=5}">
      <option value="5">당신의 아버지의 성함은?</option>
    </c:if>
    
  
  </select>
    </div>
</div>
<div class="w3-row w3-section">
 
    <div class="w3-rest">
    <input class="w3-input w3-border w3-light-grey" style="width:300px; display: inline-block,center;" name="passwdkey" type="text"  value="${member.passwdkey}" style="margin-left: 2%;" required>
    </div>
</div>



<p class="w3-center">

<input type="reset" value="RETRY" class="w3-button w3-gray" >  
<input type="submit" value="SEND" class="w3-button w3-black" >

<input type="button" value="Back" class="w3-button w3-gray" OnClick="window.location='../page/main'">  
</p>
<p class="w3-right">
<input type="button" value="LEAVE" class="w3-button w3-dark-gray" OnClick="window.location='../member/member_delete'">  
</p>
</form>

  </table>
</div>


 
      </div>
    </div>
  </div>
  
  
</div>
</div>
</html>