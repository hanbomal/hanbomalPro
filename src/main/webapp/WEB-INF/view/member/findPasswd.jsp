<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.MemberDAO"%>
<%@page import="model.MemberVO"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
  function checkValue()
    {
      
      
      
        if(!document.memberInfo.memberid.value){
            alert("ID를 입력하세요.");
            return false;
        }
        if(!document.memberInfo.passwdq.value){
            alert("비밀번호 찾기 힌트를 선택하세요");
            return false;
        }
        if(!document.memberInfo.passwdkey.value){
            alert("비밀번호 찾기 힌트의 답을 입력하세요");
            return false;
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
      
       <h6>FIND PASSWORD </h6>
      </div>
    <div class="w3-card-4">
      <div class="w3-container " style="overflow:auto; background: rgba(241, 241, 241, 0.75); ">
     
<div class="w3-container">
  <table class="w3-table w3-center ">
    <form method="post" name="memberInfo" class="w3-container w3-card-4 w3-white w3-text-black w3-margin w3-animate-bottom w3-round" 
 action="findpasswdPro" onsubmit="return checkValue()" >



<h5 class="w3-center">비밀번호찾기</h5>






<div class="w3-row w3-section">
  
    <div class="w3-rest ">
 ID  <input class="w3-input w3-border w3-light-grey " style="width:300px; display: inline-block,center;" name="memberid"  type="text"   >
    </div>
</div>

<div class="w3-row w3-section">
 비밀번호 찾기 문항
     <div class="w3-rest">
   <select class="w3-select w3-border  w3-light-grey" name="passwdq" style="width:300px; display: inline-block,center;">
    <option value="" disabled selected>비밀번호 힌트를 선택하세요.</option>
    <option value="1">당신이 졸업한 초등학교는?</option>
    <option value="2">당신의 반려동물의 이름은?</option>
    <option value="3">당신이 태어난 고향은?</option>
     <option value="4">당신의 어머니의 성함은?</option>
      <option value="5">당신의 아버지의 성함은?</option>
  </select>
    </div>
</div>

<div class="w3-row w3-section">
 
    <div class="w3-rest">비밀번호 찾기 답
    <input class="w3-input w3-border w3-light-grey" style="width:300px; display: inline-block,center;" name="passwdkey" type="text"  style="margin-left: 2%;">
    </div>
</div>




<p class="w3-center">

<input type="reset" value="RETRY" class="w3-button w3-gray" >  
<input type="submit" value="SEND" class="w3-button w3-black OnClick="view/index.jsp" >

<input type="button" value="BACK" class="w3-button w3-gray" OnClick="window.location='../page/main'">  
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