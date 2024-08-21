<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	
	<fieldset>
		<div>
			<h3>리뷰글 신고하기</h3>

			<form method="post" action="/review/report">
				<input type="hidden" name="r_no" value="${review.b_no02}" /> 
				<input type="hidden" name="num" value="${review.num}" /> 
				<input type="hidden" name="id" value="${review.id}" />
				

				<p>
					<span>내용 : ${review.content}</span>
				</p>
				<p>
					<span>신고자 : ${user.id}</span>
				</p>
				<p>신고사유</p>
					<label><input type="radio" name="report_content" value="욕설" />욕설</label><br>
					<label><input type="radio" name="report_content" value="도배" />도배</label><br>
					<label><input type="radio" name="report_content" value="음란성" />음란성</label><br>
				<br> <input type="submit" value="신고하기" class="report" />
			</form>

		</div>
	</fieldset>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function() {
			$(".report").click(function() {
				alert("신고 완료되었습니다.");
			})
		})
	</script>
	
</body>
</html>