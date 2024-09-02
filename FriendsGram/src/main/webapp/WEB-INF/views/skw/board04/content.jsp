<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>  
<meta charset="UTF-8">
<title>${dto.title}</title>
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
  min-height: 100vh;
  margin: 0 auto;
  padding: 10px;
  max-width: 600px;
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

table {
  border: 1px solid black;
  width: 100%;
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

.action-buttons {
  text-align: right;
  margin-bottom: 20px;
}

.action-buttons .button {
  margin-left: 10px;
  padding: 8px 15px;
  background-color: #4CAF50;
  color: #fff;
  text-decoration: none;
  border-radius: 5px;
  font-weight: bold;
  transition: background-color 0.3s ease;
}

.action-buttons .button:hover {
  background-color: #45a049;
}

.title {
  font-size: 1.5em;
  font-weight: bold;
  margin-bottom: 15px;
  color: #333;
}

.details dt {
  font-weight: bold;
  margin-bottom: 5px;
}

.details dd {
  margin: 0 0 15px 0;
  padding: 0 0 10px 0;
  border-bottom: 1px solid #eee;
}

.work-type, .join02 {
  margin-bottom: 15px;
}

.work-type-tag, .join02-tag {
  display: inline-block;
  padding: 5px 10px;
  border-radius: 3px;
  font-size: 0.9em;
  color: #fff;
}

.work-type-tag.in {
  background-color: #4CAF50;
}

.work-type-tag.out {
  background-color: #FF5722;
}

.join02-tag.in {
  background-color: #9E9E9E;
}

.join02-tag.out {
  background-color: #4CAF50;
}

.button {
  display: inline-block;
  padding: 10px 20px;
  background-color: #4CAF50;
  color: #fff;
  text-decoration: none;
  border-radius: 5px;
  font-weight: bold;
  text-align: center;
  transition: background-color 0.3s ease;
  margin-top: 20px;
}

.button:hover {
  background-color: #45a049;
}
</style>
</head>
<body>
<header class="header">
    <div class="logo">
        <a href="/main"> <img src="/images/logo.png" alt="프렌즈그램 로고" class="logo-image" /></a>
    </div>
    <nav class="navigation">
        <a href="/board01/main">코딩 게시판</a>
        <a href="/board02/main">팀 모집</a>
        <a href="/board03/main">프리랜서 검색</a>
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
        <a class="messages" href="/mail" onclick="window.open(this.href, '_blank', 'width=780, height=480,left=600,top=200'); return false;">메시지</a>
    </div>
</header>

<main>
    <div class="main-container">
        <div class="content">
            <div class="action-buttons">
            
             <c:if test="${user.id == dto.id }">
                        <a href="/board04/updateform/${dto.b_no04}" class="button">수정</a>
                        <a href="#" id="${dto.b_no04}" class="button delete-btn">삭제</a>
                    </c:if>
                <a href="/list" class="button">목록</a>
            </div>

            <div class="title">${dto.title}</div>
            <dl class="details">
                <dt>아이디</dt>
                <dd>${dto.id}</dd>
                <dt>작성일</dt>
                <dd><fmt:formatDate value="${dto.date}" pattern="yyyy-MM-dd" /></dd>

                <dt>근무 형태</dt>
                <div class="work-type">
                    <c:if test="${dto.work_type}">
                        <dd class="work-type-tag in">상주</dd>
                    </c:if>
                    <c:if test="${!dto.work_type}">
                        <dd class="work-type-tag out">원격</dd>
                    </c:if>
                </div>

                <dt>급여</dt>
                <dd>${dto.salary}</dd>
                <dt>경력기간</dt>
                <dd>${dto.career_period}</dd>

                <dt>내용</dt>
                <dd>${dto.content}</dd>

                <dt>모집기간</dt>
                <dd>${dto.join_date}</dd>

                <dt>모집상태</dt>
                <div class="join02">
                    <c:if test="${dto.join02}">
                        <dd class="join02-tag out">모집중</dd>
                    </c:if>
                    <c:if test="${!dto.join02}">
                        <dd class="join02-tag in">모집완</dd>
                    </c:if>
                </div>

                <dt>모집자수</dt>
                <dd>${dto.volunteer}</dd>

                <dt>기간</dt>
                <dd>${dto.employment_date}</dd>

                <dt>시작일</dt>
                <dd>${dto.employment_start}</dd>
            </dl>
             <a href="#" id="join-btn" class="button">지원하기</a>
        </div>
    </div>
</main>

<footer class="footer">
    <div class="footer-links">
        <a href="#">프리랜서 이용약관</a>
        <a href="#">고객센터</a>
        <a href="#">개인정보 처리방침</a>
        <a href="#">광고문의</a>
        <c:if test="${user != null && (user.role == 2 || user.role == 1)}">
            <a href="/adminpage/board01">관리자</a>
        </c:if>
    </div>
    <div class="company-info">
        <p>(주)프렌즈그램(대표이사: 전재민)</p>
        <p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
    $("a.delete-btn").click(function(){
        let b_no04 = $(this).attr("id"); 
        $.ajax({
            url: "/board04/delete/" + b_no04,
            method: "DELETE",
            success: function(response) {
                if(response === 1) {
                    alert("삭제되었습니다.");
                    location.href = "/list";
                } else {
                    alert("삭제에 실패했습니다.");
                }
            },
            error: function() {
                alert("오류가 발생했습니다.");
            }
        });
        return false; 
    });

    $('#join-btn').click(function(e) {
        e.preventDefault(); // 기본 링크 클릭 동작 방지
        
        var boardNo = ${dto.b_no04}; // 현재 게시글 번호
        var userId = "${user.id}"; // 세션에서 사용자 ID 가져오기

        console.log("AJAX 요청 데이터:", {
            b_no04: boardNo,
            id: userId
        });

        var data = {
            b_no04: boardNo,
            id: userId
        };

        $.ajax({
            url: '/board04/join?b_no04='+boardNo+'&id='+userId,
            type: 'get',
            contentType: 'application/json',
            success: function(response) {
                alert(response.message); // 서버로부터 받은 메시지 표시

                // 지원 성공 시 이력서 전송
                sendResume();
            },
            error: function(xhr, status, error) {
                alert("지원에 실패했습니다.");
            }
        });
    });

    function sendResume() {
        $.ajax({
            url: '/board04/post/' + ${dto.b_no04}, // 이력서 전송 URL
            type: 'post',
            contentType: 'application/json',
            data: JSON.stringify({
                b_no04: ${dto.b_no04},
                return_man: "${dto.id}",
                title: "${dto.title}의 이력서 입니다.",
                content: "이력서 내용: ...", // 필요한 이력서 내용으로 대체
                id: "${user.id}"
            }),
            success: function(response) {
                alert("이력서가 성공적으로 전송되었습니다.");
            },
            error: function(xhr, status, error) {
                alert("이력서 전송에 실패했습니다.");
            }
        });
    }
});
</script>
</body>
</html>