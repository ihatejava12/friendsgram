<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

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


	<p>게시글이 작성되었습니다.</p>
	<button><a href="/board01/main">목록으로</a></button>
	
	
	<div>
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
	
	</div>
	
	
</body>
</html>