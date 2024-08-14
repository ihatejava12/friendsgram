<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
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
         <a href="board01/main">코딩 게시판</a>  <a href="/board02/main">팀 모집</a> <a href="board03/main">프리랜서 검색</a>
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
		<div id="headcontent" align="center">
			<h2>팀 모집 게시판</h2>
		<form action="main">
			<!-- <label><input type="radio" name="searchn" value="0" class="start_radio" checked> 전체</label>
			<label><input type="radio" name="searchn" value="1" class="start_radio"> 작성자</label>
			<label><input type="radio" name="searchn" value="2" class="start_radio"> 기간</label>
			<label><input type="radio" name="searchn" value="3" class="start_radio"> 코드</label> -->
			<select name="searchn" id="searchn">
				<option value="0">전체</option>
				<option value="1">작성자</option>
				<option value="2">기간</option>
				<option value="3">코드</option>
			</select>

			<!-- <span id="id" style="display:none"><input name="search"></span>
			<span id="date" style="display:none"><input type="date" name="search"></span> -->
			
			<span id="append"></span>
			
			<input type="submit" value="검색"/>
		</form>
		</div>
		<div>
			<c:if test="${user.id != null}">
				<form action="/newboard02">
					<button>새글 쓰기</button>
				</form>
			</c:if>
			<table>
				<tr>
					<th>제목</th>
					<th>모집기간</th>
					<th>작성일</th>
					<th>모집자 수</th>
					<th>모집 상태</th>
				</tr>
				<c:forEach items="${blist}" var="list">
					<tr>
						<td><a href="/board02content/${list.b_no02}">${list.title}</a></td>
						<td><fmt:formatDate value="${list.date}" dateStyle="short"/> ~ ${list.join_date}</td>
						<td><fmt:formatDate value="${list.date}" dateStyle="short"/></td>
						<td>${list.volunteer}</td>
						
						<c:if test="${list.join01 == false}">
							<td>모집 중</td>
						</c:if>
						<c:if test="${list.join01 == true}">
							<td>모집 완료</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="main?p=${begin-1}&search=${search}&searchn=${searchn}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="main?p=${i}&search=${search}&searchn=${searchn}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="main?p=${end+1}&search=${search}&searchn=${searchn}">[다음]</a>
				</c:if>
			</div>
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
	const select = document.getElementById("searchn");
	
	select.addEventListener("change", function(e) {
		
		const startSetting = $("#searchn").val();
		
		if(startSetting == 1){
            $("#append").html('<input name="search">');
        }else if(startSetting == 2){
            $("#append").html('<input type="date" name="search">까지 하는 프로젝트');
        } else if(startSetting == 3){
            $("#append").html('<input name="search">');
        }
		


	});
	</script>
</body>
</html>