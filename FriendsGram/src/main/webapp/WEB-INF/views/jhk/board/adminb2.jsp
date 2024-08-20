<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    display: grid;
    grid-template-columns: 200px 1fr;
    grid-template-rows: auto 1fr auto;
    grid-template-areas:
        "aside header"
        "aside main"
        "aside footer";
    min-height: 100vh; /* 컨테이너가 전체 화면을 차지하도록 설정 */
}

header {
    grid-area: header;
    background-color: #fff;
    padding: 10px 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-between;
}

header h1 {
    margin: 0;
    font-size: 18px;
    text-align: center;
}

header nav {
    margin-top: 10px;
}

nav ul {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
    gap: 15px;
}

nav ul li a {
    text-decoration: none;
    color: #333;
}

aside {
    grid-area: aside;
    background-color: #333;
    padding: 20px;
    color: #fff;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
    position: fixed; /* 화면에 고정 */
     top: 0;
    left: 0;
    height: 100vh; /* 전체 화면 높이 */
    width: 160px; /* aside의 너비 고정 */
    overflow-y: auto; /* 내용이 길어지면 스크롤 가능하게 설정 */
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
    color: #fff;
    text-decoration: none;
    display: block;
}

main {
    grid-area: main;
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: center; /* 수평 중앙 정렬 */
    justify-content: flex-start; /* 수직 정렬을 상단에서 시작 */
    overflow-y: auto;
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
}

.filter-bar button {
    padding: 5px 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    cursor: pointer;
}

#delete {
    margin-bottom: 20px; /* 버튼과 표 사이에 간격 추가 */
}

table {
    width: auto; /* 표의 너비를 자동으로 설정 */
    border-collapse: collapse;
    margin-bottom: 20px;
    margin: 0 auto; /* 표를 가운데로 정렬 */
}

table th, table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
}

table th {
    background-color: #f8f8f8;
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

.footer {
    grid-area: footer;
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

.company-info p {
    margin-top: 10px;
    font-size: 14px;
}



</style>
<title>팀 모집 게시판 list</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<div class="container">
        <header>
            <h1>게시글 삭제</h1><br>
            <nav>
		<ul>
			<li><a href="/adminpage/board01">코딩 게시판</a></li>
			<li><a href="/adminpage/board02">팀 모집</a></li>
			<li><a href="/adminpage/board03">프리랜서 검색</a></li>
			<li><a href="/adminpage/board04">프리랜서 공고</a></li>
			<li><a href="/adminpage/board05">취업 공고</a></li>
		</ul>
	 </nav>
        </header>
	 <aside>
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
			<li><a href="/adminpage/reportlist">신고 상황</a></li>
		</ul>
	</aside>
	<main>
	<div class="filter-bar">
		<form action="board02">
			<select name="searchn">
				<option value="0"> 전체 </option>
				<option value="1"> 글번호 </option>
				<option value="2"> 제목 </option>
				<option value="3"> 작성자 </option>
				<option value="4"> 내용 검색 </option>
			</select>
			<input name="search" type="text" placeholder="글번호, 제목, 작성자, 내용 검색" size=30/> <input type="submit" value="검색"/>
		</form>
		</div>
		
			<input type="button" value="삭제하기" id="delete" name="delete"/>
			<table>
                <thead>
				<tr>
					<th>글 번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>선택</th>
				</tr>
				</thead>
				   <tbody>
				<c:forEach var="list02dto" items="${list02}">
					<tr>
						<td>${list02dto.b_no02}</td>
						<td align="center"><a href="/adminpage/content2/${list02dto.b_no02}">${list02dto.title}</a></td>
						<td align="center">${list02dto.id}</td>
						<td align="center"><fmt:formatDate value="${list02dto.date}" dateStyle="short"/></td>
						<td align="center"><input type="checkbox" name="no" value="${list02dto.b_no02}"/></td>
					</tr>
				</c:forEach>
			</table>
			
			
			<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="board02?p=${begin-1}&search=${search}&searchn=${searchn}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="board02?p=${i}&search=${search}&searchn=${searchn}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="board02?p=${end+1}&search=${search}&searchn=${searchn}">[다음]</a>
				</c:if>
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
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			$("#delete").click(function(){
				let dnums = [];
				$.each($("[name='no']:checked"), function(){
					dnums.push($(this).val())
				})
				console.log(dnums)
				
				$.ajax({url:"/adminpage/delete2",
						data:"list="+dnums,
						method:"delete",
						dataType:"json"
				}).done(function(){
					location.reload();
				})
			})
		})
	</script>
</body>
</html>