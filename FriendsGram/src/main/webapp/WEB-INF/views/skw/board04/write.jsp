<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write</title>
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
  margin: 0 auto;
  padding: 10px;
  max-width: 480px; /* 메인 컨텐츠 영역의 최대 너비를 줄였습니다 */
  background-color: #fff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
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

label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
}

input[type="text"],
textarea {
    width: calc(100% - 60px); /* 단위를 입력칸 옆에 배치할 수 있도록 너비 조정 */
    padding: 8px;
    margin-bottom: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

input[type="radio"],
input[type="checkbox"] {
    margin-right: 5px;
}

textarea {
    height: 80px;
    resize: vertical;
}

.radio-group,
.checkbox-group {
    margin-bottom: 12px;
}

.radio-group label,
.checkbox-group label {
    margin-right: 15px;
}

.radio-group {
    display: flex;
    align-items: center;
}

.radio-group input[type="radio"] {
    margin-left: 10px;
    margin-right: 5px;
}

input[type="submit"] {
    width: 100%;
    padding: 8px;
    background-color: #4CAF50;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

.unit-label {
    margin-left: 10px; /* 단위를 입력 필드와 더 떨어지게 조정 */
    font-weight: normal;
    color: #333;
}

.flex-container {
    display: flex;
    align-items: center;
    margin-bottom: 12px;
}

.flex-container input[type="text"] {
    width: 80px; /* 입력 칸 크기 조정 */
}
</style>
</head>
<body>
<header class="header">
    <div class="logo">
        <a href="/main"> <img src="../images/logo.png" alt="프렌즈그램 로고" class="logo-image" /></a>
    </div>
    <nav class="navigation">
        <a href="board01/main">코딩 게시판</a>
        <a href="board02/main">팀 모집</a>
        <a href="board03/main">프리랜서 검색</a>
        <a href="/list">프리랜서 공고</a>
        <a href="/board05">취업 공고</a>
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
    <form action="/board04/write" method="post">
        <label for="id">아이디</label>
        <input type="text" id="id" name="id" value="${user.id}" readonly>

        <label for="title">제목</label>
        <input type="text" id="title" name="title" required>

        <div class="radio-group">
            <label>근무 형태</label>
            <input type="radio" id="out" name="work_type" value="true">
            <label for="out">원격</label>
            <input type="radio" id="in" name="work_type" value="false">
            <label for="in">상주</label>
            </div>
        <div id="programming_language">언어:
		<label><input type="checkbox" name="programming_language" value="JAVA"> JAVA</label><br>
    <label><input type="checkbox" name="programming_language" value="PYTHON"> PYTHON</label><br>
    <label><input type="checkbox" name="programming_language" value="HTML"> HTML</label><br>
    <label><input type="checkbox" name="programming_language" value="C"> C</label><br>
    <label><input type="checkbox" name="programming_language" value="DATABASE"> DATABASE</label><br>
    <label><input type="checkbox" name="other" id="other-checkbox" value="other"> 기타</label><br>
    <input type="text" id="other-input" name="programming_language" placeholder="Enter other language" style="display: none;"><br>
</div>
       

        <div class="flex-container">
            <label for="salary">급여</label>
            <input type="text" id="salary" name="salary" placeholder="0">
            <span class="unit-label">원</span>
        </div>

        <div class="flex-container">
            <label for="career_period">경력 기간</label>
            <input type="text" id="career_period" name="career_period" placeholder="0">
            <span class="unit-label">년</span>
        </div>

        <label for="content">내용</label>
        <textarea id="content" name="content" required></textarea>

        <label for="join_date">모집기간</label>
        <input type="text" id="join_date" name="join_date" placeholder="YYYY-MM-DD">

        <div class="radio-group">
            <label>모집상태</label>
            <input type="radio" id="Recruiting" name="join02" value="true">
            <label for="Recruiting">모집중</label>
            <input type="radio" id="Recruitment_completed" name="join02" value="false">
            <label for="Recruitment_completed">모집완</label>
        </div>

        <label for="volunteer">모집자수</label>
        <input type="text" id="volunteer" name="volunteer" placeholder="0">

        <label for="employment_date">기간</label>
        <input type="text" id="employment_date" name="employment_date" placeholder="YYYY-MM-DD">

        <label for="employment_start">시작일</label>
        <input type="text" id="employment_start" name="employment_start" placeholder="YYYY-MM-DD">

        <input type="submit" value="확인">
    </form>
</main>
	<script>
    document.getElementById('other-checkbox').addEventListener('change', function() {
        var otherInput = document.getElementById('other-input');
        if (this.checked) {
            otherInput.style.display = 'inline-block';
        } else {
            otherInput.style.display = 'none';
            otherInput.value = ''; // 입력된 값을 초기화
        }
    });
</script>

<footer class="footer">
    <div class="footer-links">
        <a href="#">프리랜서 이용약관</a>
        <a href="#">고객센터</a>
        <a href="#">개인정보 처리방침</a>
        <a href="#">광고문의</a>
        <c:if test="${user != null && user.role == 2 || user.role == 1}">
            <a href="/adminpage/board01">관리자</a>
        </c:if>
    </div>
    <div class="company-info">
        <p>(주)프렌즈그램(대표이사: 전재민)</p>
        <p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
    </div>
</footer>
</body>
</html>