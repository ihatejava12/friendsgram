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
	min-height: 100vh;
}

header {
	background-color: #f8f9fa;
	padding: 10px 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	text-align: center;
	margin-bottom: 20px;
}

header h1 {
	margin: 0;
	font-size: 24px;
	color: #343a40;
}

header nav {
	margin-top: 10px;
	display: flex;
	justify-content: center;
	gap: 15px;
}

header nav a {
	text-decoration: none;
	color: #495057;
	font-weight: bold;
}

header nav a:hover {
	color: #007bff;
}

.container-main {
	display: flex;
	flex-grow: 1;
	margin-bottom: 20px;
}

aside {
	background-color: #343a40;
	padding: 20px;
	color: #fff;
	width: 200px;
	flex-shrink: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
	margin-top: -20px;
	margin-bottom: -20px;
	height: auto;
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
	color: #adb5bd;
	text-decoration: none;
	display: block;
	font-weight: bold;
}

aside ul li a:hover {
	color: #007bff;
}

main {
	flex-grow: 1;
	padding: 20px;
	background-color: #ffffff;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	margin: 0 20px 20px 20px;
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
	background-color: #e9ecef;
	color: #495057;
	font-weight: bold;
}

table td a {
	color: #007bff;
	text-decoration: none;
	padding: 8px 16px;
	background-color: #e9ecef;
	border-radius: 4px;
	font-weight: bold;
}

table td a:hover {
	background-color: #007bff;
	color: white;
	text-decoration: none;
}

#delete input[type="button"] {
	background-color: #dc3545;
	color: #fff;
	padding: 8px 16px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-weight: bold;
}

#delete input[type="button"]:hover {
	background-color: #c82333;
}

footer {
	background-color: rgba(30, 33, 40, 0.68);
	color: white;
	padding: 30px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-wrap: wrap;
	margin-top: 0;
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

/* 댓글 스타일 */
fieldset {
	border: 1px solid #dee2e6;
	border-radius: 6px;
	margin-bottom: 15px;
	padding: 8px;
	background-color: #ffffff;
	box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
}

fieldset legend {
	font-size: 14px;
	font-weight: bold;
	border: none;
	padding: 0;
	margin-bottom: 8px;
	color: #343a40;
}

fieldset div {
	padding: 6px;
	background-color: #f8f9fa;
	border: 1px solid #dee2e6;
	border-radius: 4px;
	margin-bottom: 8px;
}

fieldset .icon img {
	vertical-align: middle;
	margin-right: 5px;
}

.delete {
	background-color: #dc3545;
	color: #fff;
	border: none;
	padding: 4px 8px;
	border-radius: 4px;
	cursor: pointer;
	font-weight: bold;
}

.delete:hover {
	background-color: #c82333;
}

.comment-level-1 {
	border-left: 2px solid #007bff;
	padding-left: 10px;
	margin-top: 8px;
}

.comment-level-2 {
	border-left: 2px solid #28a745;
	padding-left: 10px;
	margin-top: 8px;
}

.comment-content {
	margin-top: 5px;
}
</style>
<title>팀 모집 게시판 내부</title>
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
				<table>
					<tr>
						<td>제목</td>
						<td>${blist2.title}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${blist2.id}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>${blist2.content}</td>
					</tr>
					<tr>
						<td>등록일</td>
						<td><fmt:formatDate value="${blist2.date}" dateStyle="short" /></td>
					</tr>
					<tr>
						<td colspan="2" align="right"><a href="/adminpage/board02">목록으로
								이동</a> <span id="delete"> <input type="button" value="삭제">
						</span></td>
					</tr>
				</table>

				<c:forEach items="${clist}" var="comm">
					<c:if test="${comm.ref_level == 0}">
						<fieldset class="comment-level-1">
							<legend>댓글</legend>
							<div class="comment-content">
								${comm.id} /
								<fmt:formatDate value="${comm.date}" dateStyle="short" />
								<input type="button" class="delete" id="${comm.ref}" value="삭제">
								<div>${comm.coment}</div>
							</div>
						</fieldset>
					</c:if>
					<c:if test="${comm.ref_level == 1}">
						<fieldset class="comment-level-2">
							<legend>답변</legend>
							<div class="icon">
								${comm.id} /
								<fmt:formatDate value="${comm.date}" dateStyle="short" />
								<input type="button" class="delete" id="${comm.ref}" value="삭제">
								<div>
									<img src="/img/level.gif" width="${comm.ref_level * 10}">
									<img src="/img/re.gif" alt="답변" />
									${comm.coment}
								</div>
							</div>
						</fieldset>
					</c:if>
				</c:forEach>
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
			$("#delete").on("click", function() {
				let no = $
				{
					blist2.b_no02
				}
				;
				$.ajax({
					url : "/delete2/" + no,
					method : "delete"
				}).done(function() {
					location.href = '/adminpage/board02';
				})
			});

			$(".delete").click(function() {
				let ref = $(this).attr("id");
				$.ajax({
					url : "/deletecomm02/" + ref,
					method : "delete"
				}).always(function() {
					location.reload();
				});
			});
		})
	</script>
</body>
</html>
