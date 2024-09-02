<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link href="/css/kyh/content.css" rel="stylesheet">
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
			<a class="messages" href="/mail" onclick="window.open(this.href, '_blank', 'width=780, height=480,left=600,top=200'); return false;">메시지</a>
		</div>
	</header>
	
	<main>
		<div>
			<h3>문의하기</h3>
			<a href="/question">목록으로 돌아가기</a>
		</div>
		<div class="table-container">
			<table>
				<tr>
					<th>제목</th>
					<td>${qcontent.title}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${qcontent.id}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><fmt:formatDate value="${qcontent.date}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${qcontent.content}</td>
				</tr>
				<tr>
					<th>답변</th>
					<td>
						<c:if test="${qcontent.request == false}">
							답변 대기중
						</c:if>
						<c:if test="${qcontent.request == true}">
							${qacontent.content}
						</c:if>
					</td>
				</tr>
			</table>
		</div>
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
