<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 프로필(수정)</title>
 
 <script>
 $(function (){
	 $("#btnUpdate").click(function(){
		 alert(" 회원 정보가 변경 되었습니다.");
		 document.form1.action = "update.do";
		 
		 document.form1.submit();
		 
	 })
 })
</script> 

<style>
.filebox label { display: inline-block; padding: .5em .75em; 
color: white; font-size: inherit; line-height: normal; 
vertical-align: middle; background-color:#00BFFF; cursor: pointer; border: 1px solid #ebebeb; 
border-bottom-color: #e2e2e2; border-radius: .25em; }

 .filebox input[type="file"] { /* /파일 필드 숨기기 */ position: absolute; 
 width: 1px; height: 1px; padding: 0; 
 margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; }



table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}


</style>


</head>
<body>

<table border=1 align=center width=50 class="table">
<form method="post" name="form1" >
      <h2 align="center" >내 프로필</h2>
  <tr class="info">
  <td rowspan="5">
  <article align="center">
  <p id="status"></p>
  <div class="filebox">
  <label for="profileImg">프로필 수정</label>
  <input type="file" id="profileImg">
</div>
  <div id="holder"></div> 
   </article> 
     </td>
      </tr>
      <tr class="info">
     <td> 
         <input type=text value="${dto.email}" readonly="readonly" size="30" name="email">
          <input type=text value="${dto.univ_name}" readonly="readonly" ></td>
       </tr>
      <tr class="success">
    <td>  <input type=checkbox id="email" >메일 공개</td>
    </tr>
    <tr class="danger">
    <td>  
    <input type=text value="${dto.nickname}" size=20 name="nickname">
    <input type=text value="${dto.major }" size=20 name="major"></td>
       </tr>
      <tr class="warning">    
          <td><textarea cols=90 rows=10 name="profile" >${dto.profile }</textarea></td>
      </tr>
      
      <tr class="info"><td colspan=2 align=center>    
           <input type="button" value="회원정보 수정" id="btnUpdate">
        <!--  <a href="update.do" class="btn btn-info" role="button" id="p">회원정보 수정</a>
         -->  <!--  <a href="profile2.html" class="btn btn-info" role="button" id="p">저장</a>
           --></td>
          </tr>
 </form>      
</table>            

<script> 
var upload = document.getElementsByTagName('input')[0],
holder = document.getElementById('holder'),
state = document.getElementById('status');

if (typeof window.FileReader === 'undefined') {
state.className = 'fail';
} else {
state.className = 'success';
state.innerHTML = '';
}

upload.onchange = function (e) {
e.preventDefault();

var file = upload.files[0],
  reader = new FileReader();
reader.onload = function (event) {
var img = new Image();
img.src = event.target.result;
// note: no onload required since we've got the dataurl...I think! :)
if (img.width < 100000) { // holder width
  img.width = 95;
  img.height = 195;
}
holder.innerHTML = '';
holder.appendChild(img);
};
reader.readAsDataURL(file);

return false;
};
</script>

</body>
</html>