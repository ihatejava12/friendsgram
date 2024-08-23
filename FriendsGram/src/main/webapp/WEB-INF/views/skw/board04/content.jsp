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
  margin: 0;
  overflow-x: hidden;
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

.hero-image img {
  margin-top: 20px;
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
  margin: auto 15%;
}

#headcontent {
  background-color: lightgreen;
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
        <a class="messages" href="/mail" onclick="window.open(this.href, '_blank', 'width=780, height=480'); return false;">메시지</a>
    </div>
</header>

<main>
    <div class="main-container">
        <div class="content">
            <div class="action-buttons" style="display: inline-block; float: right;">
                <a href="/board04/updateform/${dto.b_no04}" class="button">수정</a>
                <a href="#" id="${dto.b_no04}" class="button delete-btn">삭제</a>
                <a href="/list" class="button">목록</a>
            </div>

            <div class="title">${dto.title}</div>
            <div class="tags"></div>
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
        </div>
        <div class="sidebar">
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
            beforeSend: function(xhr, settings) {
                // i.hasContent와 i.data가 올바르게 정의되었는지 확인
                var i = {
                    hasContent: settings.data && settings.data.length > 0,
                    data: settings.data
                };

                console.log("i.hasContent:", i.hasContent);
                console.log("i.data:", i.data);

                // 여기서 추가적인 로직을 수행할 수 있지만, xhr.send를 직접 호출하지 않음.
                // 필요한 경우, 요청을 취소하려면 false를 반환하거나 xhr.abort()를 사용할 수 있음.
            },
            success: function(response) {
                alert(response.message); // 서버로부터 받은 메시지 표시
                // 필요한 경우, 페이지 리로드 또는 다른 처리
            },
            error: function(xhr, status, error) {
                alert("지원에 실패했습니다.");
            }
        });
    });
});
</script>
</body>
</html>