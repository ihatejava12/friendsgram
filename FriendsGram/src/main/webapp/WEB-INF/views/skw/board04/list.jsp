<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!--  bList begin end count pageNum totalPages -->
<title>글 목록</title>
<style>
#center {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
}

table {
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
}

th {border: 1px solid black;
	background-color: orange;
	width: 150px;
}
td{border: 1px solid black;}
a {
	margin: 10px auto;
}

#page {
	text-align: center;
}
</style>
</head>
<body>

<style>
 	@charset "utf-8";
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

@media (max-width: 768px) {
  .hero-section {
    flex-direction: column;
    text-align: center;
  }

  .hero-image img {
    margin-top: 20px;
  }
 </style>
 
 <header class="header">
        <div class="logo">
            <a href="/main">
                <img src="../img/logo.png" alt="프렌즈그램 로고" class="logo-image"/>
            </a>
        </div>
        <nav class="navigation">
            <a href="#">코딩 게시판</a>
            <a href="#">프리랜서 검색</a>
            <a href="#">팀 모집</a>
            <a href="/list">프리랜서 공고</a>
            <a href="#">취업 공고</a>
        </nav>
        <div class="actions">
            
            <a class="profile" href="/myprofile">프로필</a>
            <a class="messages" href="#">메시지</a>
            <a class="logout" href="logout">로그아웃</a>
        </div>
    </header>
	<div id="center">
		<h1>게시글 목록</h1>
		<div align="right">
			<a href="/main">main</a><a href="/board04/write">새글 등록</a>
		</div>

		<c:if test="${count != 0 }">
			<table>
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach items="${bList}" var="board">
					<tr>
						<td><a href ="content/${board.no}">${board.title}</a></td>
						<td>${board.id }</td>
						<td><fmt:formatDate value="${board.regdate }" dateStyle="short"/> </td>
						<td>${board.readcount }</td>
					</tr>
				</c:forEach>
			</table>
			<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="list?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="list?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="list?p=${end+1}">[다음]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count == 0 }">
	아직 입력한 글이 없습니다.
</c:if>

	</div>
	<div id="search" align="center">
		<form action="search">
			<select name="searchn">
				<option value="0">제목</option>
				<option value="1">내용</option>
				<option value="2">작성자</option>
			</select>
		<input type="text" name="search" size="15" maxlength="50"/>
		<input type="submit" value="검색"/>
		</form>
	</div>
</body>
</html>