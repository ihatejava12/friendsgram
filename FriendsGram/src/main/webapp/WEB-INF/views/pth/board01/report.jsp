<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<!--  content 라는 이름으로, 신고당한 글 정보 가져옴 -->
<div>
	<h3>신고하기</h3>
	
	<form method="post" action="/board01/report/confirm">
		<input type="hidden" name="r_no" value="${content.b_no01 }"/>
		<input type="hidden" name="num" value="${content.num }"/>
		
		<input type="hidden" name="id" value="pth"/>
		
		<p><span>글 제목</span> <span>${content.title }</span></p>
		<p><span>신고자</span>	<span>(세션에 저장된 user.id)</span></p>
		<p>신고사유</p>
		<label><input type="radio" name="report_content" value="욕설"/>욕설</label><br>
		<label><input type="radio" name="report_content" value="도배"/>도배</label><br>
		<label><input type="radio" name="report_content" value="음란성"/>음란성</label><br><br>
		
		<input type="submit" value="신고하기" class="report"/>
	</form>
	
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$(".report").click(function(){
			alert("신고 완료되었습니다.");
		})
	})
	
	
</script>


</body>
</html>