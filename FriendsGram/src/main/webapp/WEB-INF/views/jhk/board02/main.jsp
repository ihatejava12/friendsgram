<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

#headcontent h2 {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 20px;
  color: #333;
}

#headcontent form {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 20px;
  width: 100%;
}

#search-container {
  display: flex;
  justify-content: space-between;
  width: 100%;
}

#searchn {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  margin-right: 10px;
}

#append input {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  margin-right: 10px;
}

input[type="submit"] {
  padding: 10px 20px;
  background-color: #4CAF50;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
}

input[type="submit"]:hover {
  background-color: #45a049;
}

button {
  padding: 10px 20px;
  background-color: #4CAF50;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
}

button:hover {
  background-color: #45a049;
}



table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

table, th, td {
  border-bottom: 1px solid #ccc;
}

th, td {
  padding: 10px;
  text-align: center;
}

th {
  background-color: #4CAF50;
  color: #fff;
  font-weight: bold;
}

td a {
  color: #333;
  text-decoration: none;
}

td a:hover {
  text-decoration: underline;
}

td a:hover {
  text-decoration: underline;
}

#page a {
  margin: 0 5px;
  text-decoration: none;
  color: #4CAF50;
  font-weight: bold;
}

#page a:hover {
  text-decoration: underline;
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
	<header class="header">
      <div class="logo">
         <a href="/main"> <img src="../images/logo.png" alt="프렌즈그램 로고"
            class="logo-image" />
         </a>
      </div>
      <nav class="navigation">
      
      <c:if test="${user.role != 3}">
         <a href="/board01/main">코딩 게시판</a> 
         <a href="/board02/main">팀 모집</a> 
      </c:if> 
      <c:if test="${user.role == 3}">
         <a href="#">코딩 게시판</a> 
         <a href="#">팀 모집</a> 
      </c:if>  
      
         <a href="/board03/main">프리랜서 검색</a> 
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

	<div id="allcontent">
		<div id="headcontent">
			<h2 align="center">팀 모집 게시판</h2>
			<div id="search-container">
				<form action="main">
					<select name="searchn" id="searchn">
						<option value="0">전체</option>
						<option value="1">작성자</option>
						<option value="2">모집 마감기간</option>
						<option value="3">코드</option>
					</select>
	
					<span id="append"></span>
					
					<input type="submit" value="검색"/>
				</form>
				<c:if test="${user.id != null}">
					<form action="/newboard02">
						<button>새글 쓰기</button>
					</form>
				</c:if>
			</div>
		</div>
		<div>
			<table>
				<tr>
					<th style="width: 20%;">제목</th>
					<th style="width: 15%;">모집기간</th>
					<th style="width: 7%;">작성일</th>
					<th style="width: 7%;">작성자</th>
					<th style="width: 10%;">모집자 수</th>
					<th style="width: 10%;">모집 상태</th>
					<th style="width: 7%;">확정 팀원</th>
				</tr>
				<c:forEach items="${blist}" var="list">
					<tr>
						<td style="text-align: center;"><a href="/board02content/${list.b_no02}">${list.title}</a></td>
						<td style="text-align: center;"><fmt:formatDate value="${list.date}" dateStyle="short"/> ~ ${list.join_date}</td>
						<td style="text-align: center;"><fmt:formatDate value="${list.date}" dateStyle="short"/></td>
						<td><a href="/viewreview/${list.id}" onclick="window.open(this.href, '_blank', 'width=480, height=300'); return false;">${list.id}</a></td>
						<td style="text-align: center;">${list.volunteer}</td>
						
						<c:if test="${list.join01 == false}">
							<td style="text-align: center;">모집 중</td>
						</c:if>
						<c:if test="${list.join01 == true}">
							<td style="text-align: center;">모집 완료</td>
							<c:forEach items="${tlist}" var="team">
								<c:if test="${team.b_no02 == list.b_no02}">
									<td style="text-align: center;"><button onclick="window.open('/reviewteam/${list.b_no02}', '_blank', 'width=600, height=450, top=50, left=50, scrollbars=yes')">보기</button></td>
								</c:if>
							</c:forEach>
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
				처리방침</a> <a href="#">광고문의</a><c:if test="${user != null && user.role == 2 || user.role == 1}"><a href="/adminpage/board01">관리자</a></c:if>
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
            $("#append").html('<input type="date" name="search">&nbsp;&nbsp;&nbsp;');
        } else if(startSetting == 3){
            $("#append").html('<input name="search">');
        }
	});
	</script>
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
