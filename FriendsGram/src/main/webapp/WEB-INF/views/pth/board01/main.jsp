<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>FriendsGram</title>

<style>

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
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
}

th {
	border: 1px solid black;
	background-color: lightgray;
	width: 150px;
}

td {
	border: 1px solid black;
}

#allcontent {
	margin: auto 15% 
}

#headcontent{
	background-color: lightgreen;
}
</style>

</head>
<body>
<!--  bList begin end count pageNum totalPages -->
<div>
 <header class="header">
        <div class="logo">
            <a href="/main">
                <img src="/img/logo.png" alt="프렌즈그램 로고" class="logo-image"/>
            </a>
        </div>
        <nav class="navigation">
            <a href="/board01/main">코딩 게시판</a>
            <a href="/board02/main">프리랜서 검색</a>
            <a href="#">팀 모집</a>
            <a href="#">프리랜서 공고</a>
            <a href="#">취업 공고</a>
        </nav>
        <div class="actions">
            <a class="login" href="#">로그인</a>
            <a class="profile" href="#">프로필</a>
            <a class="messages" href="/mail" onclick="window.open(this.href, '_blank', 'width=780, height=480'); return false;">메시지</a>
        </div>
    </header>
</div>
<hr>
<div id="allcontent">
<div id="headcontent" align="center">
	<h2>코딩 게시판</h2>
	<form method="get" action="/board01/search">
	<select name="skil">
		<option value="">개발 언어</option>
		<option value="java">JAVA</option>
		<option value="python">PYTHON</option>
		<option value="html">HTML</option>
		<option value="cc">C</option>
		<option value="database">DATABASE</option>
		<option value="other">기타</option>
	</select>
	
	<select name="category">
		<option value="title">제목</option>
		<option value="content">내용</option>
		<option value="all">제목+내용</option>
	</select>	
		<input name="search" type="text" placeholder="검색어를 입력해주세요">
		<input type="submit" value="검색"/>
	</form>
</div>

<hr>

<div align="right">
	<button><a href="/board01/main">목록</a></button> <button><a href="/board01/write">글쓰기</a></button>
</div>

<hr>

<div align="left">
	<button>전체</button> <button>내 글</button> <button>내 댓글</button>
</div>
<hr>

<div>
<c:if test="${count != 0}">
	<table style="width:100%;">
		<tr><th>번호</th><th>개발언어</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>
		<c:forEach items="${blist }" var="board">
			<tr>
				<td>${board.b_no01 }</td>
				<td>${board.code }</td>
				<td><a href="content/${board.b_no01}">${board.title }</a></td>
				<td>${board.id }</td>
				<td><fmt:formatDate value="${board.date }" dateStyle="short"/></td>
				<td>${board.readcount }</td>
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

</body>

</div>
</html>