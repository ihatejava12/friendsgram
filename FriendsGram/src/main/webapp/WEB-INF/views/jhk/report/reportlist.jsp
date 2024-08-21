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
			<li><a href="/adminpage/questionlist">문의사항</a></li>
			<li><a href="/adminpage/advertisinglist">광고문의</a></li>
			<li><a href="#">홈페이지 광고편집</a></li>
			<li><a href="/adminpage/consent">기업회원 인증 관리</a></li>
			<li><a href="/adminpage/memberlist">비매너 회원 제재</a></li>
			<li><a href="/adminpage/adminlist">관리자 등급 권한 관리</a></li>
			<li><a href="/adminpage/wordlist">금지어 추가 및 관리</a></li>
			<li><a href="/adminpage/reportlist">신고 상황</a></li>
		</ul>
	</div>
	<div>
		<ul>
			<li><a href="/adminpage/board01">코딩 게시판</a></li>
			<li><a href="/adminpage/board02">팀 모집</a></li>
			<li><a href="/adminpage/board03">프리랜서 검색</a></li>
			<li><a href="/adminpage/board04">프리랜서 공고</a></li>
			<li><a href="/adminpage/board05">취업 공고</a></li>
		</ul>
	</div>
	<hr>
	<table border="1">
		<tr>
			<th>신고 내용</th>
			<th>아이디</th>
			<th>해당 글보기</th>
		</tr>
		<c:forEach items="${rlist}" var="list">
			<tr>
				<td>${list.report_content}</a></td>
				<td>${list.id}</td>
				<td><button onclick="window.open('/adminreportboard/${list.num}/${list.r_no}/${list.co_no}', '_blank', 'width=500,height=600, top=50, left=50, scrollbars=yes')">바로가기</button></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>