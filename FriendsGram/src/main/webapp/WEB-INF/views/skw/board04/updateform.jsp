<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>글 수정</title>
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
</style><style>
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

/* 수정하기 버튼 스타일 */
.edit-button {
    padding: 10px 18px;
    background-color: #28a745; /* 초록색 */
    color: #ffffff;
    font-size: 14px;
    font-weight: bold;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-decoration: none;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.edit-button:hover {
    background-color: #218838; /* 더 진한 초록색 */
    transform: translateY(-2px);
}
</style>
</head>
<body>
	<header class="header">

      <div class="logo">
         <a href="/main"> <img src="/images/logo.png" alt="프렌즈그램 로고"
            class="logo-image" />
         </a>
      </div>
      <nav class="navigation">
      <c:if test="${user.role != 3}">
         <a href="board01/main">코딩 게시판</a> 
         <a href="board02/main">팀 모집</a> 
      </c:if> 
      <c:if test="${user.role == 3}">
         <a href="#">코딩 게시판</a> 
         <a href="#">팀 모집</a> 
      </c:if>  
         <a href="board03/main">프리랜서 검색</a> 
         <a href="/list">프리랜서 공고</a> 
         <a href="/board05">취업 공고</a>
      </nav>
      <div class="actions">
         <c:if test="${user.id != null }">
            <a class="login" href="/logout">로그아웃</a>
            <c:choose>
                    <c:when test="${user.role != 3}">
                        <a class="profile" href="/myprofile">프로필</a>
                     </c:when>
                     <c:when test="${user.role == 3}">
                         <a class="corporationprofile" href="/corporationprofile">기업 페이지</a>
                     </c:when>
              </c:choose>
         </c:if>
         <c:if test="${user.id == null }">
            <a class="login" href="/loginform">로그인</a>
         </c:if>

         <a class="messages" href="/mail" onclick="window.open(this.href, '_blank', 'width=780, height=480'); return false;">메시지</a>
         <c:if test="${user.id != null }">
            <div style="position:relative; display:inline-block; top:7px;">
               <img style="width: 25px; height:25px;" src="/images/message_icon.png" alt="메세지"/>
               <div id="numberOfMessage" style="position:absolute; top: 10px; left:15px; background-color:red; color:white;
               padding: 1px 6px; border-radius:50%; font-size:13px;"></div>
            </div>
            </c:if>
      </div>
   </header>


	<main>
		<form method="post" id="updateform" action="/board04/update/${dto.b_no04}">
        
        <label for="title">제목</label>
        <input type="text" id="title" name="title" value="${dto.title}" required>

		<div class="radio-group">
        <label for="work_type">근무 형태</label>
        
            <input type="radio" id="out" name="work_type" value="false" <c:if test="${dto.work_type == false}">checked</c:if>>
            <label for="out">원격</label>
            <input type="radio" id="in" name="work_type" value="true" <c:if test="${dto.work_type == true}">checked</c:if>>
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
            <input type="text" id="salary" name="salary" value="${dto.salary}" required>
            <span class="unit-label">원</span>
        </div>
        
		<div class="flex-container">
            <label for="career_period">경력 기간</label>
            <input type="text" id="career_period" name="career_period" value="${dto.career_period}" required>
            <span class="unit-label"></span>
        </div>


        

        <label for="content">내용</label>
        <textarea id="content" name="content" required>${dto.content}</textarea>

        <label for="join_date">모집 기간</label>
        <input type="text" id="join_date" name="join_date" value="${dto.join_date}" placeholder="YYYY-MM-DD" required>

        <div class="radio-group">
            <label>모집상태</label>
            <input type="radio" id="Recruiting" name="join02" value="true">
            <label for="Recruiting">모집중</label>
            <input type="radio" id="Recruitment_completed" name="join02" value="false">
            <label for="Recruitment_completed">모집완</label>
        </div>

        <label for="volunteer">모집자수</label>
        <input type="text" id="volunteer" name="volunteer" value="${dto.volunteer}" required>

        <label for="employment_date">기간</label>
        <input type="text" id="employment_date" name="employment_date" value="${dto.employment_date}" placeholder="YYYY-MM-DD" required>

        <label for="employment_start">시작일</label>
        <input type="text" id="employment_start" name="employment_start" value="${dto.employment_start}" placeholder="YYYY-MM-DD" required>

        <button type="submit" class="edit-button">수정하기</button>
    </form>
	</main>
	<footer class="footer">
		<div class="footer-links">
			<a href="#">프리랜서 이용약관</a> <a href="/question">고객센터</a> <a href="#">개인정보
				처리방침</a><c:if test="${user.role == 3 }"><a href="/advertising/question">광고문의</a></c:if><c:if test="${user != null && user.role == 2 || user.role == 1}"><a href="/adminpage/board01">관리자</a></c:if>
		</div>
		<div class="company-info">
			<p>(주)프렌즈그램(대표이사: 전재민)</p>
			<p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
		</div>
	</footer>
	
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(function(){
		var id = '${user.id}';
		if(id != null){
			$.ajax({
				url:"/mail/numberofmail",
				data: "id="+id,
				method:"post",
				datatype:"text"
			}).done(function(data){
				// 안읽은 메일의 개수 를 String으로 받아온걸 data 에 저장함
				if(data == '0'){
					$("#numberOfMessage").hide();
				}else{
					$("#numberOfMessage").text(data);
				}
			})
		}
	})
	</script>
	
	
</body>
</html>
