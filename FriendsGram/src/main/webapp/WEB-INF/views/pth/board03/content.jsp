<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>FreindsGram</title>
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

#headcontent{
	background-color: lightgreen;
}

#content{
	align: center;
	margin: auto 15%;
}

.free{
	margin: 20px;
}

</style>
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

<div id="headcontent" style="height: 200px; padding: 40px;">
<h1 style="color: black;" align="center">동료처럼 믿고 맡길 수 있는 </h1>
<h1 style="color: black;" align="center"> 우수 프리랜서를 만나보세요</h1>
<br>

</div>

<!--  freelancer 라는 이름으로 Board03Dto 객체 하나 받아옴 -->

<div class="main" style="float:left; margin: 30px;">
<span>${freelancer.name }</span> 
<c:if test="${freelancer.work_type == 0}">
			원격 가능
		</c:if>
		<c:if test="${freelancer.work_type == 1}">
			상주 가능
		</c:if>
		<c:if test="${freelancer.work_type == 2}">
			원격,상주 가능
		</c:if>
		<br>
		 경력 
		<c:if test="${freelancer.career == -1 }">
		없음
		</c:if> 
		<c:if test="${freelancer.career == 0 }">
		1년 이하
		</c:if>
		<c:if test="${freelancer.career == 1 }">
		1년
		</c:if>
		<c:if test="${freelancer.career == 2 }">
		2년
		</c:if>
		<c:if test="${freelancer.career == 3 }">
		3년
		</c:if>
		<c:if test="${freelancer.career == 4 }">
		4년
		</c:if>
		<c:if test="${freelancer.career == 5 }">
		5년
		</c:if>
		<c:if test="${freelancer.career == 6 }">
		6년
		</c:if>
		<c:if test="${freelancer.career == 7 }">
		7년
		</c:if>
		<c:if test="${freelancer.career == 8 }">
		8년 이상
		</c:if>
		
		<!--  보유개발언어 스킬 나열 -->
		<!--  skillist 라는 이름으로 모든 Board03_SkilDto 객체 list 가져왔음 -->
		<div id="skils">
			보유 개발 스킬 <br>
			<c:forEach items="${skillist }" var="skil">
				<c:if test="${skil.b_no03 == freelancer.b_no03 }">
					<button type="button">${skil.skil }</button>
				</c:if>
			</c:forEach>
		</div>
		<br>
		상세소개
		<p>${freelancer.content}</p>
		
</div>


<div class="sub" style="float:left; margin: 30px;">
	해당 프리랜서가 마음에 드시나요?

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


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	

</script>



</body>
</html>