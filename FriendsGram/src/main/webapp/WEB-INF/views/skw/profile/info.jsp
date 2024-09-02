<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!--  bList begin end count pageNum totalPages -->
<title>나의 이력서</title>
<style>
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

.header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  z-index: 1000;
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
    margin-top: 80px;
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
    align-items: center; /* 중앙 정렬 */
    justify-content: flex-start; /* 수직 정렬을 상단으로 */
    min-height: calc(100vh - 160px); /* 화면 전체 높이에서 헤더와 푸터를 제외한 높이 */
    margin: 0 auto; /* 가로 중앙 정렬 */
    max-width: 1000px; /* 메인의 최대 너비를 넓힘 */
    padding: 20px;
    background-color: #f9f9f9;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    border-radius: 10px;
    text-align: center;
    padding-top: 20px; /* 위쪽 패딩 추가 */
}

#center h1 {
    font-size: 2.5em;
    color: #4CAF50;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    margin-bottom: 20px;
}

#center a {
    display: inline-block;
    margin: 10px 15px;
    padding: 10px 20px;
    background-color: #4CAF50;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

#center a:hover {
    background-color: #45a049;
    transform: scale(1.05);
}

.buttons-container {
    display: flex;
    justify-content: space-between; /* 버튼을 균등하게 배치 */
    flex-wrap: wrap; /* 버튼이 줄어들 때 다음 줄로 넘어가도록 함 */
    gap: 10px; /* 버튼 사이의 간격 */
    margin-top: 20px;
    width: 100%; /* 버튼 컨테이너의 너비를 전체로 설정 */
}

.buttons-container a {
    flex: 1; /* 모든 버튼이 동일한 너비를 가지도록 설정 */
    padding: 10px 0; /* 버튼 높이를 동일하게 유지 */
    background-color: #007BFF;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.3s ease;
    text-align: center; /* 텍스트를 가운데 정렬 */
}

.buttons-container a:hover {
    background-color: #0069d9;
    transform: scale(1.05);
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
  margin-top: auto;
  position: relative;
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

</head>
<body>
 <header class="header">
        <div class="logo">
            <a href="/main">
                <img src="../img/logo.png" alt="프렌즈그램 로고" class="logo-image"/>
            </a>
        </div>
        <nav class="navigation">
			<a href="/board01/main">코딩 게시판</a>  <a href="/board02/main">팀 모집</a> <a href="/board03/main">프리랜서 검색</a>
			<a href="/list">프리랜서 공고</a> <a href="/board05">취업 공고</a>
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
    <main>
    <div id="center">
        <h1>나의 이력서</h1>
        <a href="/myprofile">나의 정보</a>
        <a href="/info">이력서</a>
        <a href="/review/${user.id}">나의 리뷰</a>
        <a href="/myquestion">문의 사항 보기</a>
        <a href="/board03/freelancer">프리랜서 등록</a>
    </div>

   <div class="buttons-container">
    <a href="/infowrite">이력서 작성</a>
    <a href="/infock">이력서 확인</a>
</div>
</main>
			<footer class="footer">
		<div class="footer-links">
			<a href="#">프리랜서 이용약관</a> <a href="#">고객센터</a> <a href="#">개인정보
				처리방침</a> <a href="#">광고문의</a><c:if test="${user != null && user.role == 2 || user.role == 1}"><a href="/adminpage/board01">관리자</a></c:if>
		</div>
		<div class="company-info">
			<p>(주)프렌즈그램(대표이사: 전재민)</p>
			<p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
		</div>
	</footer>
</body>
</html>