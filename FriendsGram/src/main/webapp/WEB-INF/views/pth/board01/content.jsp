<%@ page contentType="text/html; charset=UTF-8" %>
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
         <a href="/main"> <img src="images/logo.png" alt="프렌즈그램 로고"
            class="logo-image" />
         </a>
      </div>
      <nav class="navigation">
         <a href="/board01/main">코딩 게시판</a>  <a href="/board02/main">팀 모집</a> <a href="/board03/main">프리랜서 검색</a>
          <a   href="/list">프리랜서 공고</a> <a href="/board05">취업 공고</a>
      </nav>
      <div class="actions">
         <c:if test="${user.id != null }">
         <a class="login" href="/logout">로그아웃</a>
         </c:if>
         <c:if test="${user.id == null }">
         <a class="login" href="/loginform">로그인</a>
         </c:if>
         
          <a class="profile" href="/myprofile">프로필</a>
         <a class="messages" href="/mail" onclick="window.open(this.href, '_blank', 'width=780, height=480'); return false;">메시지</a>
      </div>
   </header>
 
</div>
<hr>
<div id="allcontent">
<div id="headcontent" align="center">
	<h2>코딩 게시판</h2>
	<select>
		<option>개발 언어</option>
		<option value="java">JAVA</option>
		<option value="python">PYTHON</option>
		<option value="html">HTML</option>
		<option value="c">C</option>
		<option value="database">DATABASE</option>
		<option value="other">기타</option>
	</select>
	
	<select>
		<option value="title">제목</option>
		<option value="content">내용</option>
		<option value="all">제목+내용</option>
	</select>	
		<input type="text" placeholder="검색어를 입력해주세요">
		<button>검색</button>
	
</div>

<hr>

<div align="right">
	<button><a href="/board01/main">목록</a></button> <button>글쓰기</button>
</div>

<hr>
<!--  content 라는 이름으로 글 1개 정보 보냈음 -->
<div class="articlehead">
<span>${content.id}</span>   <span><fmt:formatDate value="${content.date }" type="both" dateStyle="short" timeStyle="default"/></span>  
<span>조회 :  ${content.readcount }</span>
</div>
<hr>

<div class="articlemain">
	<h2>${content.title }</h2>
	<br><br><br><br>
	<span>
		${content.content }
	</span><br><br><br>
</div>
<div>
	<button><a class="report" href="/board01/report/${content.b_no01}" onclick="window.open(this.href, '_blank', 'width=780, height=480'); return false;">신고하기</a></button>
</div>
<hr>

<div class="articlecoment">
<b>댓글</b>
<!--  comentlist 라는 이름으로 댓글 리스트 가져옴 -->
	<c:forEach items="${comentlist }" var="coment">
		<div style="border-bottom:1px solid black;">
		<p>${coment.id } (<fmt:formatDate value="${coment.date }" type="both" dateStyle="short" timeStyle="default"/>) <button>추천</button> <button>신고</button></p>
		<span>${coment.coment }</span>   <span><button>답글</button></span>
		</div>
	</c:forEach>
</div>
<br>

<div class="comentwrite">
	<p>작성자 id</p>
	<textarea>댓글 작성 댓글 작성</textarea><button>등록</button>
</div>

</div>

 <footer class="footer">
      <div class="footer-links">
         <a href="#">프리랜서 이용약관</a> <a href="#">고객센터</a> <a href="#">개인정보
            처리방침</a> <a href="#">광고문의</a><c:if test="${ user.role == 2 || user.role == 1}"><a href="/adminpage/board01">관리자</a></c:if>
      </div>
      <div class="company-info">
         <p>(주)프렌즈그램(대표이사: 전재민)</p>
         <p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
      </div>
   </footer>

</body>