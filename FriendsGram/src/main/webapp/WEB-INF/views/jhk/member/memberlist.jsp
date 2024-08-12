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
	<div>
	<form action="/adminpage/memberlist">
		<select name="searchn">
			<option value="0">전체</option>
			<option value="1">아이디</option>
			<option value="2">이름</option>
		</select>
		<input type="text" placeholder="아이디 혹은 이름을 입려하세요" name="search">
		<input type="submit" value="검색">
	</form>
	
	
	<div>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>제재 횟수</th>
				<th>제재 여부</th>
			</tr>
			<c:forEach items="${mlist}" var="member">
				<tr>
					<td><a href="/adminpage/membrcontent/${member.id}">${member.id}</a></td>
					<td>${member.name}</td>
					<td>${member.sanction}</td>
					
					<c:if test="${member.r_consent == false}">
						<td>사용 불가</td>
					</c:if>
					<c:if test="${member.r_consent == true}">
						<td>사용 가능</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="memberlist?p=${begin-1 }&search=${search}&searchn=${searchn}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="memberlist?p=${i}&search=${search}&searchn=${searchn}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="memberlist?p=${end+1}&search=${search}&searchn=${searchn}">[다음]</a>
				</c:if>
			</div>
		</div>
	
	
	
	
	
</body>
</html>