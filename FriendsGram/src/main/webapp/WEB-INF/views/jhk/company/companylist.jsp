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
		</ul>
	</div>
	<hr>
	<form action="/adminpage/consent">
		<select name="searchn">
			<option value="3">전체</option>
			<option value="0">확인중</option>
			<option value="1">등록완료</option>
			<option value="2">등록거절</option>
		</select>
		<input type="text" name="company" placeholder="회사명을 입력하세요.">
		<input type="submit" value="검색">
	</form>
	
	<table border="1">
		<tr>
			<th>회사명</th>
			<th>사업자등록번호</th>
			<th>상태</th>
		</tr>
		<c:forEach items="${comlist}" var="clist">
			<tr>
				<td><a href="/adminpage/contentc/${clist.id}">${clist.company}</a></td>
				<td>${clist.business_number}</td>
				
				<c:if test="${clist.company_consent == 0}">
					<td>확인중</td>
				</c:if>
				<c:if test="${clist.company_consent == 1}">
					<td>등록완료</td>
				</c:if>
				<c:if test="${clist.company_consent == 2}">
					<td>등록거절</td>
				</c:if>
			</tr>
		</c:forEach>			
	</table>
	<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="consent?p=${begin-1}&company=${company}&searchn=${searchn}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="consent?p=${begin-1}&company=${company}&searchn=${searchn}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="consent?p=${begin-1}&company=${company}&searchn=${searchn}">[다음]</a>
				</c:if>
			</div>
	
	
</body>
</html>