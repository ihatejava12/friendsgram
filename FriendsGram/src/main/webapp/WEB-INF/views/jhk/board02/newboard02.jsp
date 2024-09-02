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
    font-family: 'Inter', sans-serif;
    font-size: 14px;
    line-height: 1.6;
    background-color: #f4f4f4;
    color: #333;
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
  display: flex;
  flex-direction: column;
  min-height: 100vh; /* Ensures full viewport height is covered */
  margin: 0;
  overflow-x: hidden; /* Prevents horizontal scrolling */
}

#allcontent {
  width: 80%;
  margin: 20px auto;
  padding: 20px;
  background-color: #ffffff;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
}

fieldset {
  border: 1px solid #ccc;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 8px;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

table, th, td {
  border: 1px solid #ccc;
}

th, td {
  padding: 10px;
  text-align: left;
}

th {
  background-color: #4CAF50;
  color: #fff;
  font-weight: bold;
}

input[type="text"], input[type="date"], input[type="number"], textarea {
  width: 95%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 1rem;
  background-color: #f9f9f9;
  color: #333;
  margin-bottom: 10px;
}

/* 제목 입력칸과 내용 입력칸의 border 제거 */
input[name="title"] {
    border: none; /* 실선 제거 */
    padding: 8px; /* 입력란에 여백 추가 */
    width: 100%; /* 입력란이 부모 요소의 너비를 채우도록 설정 */
    box-sizing: border-box; /* padding이 너비에 포함되도록 설정 */
    font-size: 16px; /* 글자 크기 */
    font-family: Arial, sans-serif; /* 글꼴 */
}

/* 내용 입력란의 실선 제거 및 크기 조정 */
textarea[name="content"] {
    border: none; /* 실선 제거 */
    padding: 8px; /* 입력란에 여백 추가 */
    width: 100%; /* 입력란이 부모 요소의 너비를 채우도록 설정 */
    min-height: 200px; /* 최소 높이 설정 */
    box-sizing: border-box; /* padding과 border가 너비에 포함되도록 설정 */
    resize: vertical; /* 세로 방향으로만 크기 조정 가능하도록 설정 */
    font-size: 16px; /* 글자 크기 */
    font-family: Arial, sans-serif; /* 글꼴 */
}

input[type="button"], button {
  padding: 10px 20px;
  background-color: #4CAF50;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
  text-align: center;
}

input[type="button"]:hover, button:hover {
  background-color: #45a049;
}

.buttons-container {
  text-align: center; /* 버튼들을 가운데 정렬 */
  margin-top: 20px;
}

.buttons-container a.button {
  display: inline-block;
  padding: 10px 20px;
  background-color: #4CAF50;
  color: #fff;
  border-radius: 4px;
  text-decoration: none;
  font-weight: bold;
  margin-right: 10px;
  text-align: center;
}

.buttons-container a.button:hover {
  background-color: #45a049;
}

#code {
  width: calc(70% - 22px); /* "추가" 버튼 옆에 배치할 수 있게 입력칸 크기 조정 */
}

#add {
  width: calc(30% - 10px); /* "추가" 버튼 크기 조정 */
  margin-left: 10px; /* 입력칸과 "추가" 버튼 사이의 간격 조정 */
}

#langs span {
  display: inline-block;
  background-color: #4CAF50;
  color: #fff;
  padding: 5px 10px;
  border-radius: 4px;
  margin-right: 5px;
  margin-top: 5px;
  font-size: 0.9rem;
}

#langs span .delete {
  background-color: #dc3545;
  color: #fff;
  padding: 2px 5px;
  margin-left: 5px;
  border-radius: 4px;
  cursor: pointer;
}

#langs span .delete:hover {
  background-color: #c82333;
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

.footer-links a:hover {
  text-decoration: underline;
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
			        	<textarea name="content" id="editorTxt" rows="20" cols="80" placeholder="욕설 포함시 작성해 놓은 모든 내용이 초기화됩니다."></textarea>
						</td>
					</tr>
					<tr>
						<td>지원자 수</td>
						<td ><input type="number" name="volunteer" min="1"></td>
					</tr>
					
					<tr>
						<td>개발 언어</td>
						<td>
							<input type="text" id="code">
							<input type="button" id="add" value="추가">
						</td>
					</tr>	
					<tr>
						<td colspan="2">
							<div id="langs"></div>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="buttons-container">
							<a href="/board02/main" class="button">돌아가기</a>
							<button type="submit">등록하기</button>
						</td>
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
