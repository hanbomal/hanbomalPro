<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.MemberDAO"%>
<%@page import="model.MemberVO"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
  function checkValue()
    {
      
      
      
        if(!document.memberInfo.passwd.value){
            alert("비밀번호를 입력하세요.");
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
      
       <h6>나의 정보</h6>
      </div>
    <div class="w3-card-4">
      <div class="w3-container " style="overflow:auto; background: rgba(241, 241, 241, 0.75); ">
     
<div class="w3-container">
  <table class="w3-table w3-center ">
    <form method="post" name="memberInfo" class="w3-container w3-card-4 w3-white w3-text-black w3-margin w3-animate-bottom w3-round" 
 action="member_deletePro" onsubmit="return checkValue()" >

<input type="hidden" name="memberid" value="${memberid}">

<h5 class="w3-center">회원탈퇴 하시겠습니까 ?</h5>






<div class="w3-center">
  
    <div class="w3-rest ">
   <input class="w3-input w3-border w3-light-grey w3-center" style="width:300px; display: inline-block;" name="passwd" type="password"  >
    </div>
</div>




<p class="w3-center">

<input type="reset" value="다시작성" class="w3-button w3-gray" >  
<input type="submit" value="회원탈퇴" class="w3-button w3-black" >

<input type="button" value="뒤로가기" class="w3-button w3-gray"
onclick="document.location.href='../member/member_update'">
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