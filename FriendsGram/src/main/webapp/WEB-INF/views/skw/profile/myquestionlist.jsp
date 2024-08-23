<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>여기 맞는데..?</title>
</head>
<body>
	
		<table border="1">
			<tr>
				<th>글 번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>구분</th>
				<th>답변 여부</th>
			</tr>
			<c:forEach items="${qlist}" var="list">
				<tr>
					<td>${list.q_no}</td>
					<td>${list.title}</td>
					<td>${list.date}</td>
					
					<c:if test="${list.question_type == 0}">
						<td>계정관련 문의</td>
					</c:if>
					<c:if test="${list.question_type == 1}">
						<td>법적 문제</td>
					</c:if>
					<c:if test="${list.question_type == 2}">
						<td>기타 문의</td>
					</c:if>
					
					<c:if test="${list.request == true}">
						<td><button onclick="window.open('/question/answer/${list.q_no}', '_blank', 'width=810, height=600, top=50, left=50, scrollbars=yes')">답변보기</button></td>
					</c:if>
					<c:if test="${list.request == false}">
						<td>답변 대기중</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		
		<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="myquestion?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="myquestion?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="myquestion?p=${end+1}">[다음]</a>
				</c:if>
			</div>
	
</body>
</html>