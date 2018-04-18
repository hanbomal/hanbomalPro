<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #000000;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

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
</style>





<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- content -->
<div class="w3-container bgimg-1" style="padding: 128px 16px;"
	id="about">


	<div class="w3-section w3-row-padding">
		<div class="w3-third">&nbsp;</div>

		<div class="w3-third w3-container ">
			<div class="w3-container w3-teal">


				<h6>방 만들기</h6>
			</div>
			<div class="w3-card-4">
				<div style="overflow: auto; background: rgba(241, 241, 241, 0.75);">
					<div class="w3-container">
						<p>
						<form action="makingPro" enctype="multipart/form-data"
							method="post">
							<div class="w3-center">
								⦁그룹명:&nbsp;&nbsp; <input type="text" name="studyName"
									style="border: none; width: 70%" required>
								<p>
							</div>
							<div class="w3-center">
								⦁방소개:&nbsp;&nbsp; <input type="text" name="study_intro"
									style="border: none; width: 70%" required>
								<p>
							</div>

							[그룹 사진 설정]
							<div class="w3-row">
							<div class="filebox w3-half">
								<label for="pro" style="margin-left:15px;margin-right:15px">┼프로필</label> <input type="file"
									id="pro" name="study_pro" accept="image/*">
							<img id="preview1" width=70 height=50 >		
							</div>


							<div class="filebox w3-half">
								<label for="back" style="margin-left:15px;margin-right:15px">┼배경</label> <input type="file"
									id="back" name="study_back">
							<img id="preview2" width=70 height=50  >	
							</div>
							</div>
							
							<div>
							<input class="w3-input w3-teal w3-section" type="submit" value="만들기">
							</div>
							
						</form>


					</div>


				</div>
			</div>
		</div>
	</div>





</div>
<script>
var file = document.querySelector('#pro');
var file2 = document.querySelector('#back');

file.onchange = function () { 
    var fileList = file.files ;
    
    // 읽기
    var reader = new FileReader();
    reader.readAsDataURL(fileList [0]);

    //로드 한 후
    reader.onload = function  () {
        document.querySelector('#preview1').src = reader.result ;
    }; 
}; 

file2.onchange = function () { 
    var fileList2 = file2.files ;
    
    // 읽기
    var reader2 = new FileReader();
    reader2.readAsDataURL(fileList2 [0]);

    //로드 한 후
    reader2.onload = function  () {
        document.querySelector('#preview2').src = reader2.result ;
    }; 
}; 

</script>
</html>
