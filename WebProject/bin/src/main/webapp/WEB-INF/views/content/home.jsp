<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/stylej01.css" />
<script>
  $( function() {
    var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "BASIC",
      "C",
      "C++",
      "Clojure",
      "COBOL",
      "ColdFusion",
      "Erlang",
      "Fortran",
      "Groovy",
      "Haskell",
      "Java",
      "JavaScript",
      "Lisp",
      "Perl",
      "PHP",
      "Python",
      "Ruby",
      "Scala",
      "Scheme"
    ];
    $( "#search" ).autocomplete({
      source: availableTags
    });
  } );
  </script>
<style >
/* 타이틀이미지 */
@media screen and (min-width:600px) {
	#titleImg {
		width: 470px;
	}
}
</style>
<!-- 개인(김준) css-->

	<title>The Lecture  :: 대학 강의 길라잡이</title>
</head>

<body>
	<div class="container text-center">
		<div class="jumbotron" id="homebox" style="	
		background-image: url('<%=request.getContextPath()%>/images/bg-chairs003.png');">
			<div class="container" id="titleImg">
				<img src="<%=request.getContextPath()%>/images/theLecture2.svg"style="width:50%">
			</div>
			<h1 style="font-family: 'Nanum Barun Gothic';font-weight: 900;color:">The Lecture</h1>
			<h3 style="font-family: 'Nanum Barun Gothic';font-weight: 900;'">대학 강의 길라잡이 The Lecture</h3><br>
			<form class="form-group" action="/Univ_list.do"
				style="text-align: center;">
				<table class="searchform" style="margin: auto;">
					<tr>
						<td><select class="form-control" style="height: 34px;">
								<option value="all">전체</option>
								<option value="univ">대학</option>
						</select></td>
						<td><input type="text" class="form-control" placeholder="검색"
							id="search" size="100%" style="height: 34px;"></td>
						<td>
							<button class="btn btn-default" type="submit"
								style="height: 34px;">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>



</body>


