<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!--  bList begin end count pageNum totalPages -->
<title>기업페이지</title>
<style>
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html, body {
  height: 100%;
  margin: 0;
}

body {
  font-family: 'Inter', sans-serif;
  background-color: #f0f0f0;
  color: #333;
  display: flex;
  flex-direction: column;
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
  max-width: 600px;
  width: 100%;
  margin: 100px auto 0 auto; /* 화면 중앙에 고정되도록 조정 */
  padding: 30px 20px;
  background-color: #fff;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  border-radius: 10px;
  text-align: center;
}

#center {
  margin-bottom: 30px;
}

#center h1 {
  font-size: 2em;
  margin-bottom: 20px;
  color: #4CAF50;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
}

#center a {
  display: inline-block;
  margin: 10px 15px;
  padding: 8px 15px;
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
  padding: 8px 10px;
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
  padding: 8px;
  margin-top: 5px;
  margin-bottom: 15px;
  border-radius: 5px;
  border: 1px solid #ccc;
  font-size: 0.9em;
}

input[type="submit"] {
  width: 100%;
  padding: 10px;
  background-color: #4CAF50;
  color: #fff;
  border: none;
  border-radius: 5px;
  font-size: 1em;
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
</style>
</head>
<body>


  <main>

 <header class="header">
      <div class="logo">
         <a href="/main"> <img src="../images/logo.png" alt="프렌즈그램 로고"
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

    <div id="center">
        <h1>기업 페이지 작성중</h1>
        <a href="/corporationprofile">기업 페이지</a>
        <a href="${pageContext.request.contextPath}/corporationQuestionList">문의 사항 보기</a>
    </div>

    <form action="/updatecor" method="post" id="corporationprofile">
        <input type="hidden" name="_method" value="put">
        <h2>${user.id}님의 기업 페이지</h2>
        
        <table>
            <tr><td>아이디:</td><td>${user.id}</td></tr>
            <tr><td>이름:</td><td> <input name="name" id="name" value="${user.name}"></td></tr>
            <tr><td>변경할 비밀번호:</td><td><input type="password" name="password"></td></tr>
           
            <tr><td>회사:</td><td><input name="company" id="company" value="${user.company}"></td></tr>
            <tr><td>기업형태:</td><td>
                    <select name="scale" id="scale">
    <option value="1" <c:if test="${user.scale == 1}">selected</c:if>>개인사업</option>
    <option value="2" <c:if test="${user.scale == 2}">selected</c:if>>소기업</option>
    <option value="3" <c:if test="${user.scale == 3}">selected</c:if>>중소기업</option>
    <option value="4" <c:if test="${user.scale == 4}">selected</c:if>>대기업</option>
</select>
                </td>
            </tr>
            <tr><td>사업자등록번호:</td><td><input name="business_number" id="business_number" value="${user.business_number}"></td>
            </tr>
            <tr><td>대표자명:</td><td><input name="boss_name" id="boss_name" value="${user.boss_name}"></td>
            </tr>
            <tr><td>회사주소:</td><td>
    <input name="address" id="address" value="${user.address}">
    <input type="button" id="addbtn" value="우편번호 검색" onclick="addPost()">
</td></tr> <!-- 잘못된 위치 수정 -->
<tr><td>나머지 주소:</td><td><input name="detail_address" id="detail_address" value="${user.detail_address}"></td></tr>
            <tr><td>이메일:</td><td><input name="email" id="email" value="${user.email}"></td></tr>
            <tr><td>현재 비밀번호:</td><td><input type="password" id="password"></td></tr>
            <%-- <tr><td>휴대폰:</td><td><input name="phone" id="phone" value="${user.phone}"></td></tr> --%>
            <tr><td colspan="2"><input type="submit" value="수정"></td></tr>
        </table>
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
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
    function addPost(){
        new daum.Postcode({
            oncomplete: function(data) {
                document.querySelector("#address").value = data.address;
                alert("나머지 주소도 입력하세요.");
            }
        }).open();
    }    

    $(function() {
        $("#corporationprofile").submit(function(event) {
            event.preventDefault(); // 폼의 기본 제출 동작을 막음
            
            if (!$("#password").val()) {
                alert("비밀번호를 입력해야 합니다.");
                return false;
            }

            // AJAX 요청을 통해 폼 데이터를 서버로 전송
            $.ajax({
                type: "POST", // 여전히 POST 사용
                url: $(this).attr('action'),
                data: $(this).serialize(),
                success: function(response) {
                    alert("수정되었습니다.");
                    location.reload();
                },
                error: function() {
                    alert("수정에 실패했습니다. 다시 시도해 주세요.");
                }
            });
        });
    });
  </script>
</body>
</html>
