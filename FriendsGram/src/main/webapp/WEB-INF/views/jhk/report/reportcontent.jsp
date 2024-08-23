<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<c:if test="${b1 != null}">
	<c:forEach items="${b1}" var="b1">
		<fieldset>
			<div>
				<h3>코딩 게시판 신고글</h3>
					
					<p>
						<span>글 내용 : ${b1.content}</span>
					</p>
					<p>
						<span>작성자 : ${b1.id}</span>
					</p>
	
			</div>
		</fieldset>
	</c:forEach>
	</c:if>
	<c:if test="${b2 != null}">
	<c:forEach items="${b3}" var="b2">
		<fieldset>
			<div>
				<h3>모집 게시판 신고글</h3>
					
					<p>
						<span>글 내용 : ${b2.content}</span>
					</p>
					<p>
						<span>작성자 : ${b2.id}</span>
					</p>
	
			</div>
		</fieldset>
	</c:forEach>
	</c:if>
	<c:if test="${bc1 != null}">
	<c:forEach items="${bc1}" var="bc1">
		<fieldset>
			<div>
				<h3>코딩 게시판 댓글 신고글</h3>
	
					<p>
						<span>글 내용 : ${bc1.content}</span>
					</p>
					<p>
						<span>작성자 : ${bc1.id}</span>
					</p>
	
			</div>
		</fieldset>
	</c:forEach>
	</c:if>
	<c:if test="${bc2 != null}">
	<c:forEach items="${bc2}" var="bc2">
		<fieldset>
			<div>
				<h3>모집 게시판 댓글 신고글</h3>
	
					<p>
						<span>글 내용 : ${bc2.content}</span>
					</p>
					<p>
						<span>작성자 : ${bc2.id}</span>
					</p>
	
			</div>
		</fieldset>
	</c:forEach>
	</c:if>
</body>
</html>