<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>

<style>

/* 기본 스타일 */
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  font-family: 'Inter', sans-serif;
  background-color: #ffffff; /* 배경색을 흰색으로 변경 */
  color: #333333;
  margin: 0;
  padding: 0;
  margin-top: 80px;
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
  padding: 10px 20px; /* 헤더와 푸터의 패딩 크기 */
  background: #ffffff; /* 헤더 배경색을 흰색으로 변경 */
  box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.1); /* 그림자를 연하게 */
  transition: all 0.3s ease;
}

.logo img {
  height: 50px;
  width: auto;
}

.navigation a {
  margin-right: 15px;
  color: #333333;
  font-weight: bold;
  text-decoration: none;
  position: relative;
}

.navigation a::before {
  content: '';
  position: absolute;
  width: 0;
  height: 2px;
  bottom: -5px;
  left: 50%;
  background-color: #333333;
  visibility: hidden;
  transition: all 0.3s ease-in-out;
}

.navigation a:hover::before {
  visibility: visible;
  width: 100%;
  left: 0;
}

.actions a {
  margin-left: 10px;
  color: #28a745; /* 초록색 */
  font-weight: bold;
  text-decoration: none;
  transition: color 0.3s ease;
}

.actions a:hover {
  color: #218838; /* 초록색을 더 어둡게 */
}

.container {
  max-width: 800px; /* 너비를 줄여 메인을 작게 중앙에 위치시킴 */
  margin: 0 auto; /* 자동으로 중앙 정렬 */
  padding: 20px; /* 패딩 크기를 20px로 줄여 헤더, 푸터와 맞춤 */
  background: #ffffff;
  border-radius: 10px;
  box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
  margin-top: 100px; /* 상단 여백 추가 */
  margin-bottom: 100px; /* 하단 여백 추가 */
}

.search-container {
  display: flex;
  align-items: center; /* 검색 입력창과 버튼을 세로로 정렬 */
  gap: 10px;
  margin-bottom: 20px;
}

.search-filters {
  display: flex;
  gap: 20px;
}

.filter-group {
  display: flex;
  align-items: center;
  gap: 10px;
}

.filter-group label {
  font-weight: bold;
  margin-bottom: 0; /* 레이블 아래 여백 제거 */
}

.filter-group select {
  padding: 8px; /* 검색 입력창의 높이와 맞추기 위해 조정 */
  border-radius: 5px;
  border: 1px solid #ccc;
  background: #ffffff;
  color: #333333;
}

.search-input-button {
  display: flex;
  align-items: center;
  gap: 10px;
  flex-grow: 1;
}

.search-input-button input[type="text"] {
  padding: 8px;
  border-radius: 5px;
  border: 1px solid #ccc;
  background: #ffffff;
  color: #333333;
  flex: 1;
}

.search-button {
  padding: 8px 16px;
  border-radius: 5px;
  background: #28a745; /* 초록색 */
  color: #ffffff;
  border: none;
  cursor: pointer;
  transition: background 0.3s ease;
}

.search-button:hover {
  background: #218838; /* 초록색을 더 어둡게 */
}

.job-post {
  margin-bottom: 20px;
  padding: 20px;
  background: #f8f8f8; /* 연한 회색 배경 */
  border-radius: 10px;
  box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
}

.job-post:hover {
  transform: translateY(-10px);
}

.job-header p {
  font-size: 14px;
  color: #666666;
}

.job-description a {
  font-size: 18px;
  color: #333333;
  text-decoration: none;
}

.job-description a:hover {
  text-decoration: underline;
}

.career_period {
  margin-top: 10px;
  color: #666666;
}

.tags {
  margin-top: 10px;
  display: flex;
  gap: 10px;
}

.tag {
  padding: 5px 10px;
  background-color: #28a745; /* 초록색 */
  color: #fff;
  border-radius: 5px;
  font-size: 12px;
}

.work-type-tag {
  margin-top: 10px;
  padding: 5px 10px;
  border-radius: 5px;
  font-size: 12px;
  display: inline-block;
}

.red {
  background-color: #dc3545; /* 빨간색 */
  color: #fff;
}

.blue {
  background-color: #007bff; /* 파란색 */
  color: #fff;
}

#page {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

#page a, #page strong {
  margin: 0 5px;
  padding: 5px 10px;
  text-decoration: none;
  color: #fff;
  background: #28a745; /* 초록색 */
  border-radius: 5px;
  transition: background 0.3s ease;
}

#page a:hover {
  background: #218838; /* 초록색을 더 어둡게 */
}

.write-button-container {
  text-align: right;
  margin-bottom: 20px;
}

.write-button {
  padding: 12px 20px;
  background-color: #ff5733; /* 눈에 띄는 오렌지 색상 */
  color: #ffffff;
  font-size: 16px;
  font-weight: bold;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease, transform 0.3s ease;
}

.write-button:hover {
  background-color: #e74c3c; /* 더 진한 오렌지 색상 */
  transform: translateY(-2px);
}

.write-button a {
  color: #ffffff;
  text-decoration: none;
}

.footer {
  background-color: #333333; /* 다크 그레이 */
  color: white;
  padding: 10px 20px; /* 헤더와 동일한 패딩 크기 */
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  width: 100%;
  margin-top: auto;
}

.footer-links a {
  margin-right: 15px;
  color: white;
  text-decoration: none;
  font-weight: bold;
}

.footer-links a:hover {
  color: #28a745; /* 초록색 */
}

.company-info p {
  margin-top: 10px;
  font-size: 14px;
}
</style>

</head>
<body>
	<header class="header">
		<div class="logo">
			<a href="/main"> <img src="../images/logo.png" alt="프렌즈그램 로고"
				class="logo-image" />
			</a>
		</div>
		<nav class="navigation">
			<a href="board01/main">코딩 게시판</a> <a href="board02/main">팀 모집</a> <a
				href="board03/main">프리랜서 검색</a> <a href="/list">프리랜서 공고</a> <a
				href="/board05">취업 공고</a>
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
		<div class="container">
			<form action="/board04/search" method="get">
			    <div class="search-container">
			        <div class="filter-group">
			            <label for="language">개발언어</label>
			            <select id="language" name="language">
			                <option value="all" ${language == 'all' ? 'selected' : ''}>전체</option>
			                <option value="java" ${language == 'java' ? 'selected' : ''}>JAVA</option>
			                <option value="python" ${language == 'python' ? 'selected' : ''}>PYTHON</option>
			                <option value="html" ${language == 'html' ? 'selected' : ''}>HTML</option>
			                <option value="c" ${language == 'c' ? 'selected' : ''}>C</option>
			                <option value="database" ${language == 'database' ? 'selected' : ''}>DATABASE</option>
			                <option value="other" ${language == 'other' ? 'selected' : ''}>기타</option>
			            </select>
			        </div>
			        <div class="filter-group">
			            <label for="workType">근무 형태</label>
			            <select id="workType" name="workType">
			                <option value="all" ${workType == 'all' ? 'selected' : ''}>전체</option>
			                <option value="상주" ${workType == '상주' ? 'selected' : ''}>상주</option>
			                <option value="원격" ${workType == '원격' ? 'selected' : ''}>원격</option>
			            </select>
			        </div>
			        <div class="search-input-button">
			            <input type="text" id="search" name="keyword" placeholder="프리랜서 공고 검색" value="${keyword}">
			            <button type="submit" class="search-button">검색</button>
			        </div>
			    </div>
			</form>


			<div class="write-button-container">
				<c:if test="${user.role == 3 }">
					<button class="write-button">
						<a href="/board04/write">글쓰기</a>
					</button>
				</c:if>
			</div>

			<c:forEach var="board" items="${board04List}">
				<div class="job-post">
					<div class="job-header">
						
						<p>
							작성일:
							<fmt:formatDate value="${board.date}" pattern="yyyy-MM-dd" />
						</p>
					</div>
					<div class="job-description">
						<p>
							<a href="board04/content/${board.b_no04}" style="text-decoration: none;">${board.title}</a>
						</p>
					</div>

					<div class="career_period">
						<p>경력기간:${board.career_period}년</p>
						<!-- 지역 및 경력 기간 -->

						<!-- 사용 언어 태그 -->


						<div class="tags">
							<c:forEach var="code" items="${board.codes}">
								<c:if test="${code != '' }">
            				<span class="tag">${code}</span>
            			</c:if> 
							</c:forEach>
						</div>
						<div class="work-type">
							<c:if test="${board.work_type == true}">
								<span class="work-type-tag red">상주</span>
							</c:if>
							<c:if test="${board.work_type == false}">
								<span class="work-type-tag blue">원격</span>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>


			<div id="page">
    <c:if test="${begin > 1}">
        <a href="?p=1&searchn=${searchn}&search=${search}&language=${language}&workType=${workType}&region=${region}&keyword=${keyword}">처음</a>
        <a href="?p=${begin - 1}&searchn=${searchn}&search=${search}&language=${language}&workType=${workType}&region=${region}&keyword=${keyword}">이전</a>
    </c:if>

    <c:forEach begin="${begin}" end="${end}" var="i">
        <c:choose>
            <c:when test="${i == page}">
                <strong>${i}</strong>
            </c:when>
            <c:otherwise>
                <a href="?p=${i}&searchn=${searchn}&search=${search}&language=${language}&workType=${workType}&region=${region}&keyword=${keyword}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${end < totalPages}">
        <a href="?p=${end + 1}&searchn=${searchn}&search=${search}&language=${language}&workType=${workType}&region=${region}&keyword=${keyword}">다음</a>
        <a href="?p=${totalPages}&searchn=${searchn}&search=${search}&language=${language}&workType=${workType}&region=${region}&keyword=${keyword}">끝</a>
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
