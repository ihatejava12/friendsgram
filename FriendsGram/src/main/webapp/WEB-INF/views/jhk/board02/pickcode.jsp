<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<div>
			<h3>원하는 코드 신청하기</h3>

			<form method="post" action="/jointeam">
				<input type="hidden" name="b_no02" value="${list.b_no02}" />
				<input type="hidden" name="id" value="${user.id}" />
				

				<p>
					<span>글 제목 : ${list.title}</span>
				</p>
				<p>
					<span>신청자 : ${user.id}</span>
				</p>
				<p>신고사유</p>
					<c:forEach items="${picklist}" var="plist">
						<label><input type="radio" name="code" value="${plist.code}" />${plist.code}</label><br>
					</c:forEach>				
				<input type="submit" value="신청하기" class="insert" />
			</form>

		</div>
	</fieldset>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function() {
			$(".insert").click(function() {
				alert("신청이 완료되었습니다.");
			})
		})
	</script>
</body>
</html>