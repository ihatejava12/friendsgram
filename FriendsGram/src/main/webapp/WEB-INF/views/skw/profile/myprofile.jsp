<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!--  bList begin end count pageNum totalPages -->
<title>마이페이지</title>
<style>
#center {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
}

table {
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
}

th {border: 1px solid black;
	background-color: orange;
	width: 150px;
}
td{border: 1px solid black;}
a {
	margin: 10px auto;
}

#page {
	text-align: center;
}
</style>
</head>
<body>

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

   body {
        font-family: 'Inter', sans-serif;
        background-color: #f0f0f0;
        color: #333;
        margin: 0;
        padding: 0;
    }

    main {
        max-width: 800px;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
        text-align: center;
    }

    #center {
        margin-bottom: 30px;
    }

    #center h1 {
        font-size: 2.5em;
        margin-bottom: 20px;
        color: #4CAF50;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
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

    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        margin-bottom: 15px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 1em;
    }

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
            <a class="messages" href="/mail" onclick="window.open(this.href, '_blank', 'width=780, height=480'); return false;">메시지</a>
        </div>
    </header>
 <main>
    <div id="center">
        <h1>개인페이지 작성중</h1>
        <a href="/myprofile">나의 정보</a>
        <a href="/info">이력서</a>
        <a href="/review/${user.id}">나의 리뷰</a>
        <a href="/myquestion">문의 사항 보기</a>
    </div>

    <form action="update" method="post" id="myprofile">
        <input type="hidden" name="_method" value="put">
        <h2>${user.id}님의 개인페이지</h2>
        
        <table>
            <tr><td>아이디:</td><td>${user.id}</td></tr>
            <tr><td>이름:</td><td>${user.name}</td></tr>
            <tr><td>비밀번호:</td><td><input name="password" type="password" id="password"></td></tr>
            <tr><td>이메일:</td><td><input name="email" id="email" value="${user.email}"></td></tr>
            <tr><td>생년월일:</td><td>${user.birth}</td></tr>
            <tr><td>성별:</td><td>${user.gender}</td></tr>
            <tr><td>휴대폰:</td><td><input name="phone" id="phone" value="${user.phone}"></td></tr>
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
</script>
	
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