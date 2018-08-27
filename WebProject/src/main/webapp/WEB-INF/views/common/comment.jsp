<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script>
		function addComment(selectedId){
//			var comment_info = $("#submit_comment_form").serialize();
			
			//선택된 곳에서 가장 가까운  form 태그 선택
			var frm = $("#"+selectedId).closest('form');
			var comment_info = frm.serialize();
		 	
			 console.log(comment_info);
			  $.ajax({
	    		url : "addandGetLectureComment.do",
	    		dataType : "text",
	    		data : {"comment_info":comment_info},
	    		success : 
    			function(data, response) {
	    			alert(data);	
	    			
	    		}
	    	})  
		}
		$(function(){
			//댓글 달기
			$("* .submit_comment").on("click",function(){
				addComment(this.id);
			});
			$("* .comment_area").keypress(function(e) {
			    if(e.which == 13) {
			    	addComment(this.id);
			    	/* var commentButton = $("#"+selectedId).closest('button[type=button]');	
			    	commentButton. */
			    }
			});
		})
	</script>


<input type="hidden" id="comment_level">



<!--댓글로-->
	<div class="form-group">
		<form id="submit_comment_form" name="submit_comment_form" action="addLectureComment">
			
			<input type="hidden" name="lecture_id" value='${lb.lecture_id}'>
			<textarea name="content" id="comment_area" class="comment_area form-control" rows="5" class="comment" width="100%"
				placeholder="공개 댓글 추가"></textarea>
			<div class="reply-button-container">
				
				<button type="reset" class="button_block">취소</button>
				<button id="submit_comment" type="button" class="submit_comment button_block">댓글 작성</button>
			</div>
		</form>
	</div>
	<!-- comment의 내용 개수 -->
	<c:if test=""></c:if>
	<!-- comment 나타내기 -->
	<!-- comment 있을 경우-->
	<c:if test="">댓글이 아직 작성되지 않았습니다.</c:if>
	<!-- comment 없을 경우-->
	<c:if test=""></c:if>
	
<div class="reply-container container">
	<div class="reply-cotainer-header">댓글</div>
	<!--container 하나에 하나의 댓글 대댓글이 모두 들어감. -->
	<div class="reply-container-content">
		<div class="reply-body">
			<div class="reply">
				<ul class="list-group">
					<li class="list-group-item"><a href="">작성자명</a> 댓글 coment
						Lorem ipsum dolor sit amet consectetur adipisicing elit. Enim
						tenetur deserunt necessitatibus suscipit consectetur voluptates
						soluta vitae cupiditate voluptatum. Neque facere sint porro
						incidunt excepturi molestias ratione laboriosam, possimus sunt!</li>
					<li class="list-group-item"><a
						class="glyphicon glyphicon-thumbs-up" href="#">${num}</a> <a
						class="glyphicon glyphicon-thumbs-down" href="#"></a> &nbsp; <a
						class="re-reply" href="javascript:;"> 답글달기 </a>

						
						<form class="re-reply-form">
							<!--collapse뒤의 아이디는 jsp에서 불러옴-->
							<div class="form-group collapse" id="collapse1">
								<hr />
									<input type="hidden" name="lecture_id" value='1'>
									<input type="hidden" name="depth" value='1'>
									<input type="hidden" name="ref" value=''>
									<textarea name="content" id="reply_comment_area" class="comment_area form-control" rows="5" class="comment" width="100%"
										placeholder="공개 댓글 추가"></textarea>
									<div class="reply-button-container">
										<button type="reset" class="button_block">취소</button>
										<button type="button" id="submit_reply_comment" class="submit_comment button_block">댓글 작성</button>
									</div>
							</div>
						</form></li>


				</ul>
			</div>
			<!--답글 : 답글이 있으면 개수 fetch해서 불러옴-->
			<div class="re-reply">
				<!--답글 보기, 숨기기: 답글이 있으면 답글 보기 있음. 답글 보기 누르면 답글 보여짐-->


				&nbsp;<a class="show-hide-replies" href="javascript:;">답글 보기</a> <br />
				<br />

				<div class="re-reply-container">
					<!--reply container하나에 댓글에 대한 대댓글이 모두 들어감. -->
					<div class="reply-container-content">

						<div class="reply-body">

							<div class="reply">
								<ul class="list-group">
									<li class="list-group-item"><a href="">작성자명</a> 댓글 coment
										Lorem ipsum dolor sit amet consectetur adipisicing elit. Enim
										tenetur deserunt necessitatibus suscipit consectetur
										voluptates soluta vitae cupiditate voluptatum. Neque facere
										sint porro incidunt excepturi molestias ratione laboriosam,
										possimus sunt!</li>
									<li class="list-group-item"><a
										class="glyphicon glyphicon-thumbs-up" href="#">${num}</a> <a
										class="glyphicon glyphicon-thumbs-down" href="#"></a> &nbsp; <a
										class="re-reply" href="javascript:;"> 답글달기 </a>

										<form class="re-reply-form">

											<div class="form-group1">
												<hr />
												<textarea class="form-control" rows="5" class="comment"
													width="100%" placeholder="답글쓰기"></textarea>
												<div class="reply-button-container">
													<button type="reset" class="button_block">취소</button>
													<button class="button_block">댓글 작성</button>
												</div>
											</div>
										</form></li>


								</ul>
							</div>
							<!--답글 : 답글이 있으면 개수 fetch해서 불러옴-->
							<div class="re-reply">
								<!--답글 보기, 숨기기: 답글이 있으면 답글 보기 있음. 답글 보기 누르면 답글 보여짐-->

								&nbsp;<a class="show-hide-replies" href="javascript:;">답글 보기</a>


							</div>
						</div>
						<div class="author-thumbnail">
							<div class="author-picture">
								<!--후에 백엔드에서 뽑아서 들어갈 예정-->
								<a href="#"> <img src="/images/person_example.jpg" />
								</a>
							</div>

						</div>
					</div>
				</div>


			</div>
		</div>
		<div class="author-thumbnail">
			<div class="author-picture">
				<!--후에 백엔드에서 뽑아서 들어갈 예정-->
				<a href="#"> <img src="/images/person_example.jpg" />
				</a>
			</div>

		</div>
	</div>

</div>



