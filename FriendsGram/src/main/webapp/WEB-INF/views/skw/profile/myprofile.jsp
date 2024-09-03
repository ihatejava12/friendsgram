<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!--  bList begin end count pageNum totalPages -->
<title>마이페이지</title>




<style>
/* 전체 박스 모델과 여백 설정 */
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

/* 헤더 설정 */
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

/* HTML과 BODY 설정 */
html, body {
  height: 100%;
  margin: 0;
}

/* BODY 설정 */
body {
  margin-top: 80px; /* 헤더 높이만큼의 여백 추가 */
  font-family: 'Inter', sans-serif;
  background-color: #f0f0f0;
  color: #333;
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

/* 로고 이미지 설정 */
.logo img {
  height: 50px;
  width: auto;
}

/* 네비게이션 링크 설정 */
.navigation a {
  margin-right: 15px;
  color: #565E6C;
  font-weight: bold;
  text-decoration: none;
}

/* 액션 버튼 설정 */
.actions a {
  margin-left: 10px;
  color: #0C9200;
  font-weight: bold;
  text-decoration: none;
}

/* 메인 컨텐츠 설정 */
main {
    max-width: 1000px; /* 메인의 크기 설정 */
    margin: 100px auto; /* 위쪽 마진을 30px로 설정 */
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    border-radius: 10px;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
    justify-content: center; /* 컨텐츠를 중앙으로 정렬 */
}

/* 푸터 설정 */
.footer {
  background-color: rgba(30, 33, 40, 0.68);
  color: white;
  padding: 30px 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  width: 100%;
  margin-top: auto; /* 푸터가 페이지 끝에 위치하도록 설정 */
}

/* 푸터 링크 설정 */
.footer-links a {
  margin-right: 15px;
  color: white;
  text-decoration: none;
  font-weight: bold;
}

/* 회사 정보 설정 */
.company-info p {
  margin-top: 10px;
  font-size: 14px;
}

/* 중앙 컨텐츠 설정 */
#center {
  text-align: center;
  margin-bottom: 30px;
}

#center h1 {
  font-size: 2.5em;
  color: #4CAF50;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
  margin-top: 0;
}

/* 버튼을 평행하게 나열하기 위한 설정 */
#button-group {
  display: flex;
  justify-content: space-between; /* 버튼 사이에 간격을 둠 */
  gap: 10px; /* 버튼 사이의 간격 */
}

#button-group a {
   width: 30%; /* 각 버튼의 너비를 설정 */
  margin: 0 5px; /* 좌우 간격 조정 */
  padding: 15px 25px; /* 내부 여백을 키움 */
  background-color: #4CAF50;
  color: #fff;
  text-decoration: none;
  border-radius: 5px;
  text-align: center;
  font-weight: bold;
  font-size: 1em; /* 글씨 크기를 조정하여 크기를 늘림 */
  transition: background-color 0.3s ease, transform 0.3s ease;
}

#button-group a:hover {
  background-color: #45a049;
  transform: scale(1.05);
}

#button-group a:active {
  background-color: #3e8e41;
  transform: scale(1);
}

/* 밑의 버튼에 대한 기존 스타일 유지 */
input[type="submit"] {
  width: 100%;
  padding: 12px;
  background-color: #4CAF50;
  color: #fff;
  border: none;
  border-radius: 5px;
  font-size: 1.2em;
  font-weight: bold;
  cursor: pointer;
  transition: background-color 0.3s ease, transform 0.3s ease;
}

input[type="submit"]:hover {
  background-color: #45a049;
  transform: scale(1.05);
}

input[type="submit"]:active {
  background-color: #3e8e41;
  transform: scale(1);
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

/* 테이블 설정 */
table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

table td {
  padding: 12px 15px;
  border-bottom: 1px solid #ddd;
}

table td:first-child {
  text-align: right;
  font-weight: bold;
  color: #666;
}

table td:last-child {
  text-align: left;
}

/* 텍스트 입력 필드 설정 */
input[type="text"], input[type="password"] {
  width: 100%;
  padding: 10px;
  margin-top: 5px;
  margin-bottom: 15px;
  border-radius: 5px;
  border: 1px solid #ccc;
  font-size: 1em;
}

/* 제출 버튼 설정 */
input[type="submit"] {
  width: 100%;
  padding: 12px;
  background-color: #4CAF50;
  color: #fff;
  border: none;
  border-radius: 5px;
  font-size: 1.2em;
  font-weight: bold;
  cursor: pointer;
  transition: background-color 0.3s ease, transform 0.3s ease;
}

input[type="submit"]:hover {
  background-color: #45a049;
  transform: scale(1.05);
}

input[type="submit"]:active {
  background-color: #3e8e41;
  transform: scale(1);
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
            <a class="messages" href="/mail" onclick="window.open(this.href, '_blank', 'width=780, height=480,left=600,top=200'); return false;">메시지</a>
        
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
    <div id="center">
  <h1>나의 정보</h1>
  <div id="button-group">
    <a href="/myprofile">나의 정보</a>
    <a href="/info">이력서</a>
    <a href="/review/${user.id}">나의 리뷰</a>
    <a href="/myquestion">문의 사항 보기</a>
    <a href="/board03/freelancer">프리랜서 등록</a>
  </div>
</div>

    <form action="update" method="post" id="myprofile">
        <input type="hidden" name="_method" value="put">
        <h2>${user.id}님의 개인페이지</h2>
        
        <table>
            <tr><td>아이디:</td><td>${user.id}</td></tr>
            <tr><td>이름:</td><td><input name="name" id="name" value="${user.name}"></td></tr>
            <tr><td>변경할 비밀번호:</td><td><input type="password" name="password"></td></tr>            
            <tr><td>이메일:</td><td><input name="email" id="email" value="${user.email}"></td></tr>
            <tr><td>생년월일:</td><td>${user.birth}</td></tr>
            <tr><td>성별:</td><td>${user.gender}</td></tr>
            <tr><td>휴대폰:</td><td><input name="phone" id="phone" value="${user.phone}"></td></tr>
            <tr><td>현재 비밀번호:</td><td><input type="password" id="password"></td></tr>
            <tr><td colspan="2"><input type="submit" value="수정"></td></tr>
        </table>
    </form>
</main>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(function() {
        $("#myprofile").submit(function(event) {
            event.preventDefault(); // 폼의 기본 제출 동작을 막음
            
            if (!$("#password").val()) {
                alert("비밀번호를 입력해야 합니다.");
                return false;
            }

            // AJAX 요청을 통해 폼 데이터를 서버로 전송
            $.ajax({
                type: "POST",
                url: $(this).attr('action'),
                data: $(this).serialize(),
                success: function(response) {
                    // 성공적으로 제출되었을 때
                    alert("수정되었습니다.");
                    // 페이지를 다시 로드하거나, 다른 페이지로 이동할 수 있음
                    location.reload(); // 페이지 새로고침
                },
                error: function() {
                    alert("수정에 실패했습니다. 다시 시도해 주세요.");
                }
            });
        });
    });
    
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