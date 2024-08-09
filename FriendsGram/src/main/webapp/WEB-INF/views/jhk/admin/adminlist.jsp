<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<li><a href="#">문의사항</a></li>
			<li><a href="#">광고문의</a></li>
			<li><a href="#">홈페이지 광고편집</a></li>
			<li><a href="/adminpage/consent">기업회원 인증 관리</a></li>
			<li><a href="/adminpage/memberlist">비매너 회원 제재</a></li>
			<li><a href="/adminpage/adminlist">관리자 등급 권한 관리</a></li>
			<li><a href="/adminpage/wordlist">금지어 추가 및 관리</a></li>
		</ul>
	</div>
	<div>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>등급</th>
			</tr>
			<c:forEach items="${alist}" var="admin">
				<tr>
					<td><a href="/adminpage/admincontent/${admin.id}">${admin.id}</a></td>
					<td>${admin.email}</td>
					
					<c:if test="${admin.role== 0}">
						<td>일반 회원</td>
					</c:if>
					<c:if test="${admin.role == 1}">
						<td>중간 관리자</td>
					</c:if>
					<c:if test="${admin.role == 2}">
						<td>최종 관리자</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>