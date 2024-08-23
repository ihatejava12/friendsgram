<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/kyh/cslist.css" rel="stylesheet">
</head>
<body>
	<header class="header">
		<div class="logo">
			<a href="/main"> <img src="../images/logo.png" alt="프렌즈그램 로고"
				class="logo-image" />
			</a>
		</div>
		<nav class="navigation">
			<a href="board01/main">코딩 게시판</a>  <a href="board02/main">팀 모집</a> <a href="board03/main">프리랜서 검색</a>
			 <a	href="/list">프리랜서 공고</a> <a href="/board05">취업 공고</a>
		</nav>
		<div class="actions">
			<c:if test="${user.id != null }">
			<a class="login" href="/logout">로그아웃</a>
			</c:if>
			<c:if test="${user.id == null }">
			<a class="login" href="/loginform">로그인</a>
			</c:if>
			
			 <a class="profile" href="/myprofile">프로필</a>
			<a class="messages" href="/mail" onclick="window.open(this.href, '_blank', 'width=780, height=480'); return false;">메시지</a>
		</div>
	</header>
	
	<main>
		<form action="/question/search" method="get">
		    <input type="text" name="keyword" placeholder="검색어를 입력하세요">
		    <button type="submit">검색</button>
		</form>
		<botton>
			<a href="/question/write">문의하기</a>
		</botton>
		<div>
			<table>
				<tr>
					<th>문의번호</th>
					<th>문의유형</th>
					<th>제목</th>
					<th>작성일</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>답변여부</th>
				</tr>
				<c:forEach var="qlist" items="${qlist }">
			        <tr>
			            <td>${qlist.q_no }</td>
			            <td>
						    <c:if test="${qlist.question_type == 0}">계정관련 문의</c:if>
						    <c:if test="${qlist.question_type == 1}">법적 문의</c:if>
						    <c:if test="${qlist.question_type == 2}">기타 문의</c:if>
						</td>
			            <td><a href="/question/${qlist.q_no}">${qlist.title }</a></td>
			            <td><fmt:formatDate value="${qlist.date }" pattern="yyyy-MM-dd" /></td>
			            <td>${qlist.id }</td>
			            <td>###</td>
			            <td>
						    <c:if test="${qlist.request == true}">답변완료</c:if>
						    <c:if test="${qlist.request == false}">접수완료</c:if>
						</td>
			        </tr>
		    	</c:forEach>
			</table>
		</div>
	</main>
	
	<footer class="footer">
		<div class="footer-links">
			<a href="#">프리랜서 이용약관</a> <a href="/question">고객센터</a> <a href="#">개인정보
				처리방침</a> <a href="#">광고문의</a><c:if test="${user != null && user.role == 2 || user.role == 1}"><a href="/adminpage/board01">관리자</a></c:if>
		</div>
		<div class="company-info">
			<p>(주)프렌즈그램(대표이사: 전재민)</p>
			<p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
		</div>
	</footer>
</body>
</html>