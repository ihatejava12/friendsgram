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
   padding: 0;
}
body {
    margin-top: 80px; /* 헤더 높이만큼의 여백 추가 */
    padding-bottom: 100px; /* footer가 보이도록 페이지 하단에 충분한 여백 추가 */
}

.header, .footer {
  background-color: #fff;
  box-shadow: 0px 3px 6px rgba(18, 18, 18, 0.1);
  margin: 0; /* 헤더의 마진 제거 */
  padding: 10px 20px; /* 필요한 패딩만 남김 */
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
        background-color: #f4f4f4;
        color: #333;
        margin: 0;
        padding: 20px;
    }

    main {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
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
    }

    legend {
        font-size: 1.2em;
        font-weight: bold;
        color: #4CAF50;
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
    </div>
  </header>
  <main>
    <div id="center">
      <h1 style="margin-top: 30px;">나의 리뷰 관리</h1>
      <a href="/myprofile">나의 정보</a>
      <a href="/info">이력서</a>
      <a href="/review/${user.id}">나의 리뷰</a>
      <a href="/myquestion">문의 사항 보기</a>
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
                <button class="success" onclick="window.location.href='/editreview/${wlist.mr_no}'">수정하기</button>
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