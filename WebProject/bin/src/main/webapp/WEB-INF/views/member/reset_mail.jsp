<!--비밀번호 재설정할때 받을 이메일-->

<!Document>
<html>
<head></head>
<body></body>
<style>
.container {
	padding: 20px;
	background: #eeeeee;
	border: 1px solid #999999;
}

.jumbotron {
	margin: 20px;
	background: #eeeeee;
}

.btn {
	font-size: 2px;
}
/* 지메일에서는 <style>태그가 먹히지 않음 */
</style>
<div class="container"
	style="padding: 20px; background: #eeeeee; font-size: 16px; border: 1px solid #999999;">
	<div class="jumbotron" style="margin: 20px; background: #eeeeee;">
		<h3>비밀번호 재설정</h3>
		안녕하세요. ${회원}님<br> 본 링크를 클릭하여 비밀번호 재설정을 하시길 바랍니다.<br> 본인이 요청한
		메일이 아닌 경우, 개인정보 보호를 위해 비밀번호를 다시 설정하시길 바랍니다. <br> <br> <a
			class="btn"
			style="color: white; text-decoration: none; font-size: 14px; border-radius: 3px; background-color: #337ab7; padding: 8px 12px; border: none">비밀번호
			재설정</a><br>
		<br>
		<p style="font-size: 12px; color: #444444">버튼이 동작하지 않으면 아래의 링크를
			웹브라우저에 붙여넣으십시오.</p>
	</div>
</div>


</html>