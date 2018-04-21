<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>공지사항 수정</title>
</head>

<body>
<div class="w3-container"><center><b>공지사항 수정 </b>
   <br>
   <form method="post" name="writeform" action="<%=request.getContextPath()%>/board2/board2_updatePro" >

   <input type="hidden" name="num" value="${article.num}">
   <input type="hidden" name="pageNum" value="${pageNum}">
   
   <input type="hidden" name="ref" value="${article.ref}">
   <input type="hidden" name="re_step" value="${article.re_step}">
   <input type="hidden" name="re_level" value="${article.re_level}">
   <!--  -->
   
   <table class="w3-table-all"  style="width:70%;" >
      <tr>
       <td align="right" colspan="2" >
          <a href="board2_List"> 글목록</a> 
      </td>
      </tr>
      <tr>
       <td  width="70"   align="center">이 름</td>
       <td  width="330">
          <input type="text" size="10" maxlength="10" name="writer" value ="${article.writer}"> </td>
     </tr>
     
     <tr>
       <td  width="70"   align="center" >제 목
       </td>
       <td width="330">
          <input type="text" size="40" maxlength="50" name="subject" value="${article.subject}">
      </td>
     </tr>
     
   
     
     <tr>
       <td  width="70"   align="center" >내 용</td>
       <td  width="330" >
        <textarea name="content" rows="13" cols="40">${article.content}</textarea> </td>
     </tr>
     
    
     
   <tr>      
    <td colspan=2  align="center"> 
     <input type="submit" value="글쓰기" >  
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기" OnClick="window.location='board2/board2_List'">
   </td></tr></table>    
     
</form>
</center>

</div>
<%--- <%
} catch (Exception e) {}
%> --%>
</body>
</html>