<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/board05.css" rel="stylesheet">
</head>
<body>
	<header class="header">
		<div class="logo">
			<a href="/main"> <img src="/images/logo.png" alt="프렌즈그램 로고"
				class="logo-image" />
			</a>
		</div>
		<nav class="navigation">
			<a href="#">코딩 게시판</a> <a href="#">팀 모집</a> <a href="#">프리랜서 검색</a> <a
				href="#">프리랜서 공고</a> <a href="/board05">취업 공고</a>
		</nav>
		<div class="actions">
			<a class="login" href="#">로그인</a> <a class="profile" href="#">프로필</a>
			<a class="messages" href="#">메시지</a>
		</div>
	</header>

	<main>
		<div class="container">
			<div class="search-container">
				<div class="search-filters">
					<div class="filter-group">
						<label for="language">개발언어</label> <select id="language">
							<option value="all">전체</option>
							<option value="java">Java</option>
							<option value="python">Python</option>
							<option value="html">HTML</option>
						</select>
					</div>
					<div class="filter-group">
						<label for="workType">근무 형태</label> <select id="workType">
							<option value="all">전체</option>
							<option value="fulltime">정규직</option>
							<option value="freelance">프리랜서</option>
						</select>
					</div>
					<div class="filter-group">
						<label for="region">지역</label> <select id="region">
							<option value="all">전체</option>
							<option value="seoul">서울</option>
							<option value="busan">부산</option>
						</select>
					</div>
				</div>
				<div class="search-input-button">
					<input type="text" id="search" placeholder="채용 공고 검색">
					<button class="search-button">검색</button>
				</div>
			</div>

			<div class="write-button-container">
				<button class="write-button">
					<a href="/board05/write">글쓰기</a>
				</button>
			</div>

			<c:forEach var="board" items="${board05List}">
				<div class="job-post">
					<div class="job-header">
						<h3>${board.company}</h3>
						<!-- 회사명 -->
						<p>작성일: ${board.date}</p>
					</div>
					<div class="job-description">
						<p>${board.title}</p>
					</div>
					<div class="job-details">
						<p>${board.work_area}| 경력기간: ${board.career_period}년</p>
						<!-- 지역 및 경력 기간 -->
						<div class="tags">
							<span class="tag">JAVA</span> <span class="tag">PYTHON</span> <span
								class="tag">HTML</span>
						</div>
						<div class="work-type">
							<c:if test="${board.work_type == true}">
								<span class="work-type-tag red">상주</span>
							</c:if>
							<c:if test="${board.work_type == false}">
								<span class="work-type-tag blue">원격</span>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>


			<div id="page">
				<c:if test="${begin > 1}">
					<a href="?p=1&searchn=${searchn}&search=${search}">처음</a>
					<a href="?p=${begin - 1}&searchn=${searchn}&search=${search}">이전</a>
				</c:if>

				<c:forEach begin="${begin}" end="${end}" var="i">
					<c:choose>
						<c:when test="${i == page}">
							<strong>${i}</strong>
						</c:when>
						<c:otherwise>
							<a href="?p=${i}&searchn=${searchn}&search=${search}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${end < totalPages}">
					<a href="?p=${end + 1}&searchn=${searchn}&search=${search}">다음</a>
					<a href="?p=${totalPages}&searchn=${searchn}&search=${search}">끝</a>
				</c:if>
			</div>

		</div>
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
