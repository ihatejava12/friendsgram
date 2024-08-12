<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/css/kyh/main.css" rel="stylesheet">
<title>프렌즈그램</title>
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
			<a class="login" href="/loginform">로그인</a> <a class="profile" href="/myprofile">프로필</a>
			<a class="messages" href="/mail" onclick="window.open(this.href, '_blank', 'width=780, height=480'); return false;">메시지</a>
		</div>
	</header>

	<main class="main-content">
		<section class="hero-section">
			<div class="hero-text">
				<h1>원하는 프리랜서를 찾아보세요!</h1>
				<button class="cta-button"><a href="board03/main">프리랜서 찾아보기</a></button>
			</div>
			<div class="hero-image">
				<img src="images/hero.png" alt="프리랜서 이미지">
			</div>
		</section>

		<section class="notice-section">
			<div class="notices">
				<h2 class="noticeshead"><a href="/adminpage/notice">공지사항</a></h2>
				<div class="notice-list">
					<c:forEach var="notice" items="${notices}">
						<div class="notice-item">
							<h3 class="notice-content"><a href="#" class="notice-title">${notice.title}</a> </h3>
								<p class="notice-date"><fmt:formatDate value="${notice.date}" pattern="yyyy-MM-dd" /></p>
							

						</div>
					</c:forEach>
				</div>
			</div>

			<div class="board04-posts">
				<h2 class="board04_head"><a href="/list">프리랜서 공고</a></h2>
				<div class="board04-list">
                <c:forEach var="b04" items="${b04}">
                    <div class="board04-item">
                        <div class="b04_header">
                            <h3 class="board04_title"><a href="#">${b04.title}</a></h3>
                        </div>
                        <div class="b04_details">
                            <p>예상 금액: ${b04.salary}</p>
                            <p>시작 예정일: ${b04.employment_start}</p>
                            <p>예상 기간: ${b04.employment_date}</p>
                            <p>상주, 원격: ${b04.work_type ? "상주" : "원격"}</p>
                            <p>사용 언어: ${b04.b_no04}</p>
                            <p>${b04.join02 ? "모집중" : "모집완료"}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
			</div>
		</section>
	</main>

	<footer class="footer">
		<div class="footer-links">
			<a href="#">프리랜서 이용약관</a> <a href="#">고객센터</a> <a href="#">개인정보
				처리방침</a> <a href="#">광고문의</a>
		</div>
		<div class="company-info">
			<p>(주)프렌즈그램(대표이사: 전재민)</p>
			<p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
		</div>
	</footer>
</body>


</html>
