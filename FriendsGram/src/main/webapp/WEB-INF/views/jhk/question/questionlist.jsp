<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div>
		<ul>
			<li><a href="/adminpage/board01">게시판 관리</a></li>
			<li><a href="/adminpage/notice">공지사항</a></li>
			<li><a href="/adminpage/questionlist">문의사항</a></li>
			<li><a href="/adminpage/advertisinglist">광고문의</a></li>
			<li><a href="#">홈페이지 광고편집</a></li>
			<li><a href="/adminpage/consent">기업회원 인증 관리</a></li>
			<li><a href="/adminpage/memberlist">비매너 회원 제재</a></li>
			<li><a href="/adminpage/adminlist">관리자 등급 권한 관리</a></li>
			<li><a href="/adminpage/wordlist">금지어 추가 및 관리</a></li>
		</ul>
	</div>
	<hr>
	
	<form action="/adminpage/questionlist">
		<select name="searchn">
			<option value="3">전체</option>
			<option value="0">계정 관련</option>
			<option value="1">법적 문제</option>
			<option value="2">기타 문의</option>
		</select>
		<input type="text" name="content" placeholder="입력하세요.">
		<input type="submit" value="검색">
	</form>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>구분</th>
			<th>답변 여부</th>
			<th></th>
		</tr>
		<c:forEach items="${qlist}" var="question">
			<tr>
				<td>${question.q_no}</td>
				
				<%-- <c:if test="${question.request == false}">
					<td><a href="/question/writeanswer/${question.q_no}">${question.title}</a></td>
				</c:if> --%>
				<td><a href="/onequestion/${question.q_no}">${question.title}</a></td>
				
				<td><fmt:formatDate value="${question.date}" dateStyle="short"/></td>
				
				<c:if test="${question.question_type == 0}">
					<td>계정관련 문의</td>
				</c:if>
				<c:if test="${question.question_type == 1}">
					<td>법적 문제</td>
				</c:if>
				<c:if test="${question.question_type == 2}">
					<td>기타 문의</td>
				</c:if>
				
				<c:if test="${question.request == true}">
					<td>답변 완료</td>
				</c:if>
				<c:if test="${question.request == false}">
					<td>답변 대기중</td>
				</c:if>
				
				<c:if test="${question.request == false}">
					
				</c:if>
				<c:if test="${question.request == true}">
					<td><a href="/question/answer/${question.q_no}">답변보기</a></td>
					<td><button onclick="window.open('/question/answer/${question.q_no}', '_blank', 'width=700, height=600, top=50, left=50, scrollbars=yes')">답변보기</button></td>
				</c:if>
			</tr>
		</c:forEach>			
	</table>
	<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="questionlist?p=${begin-1}&content=${content}&searchn=${searchn}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="questionlist?p=${i}&content=${content}&searchn=${searchn}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="questionlist?p=${end+1}&content=${content}&searchn=${searchn}">[다음]</a>
				</c:if>
			</div>
	
</body>
</html>