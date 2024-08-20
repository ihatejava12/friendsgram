<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
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

</style>
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
         <a href="board01/main">코딩 게시판</a>  <a href="board02/main">팀 모집</a> <a href="board03/main">프리랜서 검색</a>
          <a   href="/list">프리랜서 공고</a> <a href="/board05">취업 공고</a>
      </nav>
      <div class="actions">
         <a class="login" href="/loginform">로그인</a> <a class="profile" href="/myprofile">프로필</a>
         <a class="messages" href="/mail" onclick="window.open(this.href, '_blank', 'width=780, height=480'); return false;">메시지</a>
      </div>
   </header>
	</div>
 <main>		
	<div id="allcontent">
			<fieldset style="width:100%;">
				<form action="/writeboard02" method="post">
				<input type="hidden" name="b_no02" value="${b_no02}"> 
				<table border="1">
					<tr>
						<td>제목</td>
						<td><input name="title"/></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input name="id" value="${user.id}" readonly></td>
					</tr>
					<tr>
						<td>모집기간</td>
						<td><input type='date' id='currentDate' data-placeholder="등록일"/> ~ <input type="date" name="join_date" id="join_date"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
			        	<textarea name="content" id="editorTxt" rows="20" cols="10" placeholder="내용을 입력해주세요" style="width: 700px"></textarea>
						</td>
					</tr>
					<tr>
						<td>지원자 수</td>
						<td ><input type="number" name="volunteer"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<a href="/board02/main">돌아가기</a>
							<button type="submit">등록하기</button>
						</td>
					</tr>
					<tr>
						<td>개발 언어<input type="text" id="code"><input type="button" id="add" value="추가"></td>
						
						<td><div id="langs"></div></td>
					</tr>	
				</table>
				</form>
			</fieldset>
	</div>
	
</main>	
	 <footer class="footer">
      <div class="footer-links">
         <a href="#">프리랜서 이용약관</a> <a href="#">고객센터</a> <a href="#">개인정보
            처리방침</a> <a href="#">광고문의</a>
      </div>
      <div class="company-info">
         <p>(주)프렌즈그램(대표이사: 전재민)</p>
         <p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
      </div>
   </footer>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
	</script>
	<script>
		$(function(){
			
		    $("#join_date").on("change", function() {
		        let currentDate = $("#currentDate").val();
		        let joinDate = $(this).val();

		        if (joinDate < currentDate) {
		            alert("기입한 날짜가 등록일보다 빠를 수 없습니다.");
		        	$(this).val("");
		    	}
		   	})
		    
		   	$("#add").on('click', function(){
		   		let code = $("#code").val();
		   		$("#langs").append(`<span id="\${code}">\${code}<input type="button" class="delete" value="X"><input type="hidden" name="code" value="\${code}"></span>`)
		   		$("#code").val("");
		   	})
		   	
		   	$("#langs").on('click','.delete', function(){
		   		$(this).parent().remove();
		   	})
			
		})
	</script>
</body>
</html>