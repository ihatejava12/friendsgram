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
	
	
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>회사명</th>
			<th>작성일</th>
			<th>답변 여부</th>
		</tr>
		<c:forEach items="${alist}" var="advertising">
			<tr>
				<td>${advertising.a_no}</td>
				<td><a href="/advertising/${advertising.a_no}">${advertising.title}</a></td>
				<td>${advertising.company}</td>
				<td><fmt:formatDate value="${advertising.date}" dateStyle="short"/></td>
				
				<c:if test="${advertising.request == true}">
					<td>확인 완료</td>
				</c:if>
				<c:if test="${advertising.request == false}">
					<td>확인중</td>
				</c:if>
			</tr>
		</c:forEach>			
	</table>
	<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="advertisinglist?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="advertisinglist?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="advertisinglist?p=${end+1}">[다음]</a>
				</c:if>
			</div>

</body>
</html>