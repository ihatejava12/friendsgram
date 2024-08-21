<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
	
	<h1>${subjects}님의 평균 별점 : ${star}</h1>

	<c:forEach items="${relist}" var="rlist">
		<fieldset style="width:350;">
			<span>작성자 : ${rlist.id} / <fmt:formatDate value="${rlist.date}" dateStyle="short"/></span>
			<button onclick="window.open('/reportreview/${rlist.mr_no}', '_blank', 'width=500,height=600, top=50, left=50, scrollbars=yes')">신고하기</button>
			<div>
				<c:if test="${rlist.score == 1}">
					<h4>별점 : ★</h4>
				</c:if>
				<c:if test="${rlist.score == 2}">
					<h4>별점 : ★ ★</h4>
				</c:if>
				<c:if test="${rlist.score == 3}">
					<h4>별점 : ★ ★ ★</h4>
				</c:if>
				<c:if test="${rlist.score == 4}">
					<h4>별점 : ★ ★ ★ ★</h4>
				</c:if>
				<c:if test="${rlist.score == 5}">
					<h4>별점 : ★ ★ ★ ★ ★</h4>
				</c:if>
			</div>
			<div>내용 : ${rlist.content}</div>
		</fieldset>
	</c:forEach>

</body>
</html>