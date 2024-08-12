<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
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
<title>Insert title here</title>
</head>
<body>
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
	<div id="allcontent">
		<div id="headcontent" align="center">
			<h2>팀 모집 게시판</h2>
		</div>
		<div>
			<form action="/newboard02">
				<button>새글 쓰기</button>
			</form>
			<table style="width:100%;">
				<tr>
					<th>제목</th>
					<th>모집기간</th>
					<th>작성일</th>
					<th>모집자 수</th>
					<th>모집 상태</th>
				</tr>
				<c:forEach items="${blist}" var="list">
					<tr>
						<td>${list.title}</td>
						<td><fmt:formatDate value="${list.date}" dateStyle="short"/> ~ ${list.join_date}</td>
						<td><fmt:formatDate value="${list.date}" dateStyle="short"/></td>
						<td>${list.volunteer}</td>
						
						<c:if test="${list.join01 == false}">
							<td>모집 중</td>
						</c:if>
						<c:if test="${list.join01 == true}">
							<td>모집 완료</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>