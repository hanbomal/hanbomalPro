<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<html>
<head>
<title>게시판</title>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<!-- arrow_back -->

<div class="w3-container " style="height:600px; width:100%; overflow:auto;  ">
<div class="w3-container " style="width: 100%;">
<!-- <div class="w3-card-2" style="margin-top:10px" > -->
	 <div  id="content" style="height:100%; " >
  		 	     <font size=6>${boardType.boardname}</font>
       <!-- 
       }
		mv.addObject("boardid", article.getBoardid());
		mv.addObject("boardType",boardType);
		mv.addObject("num", article.getNum());
		mv.addObject("ref", article.getRef());
		mv.addObject("re_step", article.getRe_step());
		mv.addObject("re_level", article.getRe_level());
		mv.addObject("pageNum", pageNum);
		mv.addObject("memberid", memberid);
		mv.addObject("studynum",article.getStudynum());
		mv.setViewName("board/writeForm");
       
       
        -->
 	
 <div class="w3-container" style="margin-top:10px">
		<form id="uploadform" method="post" name="writeform" enctype="multipart/form-data">
			  	<input type="hidden" name="writer" value="${memberid}">
			 	<input type="hidden" name="boardid" value="${boardid}">
			 	<input type="hidden" name="studynum" value="${studynum}">
			 	<input type="hidden" name="ref" value="${ref}">
				<input type="hidden" name="re_level" value="${re_level}">
				<input type="hidden" name="num" value="${num}">
				<input type="hidden" name="re_step" value="${re_step}">
		<table class="w3-table w3-card-2 w3-white w3-bordered " style="width: 90%;margin-left:5%">
			<tr>
					<c:if test="${num==0 }">
						<th class="w3-black w3-center" colspan="2" >[글쓰기]</th>
					</c:if>
					<c:if test="${num!=0 }">
						<th class="w3-black w3-center" colspan="2" >[답글쓰기]</th>
					</c:if>
			</tr>
				<tr>
					<th  width="10%" class=" w3-center">제 목</th>
					<td width="90%">
					
					<c:if test="${num==0}">
						<input type="text" size="40" maxlength="50" 
						name="subject" required="required" class="w3-input w3-border-0 w3-hover-light-grey">
					</c:if>
					<c:if test="${num!=0}">
						<input type="text" size="40" maxlength="50" value="[답글] "
						name="subject" required="required" class="w3-input w3-border-0 w3-hover-light-grey">
					</c:if>
					
						
						
					</td>
				</tr>
				<tr>
					<th  width="10%" class=" w3-center">내 용</th>
					<td width="90%"><textarea name="content" rows="10" cols="40"
					class="w3-input w3-border-0 w3-hover-light-grey" required="required"
					></textarea>
					</td>
				</tr>
				<tr>
					<td colspan=2 align="center">
					 <input type="file" name="uploadfile" id="uploadfile">
					</td>
				</tr>
			</table>
				<div class="w3-center w3-padding-16">
				<button type="submit" onclick="upload()" class=" w3-button w3-black">
					<i class="fa fa-check"></i>확인</button>
			<input type="button" value="목록보기" class="w3-black  w3-button" 
					onClick="$('#content').load('../board/study_board?boardid=${boardid}&studynum=${studynum }')">
					<input type="reset" value="다시작성"
					class=" w3-black  w3-button ">
					
			</div>
		</form> 
	</div>  
	
</div></div></div>
<!-- </div> -->
	<script type="text/javascript">
		function upload(){
			event.preventDefault();
			
			var form=$('#uploadform')[0];
			var formData= new FormData(form);
			formData.append("uploadfile",$("#uploadfile")[0].files[0]);
			
			 $.ajax({
                         type: 'POST',
              			 enctype: 'multipart/form-data',
              			 url: '../board/writePro',
                         data: formData,
                         processData: false,
                         contentType: false,
                         success: function(data){
                            $('#content').html(data);
                         }
                 });
		}
	
	</script>
	

</html>
