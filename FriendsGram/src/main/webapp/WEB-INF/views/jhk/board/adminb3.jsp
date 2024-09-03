<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

.container {
	display: flex;
	flex-direction: column;
	min-height: 100vh; /* 컨테이너가 전체 화면을 차지하도록 설정 */
}

header {
	background-color: #f8f9fa; /* 부드러운 회색 배경 */
	padding: 10px 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	text-align: center; /* 중앙 정렬 */
	margin-bottom: 20px; /* main과 footer 간격을 조정 */
}

header h1 {
	margin: 0;
	font-size: 24px;
	color: #343a40; /* 짙은 회색 텍스트 */
}

header nav {
	margin-top: 10px; /* h1 태그와 a 태그 사이의 간격 */
	display: flex;
	justify-content: center;
	gap: 15px; /* 각 a 태그 사이의 간격 */
}

header nav a {
	text-decoration: none;
	color: #495057; /* 회색 텍스트 */
	font-weight: bold;
}

header nav a:hover {
	color: #007bff; /* 링크에 마우스를 올렸을 때의 색상 */
}

.container-main {
	display: flex;
	flex-grow: 1;
	margin-bottom: 40px; /* main과 footer 사이의 간격을 40px로 설정 */
}

aside {
	background-color: #343a40; /* 짙은 회색 배경 */
	padding: 20px;
	color: #fff;
	width: 200px;
	flex-shrink: 0;
	display: flex;
	flex-direction: column;
	align-items: center; /* 중앙 정렬 */
	text-align: center; /* 중앙 정렬 */
	height: calc(100vh - 40px); /* header와 맞닿도록 높이 조정 */
	margin-top: -20px; /* header와 맞닿게 상단 여백 제거 */
	margin-bottom: -40px; /* footer와 맞닿게 하단 여백 제거 */
}

aside ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

aside ul li {
	margin-bottom: 10px;
}

aside ul li a {
	color: #adb5bd; /* 연한 회색 텍스트 */
	text-decoration: none;
	display: block;
	font-weight: bold;
}

aside ul li a:hover {
	color: #007bff; /* 링크에 마우스를 올렸을 때의 색상 */
}

main {
	flex-grow: 1;
	padding: 20px;
	background-color: #ffffff; /* 화이트 배경 */
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
	border-radius: 8px; /* 둥근 모서리 */
	margin: 0 20px; /* 사이드바와의 간격 추가 */
}

.filter-bar {
	display: flex;
	justify-content: center; /* 검색창을 가운데로 정렬 */
	margin-bottom: 20px;
	width: 100%; /* 전체 너비 사용 */
}

.filter-bar select, .filter-bar input {
	padding: 5px;
	font-size: 14px;
	border: 1px solid #ced4da; /* 부드러운 회색 테두리 */
	border-radius: 4px;
	margin-right: 10px;
}

.filter-bar button {
	padding: 5px 10px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-weight: bold;
}

.filter-bar button:hover {
	background-color: #0056b3; /* 버튼에 마우스를 올렸을 때의 색상 */
}

#delete {
	margin-bottom: 20px; /* 버튼과 표 사이에 간격 추가 */
	background-color: #dc3545; /* 붉은색 배경 */
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-weight: bold;
}

#delete:hover {
	background-color: #c82333; /* 버튼에 마우스를 올렸을 때의 색상 */
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

table th, table td {
	border: 1px solid #dee2e6;
	padding: 8px;
	text-align: center;
}

table th {
	background-color: #e9ecef; /* 부드러운 회색 배경 */
	color: #495057;
	font-weight: bold;
}

table td a {
	color: #007bff; /* 링크 텍스트 색상 */
	text-decoration: none;
}

table td a:hover {
	text-decoration: underline;
}

.pagination {
	display: flex;
	justify-content: center;
	gap: 5px;
}

.pagination a {
	text-decoration: none;
	padding: 5px 10px;
	background-color: #007bff;
	color: #fff;
	border-radius: 5px;
}

.pagination a:hover {
	background-color: #0056b3;
}

.footer {
	background-color: rgba(30, 33, 40, 0.68);
	color: white;
	padding: 30px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-wrap: wrap;
}

.footer-links a {
	margin-right: 15px;
	color: white;
	text-decoration: none;
	font-weight: bold;
}

.footer-links a:hover {
	text-decoration: underline;
}

.company-info p {
	margin-top: 10px;
	font-size: 14px;
}
</style>
<title>프리랜서 검색 list</title>
</head>
<body>
	<div class="container">
		<header>
			<h1>게시글 삭제</h1>
			<nav>
				<a href="/adminpage/board01">코딩 게시판</a> <a href="/adminpage/board02">팀
					모집</a> <a href="/adminpage/board03">프리랜서 검색</a> <a
					href="/adminpage/board04">프리랜서 공고</a> <a href="/adminpage/board05">취업
					공고</a>
			</nav>
		</header>
		<div class="container-main">
			<aside>
				<ul>
					<li><a href="/adminpage/board01">게시판 관리</a></li>
					<li><a href="/adminpage/notice">공지사항</a></li>
					<li><a href="/adminpage/questionlist">문의사항</a></li>
					<li><a href="/adminpage/advertisinglist">광고문의</a></li>
					<li><a href="/adminpage/consent">기업회원 인증 관리</a></li>
					<li><a href="/adminpage/memberlist">비매너 회원 제재</a></li>
					<li><a href="/adminpage/adminlist">관리자 등급 권한 관리</a></li>
					<li><a href="/adminpage/wordlist">금지어 추가 및 관리</a></li>
					<li><a href="/adminpage/reportlist">신고 상황</a></li>
				</ul>
			</aside>
			<main>
				<div class="filter-bar">
					<form action="board03">
						<select name="searchn">
							<option value="0">전체</option>
							<option value="1">글번호</option>
							<option value="2">작성자</option>
							<option value="3">내용 검색</option>
						</select> <input name="search" type="text"
							placeholder="글번호, 제목, 작성자, 내용 검색" size=30 /> <input type="submit"
							value="검색" />
					</form>
				</div>

				<input type="button" value="삭제하기" id="delete" name="delete" />
				<table>
					<thead>
						<tr>
							<th>글 번호</th>
							<th>작성자</th>
							<th>선택</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list03dto" items="${list03}">
							<tr>
								<td><a href="/adminpage/content3/${list03dto.b_no03}">${list03dto.b_no03}</a></td>
								<td align="center">${list03dto.id}</td>
								<td align="center"><input type="checkbox" name="no"
									value="${list03dto.b_no03}" /></td>
							</tr>
						</c:forEach>
				</table>

				<div id="page" class="pagination">
					<c:if test="${begin > pageNum }">
						<a href="board03?p=${begin-1}&search=${search}&searchn=${searchn}">[이전]</a>
					</c:if>
					<c:forEach begin="${begin }" end="${end}" var="i">
						<a href="board03?p=${i}&search=${search}&searchn=${searchn}">${i}</a>
					</c:forEach>
					<c:if test="${end < totalPages }">
						<a href="board03?p=${end+1}&search=${search}&searchn=${searchn}">[다음]</a>
					</c:if>
				</div>
			</main>
		</div>
		<footer class="footer">
			<div class="footer-links">
				<a href="#">프리랜서 이용약관</a> <a href="#">고객센터</a> <a href="#">개인정보
					처리방침</a> <a href="/advertising/question">광고문의</a><a href="/main">메인화면</a>
			</div>
			<div class="company-info">
				<p>(주)프렌즈그램(대표이사: 전재민)</p>
				<p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
			</div>
		</footer>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function() {
			$("#delete").click(function() {
				let dnums = [];
				$.each($("[name='no']:checked"), function() {
					dnums.push($(this).val())
				})
				console.log(dnums)

				$.ajax({
					url : "/adminpage/delete3",
					data : "list=" + dnums,
					method : "delete",
					dataType : "json"
				}).done(function() {
					location.reload();
				})
			})
		})
	</script>
</body>
</html>
