<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<h1>리뷰 남길 팀원을 선택하세요</h1>
		<c:forEach items="${tlist}" var="list">
			<c:if test="${user.id != list.id}">
				<div><a href="/writereview/${list.id}/${list.b_no02}">${list.id}</a></div>
			</c:if>
		</c:forEach>
	</fieldset>
</body>
</html>