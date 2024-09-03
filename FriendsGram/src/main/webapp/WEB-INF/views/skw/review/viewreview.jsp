<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!--  bList begin end count pageNum totalPages -->
<title>나의 리뷰관리</title>
<style>
/* 기존 스타일은 그대로 유지 */
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

th {
	border: 1px solid black;
	background-color: lightgray;
	width: 150px;
}

td {
	border: 1px solid black;
}

a {
	margin: 10px auto;
}

#page {
	text-align: center;
}

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
  padding: 0;
}

body {
    margin-top: 80px;
    padding-bottom: 100px;
}

.header, .footer {
  background-color: #fff;
  box-shadow: 0px 3px 6px rgba(18, 18, 18, 0.1);
  margin: 0;
  padding: 10px 20px;
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
  margin: 80px auto 40px auto;
  max-width: 800px;
  padding: 20px;
  background-color: #fff;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  border-radius: 10px;
}

.footer {
  background-color: rgba(30, 33, 40, 0.68);
  color: white;
  padding: 10px 20px;
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

.company-info p {
  margin-top: 10px;
  font-size: 14px;
}

.hero-image img {
    margin-top: 20px;
}

#allcontent {
	margin: auto 15% 
}

#headcontent{
	background-color: lightgreen;
}

body {
    font-family: 'Inter', sans-serif;
    background-color: #f4f4f4;
    color: #333;
    margin: 0;
    padding: 20px;
}

#center {
    text-align: center;
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

h2 {
    font-size: 1.8em;
    color: #333;
    margin-bottom: 20px;
    border-bottom: 2px solid #4CAF50;
    padding-bottom: 10px;
}

fieldset {
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
    border: 2px solid red; /* 빨간색 테두리 */
    margin-left: 20px; /* 오른쪽으로 이동 */
}

legend {
    font-size: 1.2em;
    font-weight: bold;
    color: #4CAF50;
    margin-left: 20px; /* 오른쪽으로 이동 */
}

h4 {
    color: #FFD700;
    margin: 5px 0;
    font-size: 1.2em;
}

button {
    margin-top: 10px;
    padding: 8px 12px;
    background-color: #ff5722;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.3s ease;
    margin-left: 20px; /* 버튼도 오른쪽으로 이동 */
}

button:hover {
    background-color: #e64a19;
    transform: scale(1.05);
}

button:focus {
    outline: none;
}

.success {
    background-color: #4CAF50;
}

.success:hover {
    background-color: #45a049;
}

.warn {
    background-color: #f4b400;
    color: #333;
}

.warn:hover {
    background-color: #f39c12;
}

p {
    font-size: 1.2em;
    color: #666;
    margin-top: 20px;
}

span, h4, div {
    margin-left: 20px; /* 오른쪽으로 이동시킴 */
}

.pagination {
  text-align: center;
  margin-top: 20px;
}

.pagination a {
  margin: 0 5px;
  padding: 8px 12px;
  background-color: #4CAF50;
  color: white;
  text-decoration: none;
  border-radius: 5px;
  font-weight: bold;
  transition: background-color 0.3s ease;
}

.pagination a:hover {
  background-color: #45a049;
}

/* 추가된 CSS */
.buttons-container {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

.buttons-container a {
    flex: 1;
    padding: 10px;
    background-color: #4CAF50;
    color: #fff;
    text-decoration: none;
    text-align: center;
    border-radius: 5px;
    font-weight: bold;
    margin: 0 5px; /* 버튼 사이 간격 */
    transition: background-color 0.3s ease, transform 0.3s ease;
}

.buttons-container a:hover {
    background-color: #45a049;
    transform: scale(1.05);
}
</style>
</head>
<body>
  <header class="header">
    <div class="logo">
      <a href="/main"> <img src="/images/logo.png" alt="프렌즈그램 로고" class="logo-image" />
      </a>
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
      <h1 style="margin-top: 30px;">나의 리뷰 관리</h1>
      <div class="buttons-container">
        <a href="/myprofile">나의 정보</a>
        <a href="/info">이력서</a>
        <a href="/review/${user.id}">나의 리뷰</a>
        <a href="/myquestion">문의 사항 보기</a>
        <a href="/board03/freelancer">프리랜서 등록</a>
      </div>
    </div>
    
    <h1>${user.name}님의 리뷰</h1>

    <!-- 내가 받은 리뷰 리스트 -->
    <section>
        <h2>내가 받은 리뷰 리스트</h2>
        <c:forEach var="rlist" items="${relist}">
            <fieldset style="border: 2px solid #ccc;">
                <legend>리뷰 작성자: ${rlist.id}</legend>
                <span>작성일: <fmt:formatDate value="${rlist.date}" dateStyle="short" /></span>
                <div>
                    <c:choose>
                        <c:when test="${rlist.score == 1}">
                            <h4>별점: ★</h4>
                        </c:when>
                        <c:when test="${rlist.score == 2}">
                            <h4>별점: ★ ★</h4>
                        </c:when>
                        <c:when test="${rlist.score == 3}">
                            <h4>별점: ★ ★ ★</h4>
                        </c:when>
                        <c:when test="${rlist.score == 4}">
                            <h4>별점: ★ ★ ★ ★</h4>
                        </c:when>
                        <c:otherwise>
                            <h4>별점: ★ ★ ★ ★ ★</h4>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div>내용: ${rlist.content}</div>
                <button class="warn" onclick="reportReview('${rlist.mr_no}', '${rlist.content}')">신고하기</button>
            </fieldset>
        </c:forEach>
        
        		 <!-- relist 페이징 -->
    <div class="pagination">
        <c:if test="${relistCurrentPage > 1}">
            <a href="?relistPage=${relistCurrentPage - 1}&welistPage=${welistCurrentPage}">이전</a>
        </c:if>
        <c:forEach var="page" begin="1" end="${relistTotalPages}">
            <a href="?relistPage=${page}&welistPage=${welistCurrentPage}" class="${page == relistCurrentPage ? 'active' : ''}">${page}</a>
        </c:forEach>
        <c:if test="${relistCurrentPage < relistTotalPages}">
            <a href="?relistPage=${relistCurrentPage + 1}&welistPage=${welistCurrentPage}">다음</a>
        </c:if>
    </div>
        
    </section>

  <!-- 내가 쓴 리뷰 리스트 -->
<section>
    <h2>내가 작성한 리뷰 리스트</h2>
    <c:forEach var="wlist" items="${welist}">
        <fieldset style="border: 2px solid #f4b400;">
            <legend>내가 작성한 리뷰</legend>
            <span>작성일: <fmt:formatDate value="${wlist.date}" dateStyle="short" /></span>
            
            <!-- 수정된 form을 새 창으로 -->
            <button class="success" onclick="openEditWindow('${wlist.mr_no}', '${wlist.score}', '${wlist.content}')">수정하기</button>
            
            <button class="warn" onclick="deleteReview('${wlist.mr_no}')">삭제하기</button>
            <div>
                <c:choose>
                    <c:when test="${wlist.score == 1}">
                        <h4>별점: ★</h4>
                    </c:when>
                    <c:when test="${wlist.score == 2}">
                        <h4>별점: ★ ★</h4>
                    </c:when>
                    <c:when test="${wlist.score == 3}">
                        <h4>별점: ★ ★ ★</h4>
                    </c:when>
                    <c:when test="${wlist.score == 4}">
                        <h4>별점: ★ ★ ★ ★</h4>
                    </c:when>
                    <c:otherwise>
                        <h4>별점: ★ ★ ★ ★ ★</h4>
                    </c:otherwise>
                </c:choose>
            </div>
            <div>내용: ${wlist.content}</div>
        </fieldset>
    </c:forEach>

    <!-- 비어있을 경우에 대한 경고 메시지 -->
    <c:if test="${empty welist}">
        <p>내가 작성한 리뷰가 없습니다.</p>
    </c:if>
</section>

     <!-- welist 페이징 -->
    <div class="pagination">
        <c:if test="${welistCurrentPage > 1}">
            <a href="?relistPage=${relistCurrentPage}&welistPage=${welistCurrentPage - 1}">이전</a>
        </c:if>
        <c:forEach var="page" begin="1" end="${welistTotalPages}">
            <a href="?relistPage=${relistCurrentPage}&welistPage=${page}" class="${page == welistCurrentPage ? 'active' : ''}">${page}</a>
        </c:forEach>
        <c:if test="${welistCurrentPage < welistTotalPages}">
            <a href="?relistPage=${relistCurrentPage}&welistPage=${welistCurrentPage + 1}">다음</a>
        </c:if>
    </div>
</main>

 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
 function openEditWindow(mr_no, score, content) {
     // 작은 새 창 열기
     var editWindow = window.open('', 'editWindow', 'width=500,height=400');

     // 새 창에 HTML 작성
     var formHtml = `
         <html>
         <head>
             <title>리뷰 수정</title>
             <style>
                 body {
                     font-family: 'Inter', sans-serif;
                     padding: 20px;
                     background-color: #f4f4f4;
                     color: #333;
                 }
                 form {
                     display: flex;
                     flex-direction: column;
                 }
                 label {
                     margin-bottom: 10px;
                     font-size: 1.2em;
                 }
                 input[type="number"], textarea {
                     margin-bottom: 20px;
                     padding: 8px;
                     font-size: 1em;
                 }
                 button {
                     padding: 10px;
                     background-color: #4CAF50;
                     color: white;
                     border: none;
                     border-radius: 5px;
                     cursor: pointer;
                     font-weight: bold;
                 }
                 button:hover {
                     background-color: #45a049;
                 }
                 .star-rating {
                     display: flex;
                   }

                   .star {
                     appearance: none;
                     padding: 1px;
                   }

                   .star::after {
                     content: '☆';
                     color: #FAE100;
                     font-size: 30px;
                   }

                   .star:hover::after,
                   .star:has(~ .star:hover)::after,
                   .star:checked::after,
                   .star:has(~ .star:checked)::after {
                     content: '★';
                   }

                   .star:hover ~ .star::after {
                     content: '☆';
                   }
             </style>
         </head>
         <body>
             <form action="/updatereview" method="post">
                 <input type="hidden" name="mr_no" value="` + mr_no + `">
                 
                 <div class="star-rating">
 				<input type="radio" name="score" class="star" value="1">
 				<input type="radio" name="score" class="star" value="2">
 				<input type="radio" name="score" class="star" value="3">
 				<input type="radio" name="score" class="star" value="4">
 				<input type="radio" name="score" class="star" value="5">
 			</div>
                 
                 <label for="content">Content:</label>
                 <textarea id="content" name="content" required>` + content + `</textarea>

                 <button type="submit">수정하기</button>
             </form>
         </body>
         </html>
     `;

     // 새 창에 HTML 작성
     editWindow.document.open();  // 새 창 열기
     editWindow.document.write(formHtml);  // HTML 작성
     editWindow.document.close();  // 창 닫기
 }

function reportReview(mr_no, content) {
    // 작은 새 창 열기
    var reportWindow = window.open('', 'reportWindow', 'width=400,height=400');

    // 새 창에 HTML 작성
    var formHtml = `
        <html>
        <head>
            <title>리뷰 신고</title>
            <style>
                body {
                    font-family: 'Inter', sans-serif;
                    padding: 20px;
                    background-color: #f4f4f4;
                    color: #333;
                }
                form {
                    display: flex;
                    flex-direction: column;
                }
                p {
                    margin-bottom: 15px;
                    font-size: 1.1em;
                }
                label {
                    font-size: 1em;
                    margin-bottom: 5px;
                }
                input[type="submit"] {
                    padding: 10px;
                    background-color: #ff5722;
                    color: white;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                    font-weight: bold;
                }
                input[type="submit"]:hover {
                    background-color: #e64a19;
                }
            </style>
        </head>
        <body>
            <form method="post" action="/reportreview/` + mr_no + `">
                <input type="hidden" name="r_no" value="` + mr_no + `" />
                <input type="hidden" name="reportedBy" value="${user.id}" />
                <input type="hidden" name="content" value="` + content + `" />
                
                <p><span>내용 : ` + content + `</span></p>
                <p><span>신고자 : ${user.id}</span></p>

                <p>신고사유</p>
                <label><input type="radio" name="report_content" value="욕설" />욕설</label><br>
                <label><input type="radio" name="report_content" value="도배" />도배</label><br>
                <label><input type="radio" name="report_content" value="음란성" />음란성</label><br>

                <br>
                <input type="submit" value="신고하기" class="report" />
            </form>
        </body>
        </html>
    `;

    // 새 창에 HTML 작성
    reportWindow.document.open();  // 새 창 열기
    reportWindow.document.write(formHtml);  // HTML 작성
    reportWindow.document.close();  // 창 닫기
}


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
			<a href="#">프리랜서 이용약관</a> <a href="#">고객센터</a> <a href="#">개인정보 처리방침</a> <a href="#">광고문의</a>
			<c:if test="${user != null && user.role == 2 || user.role == 1}"><a href="/adminpage/board01">관리자</a></c:if>
		</div>
		<div class="company-info">
			<p>(주)프렌즈그램(대표이사: 전재민)</p>
			<p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
		</div>
	</footer>
</body>
</html>