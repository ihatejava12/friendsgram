<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/kyh/questionwrite.css" rel="stylesheet">
</head>
<body>
	<header class="header">
		<div class="logo">
			<a href="/main"> <img src="images/logo.png" alt="프렌즈그램 로고"
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
		<form action="/question/write" method="post">
			<label>어이디</label>
			<input type="text" id="id" name="id" value="${user.id }" readonly><br>
			<label>구분</label>
			<select id="question_type" name="question_type">
				<option value="0">계정관련 문의</option>
				<option value="1">법적 문의</option>
				<option value="2">기타 문의</option>
			</select><br>
			<label>제목</label>
			<input type="text" id="title" name="title" /><input type="checkbox" value="hide">비밀글</input><br>
			<label>작성자</label>
			<input type="text" id="name" name="name" value="${user.name }" disabled><br>
			<label for="content">내용:</label>
    		<textarea id="content" name="content"></textarea><br>				
			<input type="submit" value="등록"><a href="/question"><input type="button" value="취소"></a>

		</form>
	</main>
	
	<footer class="footer">
		<div class="footer-links">
			<a href="#">프리랜서 이용약관</a> <a href="/question">고객센터</a> <a href="#">개인정보
				처리방침</a><c:if test="${user.role == 3 }"><a href="/advertising/question">광고문의</a></c:if><c:if test="${user != null && user.role == 2 || user.role == 1}"><a href="/adminpage/board01">관리자</a></c:if>
		</div>
		<div class="company-info">
			<p>(주)프렌즈그램(대표이사: 전재민)</p>
			<p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
		</div>
	</footer>
</body>
</html>