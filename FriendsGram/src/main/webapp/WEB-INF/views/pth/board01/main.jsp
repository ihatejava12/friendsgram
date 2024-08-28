<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>FriendsGram</title>

<style>





* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

.header {
	position: fixed; /* 헤더를 화면에 고정 */
	top: 0; /* 화면 상단에 위치 */
	left: 0; /* 화면 왼쪽에 위치 */
	width: 100%; /* 화면 너비에 맞게 설정 */
	z-index: 1000; /* 다른 요소 위에 보이도록 설정 */
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 20px;
	background-color: #fff;
	box-shadow: 0px 3px 6px rgba(18, 18, 18, 0.1);
}

html, body {
	height: 100%;
	margin: 0;
}

body {
	margin-top: 80px; /* 헤더 높이만큼의 여백 추가 */
}

.logo img {
	height: 50px;
	width: auto;
}

.navigation a {
	margin-right: 15px;
	color: #565E6C;
	font-weight: bold;
	text-decoration: none;
}

.actions a {
	margin-left: 10px;
	color: #0C9200;
	font-weight: bold;
	text-decoration: none;
}

main {
	font-family: 'Inter', sans-serif;
	font-size: 14px;
	line-height: 1.6;
	display: flex;
	flex-direction: column;
	min-height: 100vh; /* Ensures full viewport height is covered */
	margin: 0;
	overflow-x: hidden; /* Prevents horizontal scrolling */
}

.footer {
	background-color: rgba(30, 33, 40, 0.68);
	color: white;
	padding: 30px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-wrap: wrap;
	width: 100%;
	margin-top: auto; /* 푸터가 페이지의 끝에 위치하도록 설정 */
	position: relative; /* 포지션 속성을 고정하지 않음 */
}

.footer-links a {
	margin-right: 15px;
	color: white;
	text-decoration: none;
	font-weight: bold;
}

.company-info p {
	margin-top: 10px;
	font-size: 14px;
}

a {
	text-decoration: none;
}

.hero-image img {
	margin-top: 20px;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 20px;
	background-color: #fff;
	box-shadow: 0px 3px 6px rgba(18, 18, 18, 0.1);
}

.logo img {
	height: 50px; /* Adjust this value as needed */
	width: auto;
}

.navigation a {
	margin-right: 15px;
	color: #565E6C;
	font-weight: bold;
	text-decoration: none;
}

.actions a {
	margin-left: 10px;
	color: #0C9200;
	font-weight: bold;
	text-decoration: none;
}

table {
	border: none;
	width: 100%;
	border-collapse: collapse;
}

th {
	text-align: center;
}

tr {
	border-bottom: 1px solid #ddd;
}

#allcontent {
	margin: 30px auto;
}

#headcontent {
	background-color: lightgreen;
}
</style>

</head>
<body>
	<!--  bList begin end count pageNum totalPages -->
	<div>
		<header class="header">
			<div class="logo">
				<a href="/main"> <img src="/images/logo.png" alt="프렌즈그램 로고"
					class="logo-image" />
				</a>
			</div>
			<nav class="navigation">
				<a href="/board01/main">코딩 게시판</a> <a href="/board02/main">팀 모집</a>
				<a href="/board03/main">프리랜서 검색</a> <a href="/list">프리랜서 공고</a> <a
					href="/board05">취업 공고</a>
			</nav>
			<div class="actions">
				<c:if test="${user.id != null }">
					<a class="login" href="/logout">로그아웃</a>
				</c:if>
				<c:if test="${user.id == null }">
					<a class="login" href="/loginform">로그인</a>
				</c:if>

				<a class="profile" href="/myprofile">프로필</a> <a class="messages"
					href="/mail"
					onclick="window.open(this.href, '_blank', 'width=780, height=480'); return false;">메시지</a>
			</div>
		</header>

	</div>
	<hr>

	<main>
		<div id="headcontent" align="center"
			style="height: 200px; padding: 40px;">
			<h1>코딩 게시판</h1>
			<br>
			<br>
			<form method="get" action="/board01/searchcontent">
				<div class="search-container" style="display:flex; flex-wrap:nowrap; justify-content:center; ">
					
						<div class="filter-group" style="margin: 10px;">
							<label for="selectskil">개발언어</label><br> <select
								id="selectskil" name="skil">
								<option value="all">전체</option>
								<option value="java">JAVA</option>
								<option value="python">PYTHON</option>
								<option value="html">HTML</option>
								<option value="database">DATABASE</option>
								<option value="other">직접 입력</option>
							</select> <input id="addskil" name="addskil" style="display: none;"
								size="10" />
						</div>

						<div class="filter-group" style="margin: 10px;">
							<label for="selectcategory">검색 기준</label><br> <select
								id="selectcategory" name="category">
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="all">제목+내용</option>
							</select>
						</div>
						<br>
					
					<div style="margin: 31px 10px;">
						<input name="search" type="text" placeholder="검색어를 입력해주세요">
						<input type="submit" value="검색" />
					</div>
				</div>
			</form>
		</div>

		<hr>
		<div id="allcontent" style="width:80%; height:100%;">
			<div align="right">
				<button>
					<a href="/board01/main">목록</a>
				</button>
				<button>
					<a href="/board01/write">글쓰기</a>
				</button>
			</div>

			<hr>

			<div align="left">
				<button>
					<a href="/board01/main">전체</a>
				</button>
				<button>
					<a href="/board01/myarticle">내 글</a>
				</button>
				<button>
					<a href="/board01/mycoment">내 댓글</a>
				</button>
			</div>
			<hr>

			<div>
				<c:if test="${count != 0}">
					<table>
						<tr>
							<th style="width: 10%;">번호</th>
							<th style="width: 15%;">개발언어</th>
							<th style="width: 40%;">제목</th>
							<th style="width: 15%;">작성자</th>
							<th style="width: 10%;">작성일</th>
							<th style="width: 10%;">조회수</th>
						</tr>
						<c:forEach items="${blist }" var="board">
							<tr>
								<td style="text-align: center;">${board.b_no01 }</td>
								<td style="text-align: center;">${board.code }</td>
								<td><a href="content/${board.b_no01}">${board.title }</a></td>
								<td style="text-align: center;">${board.id }</td>
								<td style="text-align: center;"><fmt:formatDate
										value="${board.date }" dateStyle="short" /></td>
								<td style="text-align: center;">${board.readcount }</td>
							</tr>

						</c:forEach>
					</table>

					<div id="page" align="center">
						<c:if test="${begin > pageNum }">
							<a href=#>[이전]</a>
						</c:if>
						<c:forEach begin="${begin }" end="${end}" var="i">
							<a href="/board01/main?p=${i }">${i}</a>
						</c:forEach>
						<c:if test="${end < totalPages }">
							<a href=#>[다음]</a>
						</c:if>
					</div>

				</c:if>
				<c:if test="${count == 0 }">
	게시글이 존재하지 않습니다.
</c:if>

			</div>

		</div>
	</main>



	<footer class="footer" role="contentinfo">
		<div class="footer-links">
			<a href="#">프리랜서 이용약관</a> <a href="#">고객센터</a> <a href="#">개인정보
				처리방침</a> <a href="#">광고문의</a>
			<c:if test="${ user.role == 2 || user.role == 1}">
				<a href="/adminpage/board01">관리자</a>
			</c:if>
		</div>
		<div class="company-info">
			<p>(주)프렌즈그램(대표이사: 전재민)</p>
			<p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
		</div>
	</footer>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script>
		$(function() {

			$("#selectskil").change(function() {
				if ($("#selectskil").val() == 'other') {
					$("#addskil").show();
				}
			})

		})
	</script>



</body>


</html>