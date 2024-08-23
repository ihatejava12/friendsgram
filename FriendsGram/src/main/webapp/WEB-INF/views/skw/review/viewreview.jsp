<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!--  bList begin end count pageNum totalPages -->
<title>나의 리뷰관리</title>
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
</style>

</head>
<body>
	<header class="header">
		<div class="logo">
			<a href="/main"> <img src="/images/logo.png" alt="프렌즈그램 로고"
				class="logo-image" />
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
		<h1>나의 리뷰 관리</h1>
		<a href="/myprofile">나의 정보</a>
		<a href="/info">이력서</a>
		<a href="/review/${user.id}">나의 리뷰</a>
		</div>
		
<h1>${user.name}님의 리뷰</h1>

<!-- 내가 받은 리뷰 리스트 -->
<section>
    <h2>내가 받은 리뷰 리스트</h2>
    <c:forEach items="${relist}" var="rlist">
        <c:if test="${rlist.subjects eq subjects}">
            <fieldset style="width:350px; margin-bottom: 20px; padding: 10px; border: 2px solid #ccc;">
                <legend>리뷰 작성자: ${rlist.id}</legend>
                <span>작성일: <fmt:formatDate value="${rlist.date}" dateStyle="short"/></span>
                
                <div>
                    <c:if test="${rlist.score == 1}">
                        <h4>별점: ★</h4>
                    </c:if>
                    <c:if test="${rlist.score == 2}">
                        <h4>별점: ★ ★</h4>
                    </c:if>
                    <c:if test="${rlist.score == 3}">
                        <h4>별점: ★ ★ ★</h4>
                    </c:if>
                    <c:if test="${rlist.score == 4}">
                        <h4>별점: ★ ★ ★ ★</h4>
                    </c:if>
                    <c:if test="${rlist.score == 5}">
                        <h4>별점: ★ ★ ★ ★ ★</h4>
                    </c:if>
                </div>
                <div>내용: ${rlist.content}</div>
                 <button onclick="reportReview('${rlist.mr_no}')">신고하기</button>
            </fieldset>
        </c:if>
    </c:forEach>
</section>

<script>
function reportReview(mr_no) {
    var reportContent = prompt('신고 사유를 입력해 주세요:');
    var reportedBy = '${user.id}'; // 현재 로그인된 사용자 ID (로그인된 사용자 정보가 제공된다고 가정)

    if (reportContent && confirm('이 리뷰를 신고하시겠습니까?')) {
        $.ajax({
            url: '/reportreview/' + mr_no,
            type: 'POST',
            data: {
                report_content: reportContent,
                reportedBy: reportedBy
            },
            success: function(response) {
                alert('리뷰가 신고되었습니다.');
                location.reload(); // 신고 후 페이지를 새로고침하여 업데이트
            },
            error: function(xhr, status, error) {
                alert('신고 중 오류가 발생했습니다.');
            }
        });
    }
}
</script>

<!-- 내가 쓴 리뷰 리스트 -->
<section>
    <h2>내가 작성한 리뷰 리스트</h2>
   <c:forEach items="${welist}" var="wlist">
    
    
    <c:if test="${wlist.id eq id}">
        <fieldset style="width:350px; margin-bottom: 20px; padding: 10px; border: 2px solid #f4b400;">
            <legend>내가 작성한 리뷰</legend>
            <span>작성일: <fmt:formatDate value="${wlist.date}" dateStyle="short"/></span>
            <button onclick="window.location.href='/editreview/${wlist.mr_no}'">수정하기</button>
             <button onclick="deleteReview('${wlist.mr_no}')">삭제하기</button>
            <div>
                <c:if test="${wlist.score == 1}">
                    <h4>별점: ★</h4>
                </c:if>
                <c:if test="${wlist.score == 2}">
                    <h4>별점: ★ ★</h4>
                </c:if>
                <c:if test="${wlist.score == 3}">
                    <h4>별점: ★ ★ ★</h4>
                </c:if>
                <c:if test="${wlist.score == 4}">
                    <h4>별점: ★ ★ ★ ★</h4>
                </c:if>
                <c:if test="${wlist.score == 5}">
                    <h4>별점: ★ ★ ★ ★ ★</h4>
                </c:if>
            </div>
            <div>내용: ${wlist.content}</div>
        </fieldset>
    </c:if>
</c:forEach>
    
    <!-- 비어있을 경우에 대한 경고 메시지 -->
<c:if test="${empty welist}">
    <p>내가 작성한 리뷰가 없습니다.</p>
    </c:if>
</section>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function deleteReview(mr_no) {
    if (confirm('정말로 이 리뷰를 삭제하시겠습니까?')) {
    	$.ajax({
    	    url: '/review/deletereview/' + mr_no,
    	    type: 'DELETE',
    	    success: function(response) {
    	        alert('리뷰가 삭제되었습니다.');
    	        location.reload();
    	    },
    	    error: function(xhr, status, error) {
    	        alert('삭제 중 오류가 발생했습니다.');
    	        console.error('Error details:', xhr.responseText);  // 오류 세부 정보 로그
    	    }
    	});
    }
}
</script>
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
</body>
</html>