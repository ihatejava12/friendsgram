<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>  
<meta charset="UTF-8">
<title>${dto.title}</title>
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
  margin-top: 80px;
  font-family: 'Inter', sans-serif;
  background-color: #f0f0f0;
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

main {
  font-size: 14px;
  line-height: 1.6;
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  margin: 0 auto;
  padding: 20px;
  max-width: 600px;
  background-color: #fff;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  border-radius: 10px;
  background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

main:hover {
  transform: scale(1.02);
  box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
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
  transition: color 0.3s ease;
}

.footer-links a:hover {
  color: #ff5722;
}

.company-info p {
  margin-top: 10px;
  font-size: 14px;
}

.table {
  border: 1px solid black;
  width: 100%;
  border-collapse: collapse;
}

th {
  border: 1px solid black;
  background-color: lightgray;
  width: 150px;
  background-image: linear-gradient(45deg, #f3ec78, #af4261);
  color: #fff;
  font-weight: bold;
}

td {
  border: 1px solid black;
}

.action-buttons {
  text-align: right;
  margin-bottom: 20px;
}

.action-buttons .button {
  margin-left: 10px;
  padding: 8px 15px;
  background-color: #4CAF50;
  color: #fff;
  text-decoration: none;
  border-radius: 5px;
  font-weight: bold;
  transition: background-color 0.3s ease, transform 0.3s ease;
}

.action-buttons .button:hover {
  background-color: #45a049;
  transform: scale(1.1);
}

.title {
  font-size: 1.8em;
  font-weight: bold;
  margin-bottom: 15px;
  color: #333;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
  background: linear-gradient(120deg, #f093fb 0%, #f5576c 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.details dt {
  font-weight: bold;
  margin-bottom: 5px;
}

.details dd {
  margin: 0 0 15px 0;
  padding: 0 0 10px 0;
  border-bottom: 1px solid #eee;
}

.work-type, .join02 {
  margin-bottom: 15px;
}

.work-type-tag, .join02-tag {
  display: inline-block;
  padding: 5px 10px;
  border-radius: 3px;
  font-size: 0.9em;
  color: #fff;
}

.work-type-tag.in {
  background-color: #4CAF50;
}

.work-type-tag.out {
  background-color: #FF5722;
}

.join02-tag.in {
  background-color: #9E9E9E;
}

.join02-tag.out {
  background-color: #4CAF50;
}

.button {
  display: inline-block;
  padding: 10px 20px;
  background-color: #4CAF50;
  color: #fff;
  text-decoration: none;
  border-radius: 5px;
  font-weight: bold;
  text-align: center;
  transition: background-color 0.3s ease, transform 0.3s ease;
  margin-top: 20px;
}

.button:hover {
  background-color: #45a049;
  transform: scale(1.05);
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
    <div class="main-container">
        <div class="content">
            <div class="action-buttons">
            
             <c:if test="${user.id == dto.id }">
                        <a href="/board04/updateform/${dto.b_no04}" class="button">수정</a>
                        <a href="#" id="${dto.b_no04}" class="button delete-btn">삭제</a>
                    </c:if>
                <a href="/list" class="button">목록</a>
            </div>

            <div class="title">${dto.title}</div>
            <dl class="details">
                <dt>아이디</dt>
                <dd>${dto.id}</dd>
                <dt>작성일</dt>
                <dd><fmt:formatDate value="${dto.date}" pattern="yyyy-MM-dd" /></dd>

                <dt>근무 형태</dt>
                <div class="work-type">
                    <c:if test="${dto.work_type}">
                        <dd class="work-type-tag in">상주</dd>
                    </c:if>
                    <c:if test="${!dto.work_type}">
                        <dd class="work-type-tag out">원격</dd>
                    </c:if>
                </div>

                <dt>급여</dt>
                <dd>${dto.salary}</dd>
                <dt>경력기간</dt>
                <dd>${dto.career_period}</dd>

                <dt>내용</dt>
                <dd>${dto.content}</dd>

                <dt>모집기간</dt>
                <dd>${dto.join_date}</dd>

                <dt>모집상태</dt>
                <div class="join02">
                    <c:if test="${dto.join02}">
                        <dd class="join02-tag out">모집중</dd>
                    </c:if>
                    <c:if test="${!dto.join02}">
                        <dd class="join02-tag in">모집완</dd>
                    </c:if>
                </div>

                <dt>모집자수</dt>
                <dd>${dto.volunteer}</dd>

                <dt>기간</dt>
                <dd>${dto.employment_date}</dd>

                <dt>시작일</dt>
                <dd>${dto.employment_start}</dd>
            </dl>
             <a href="#" id="join-btn" class="button">지원하기</a>
        </div>
    </div>
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function() {
    $("a.delete-btn").click(function() {
        let b_no04 = $(this).attr("id"); 
        $.ajax({
            url: "/board04/delete/" + b_no04,
            method: "DELETE",
            success: function(response) {
                if (response === 1) {
                    alert("삭제되었습니다.");
                    location.href = "/list";
                } else {
                    alert("삭제에 실패했습니다.");
                }
            },
            error: function() {
                alert("오류가 발생했습니다.");
            }
        });
        return false; 
    });

    $('#join-btn').click(function(e) {
        e.preventDefault(); // 기본 링크 클릭 동작 방지
        
        var boardNo = ${dto.b_no04}; // 현재 게시글 번호
        var userId = "${user.id}"; // 세션에서 사용자 ID 가져오기

        console.log("AJAX 요청 데이터:", {
            b_no04: boardNo,
            id: userId
        });

        $.ajax({
            url: '/board04/joinAndSendResume?b_no04=' + boardNo,
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                b_no04: boardNo,
                return_man: "${dto.id}",
                title: "${dto.title}의 이력서 입니다.",
                content: `이력서 내용:
                이름: ${memberInfo.name}
                생년월일: ${memberInfo.birth}
                나이: ${memberInfo.age}
                성별: ${memberInfo.gender}
                전화번호: ${memberInfo.phone}
                이메일: ${memberInfo.email}
                주소: ${memberInfo.address}
                나머지 주소: ${memberInfo.detail_address}
                자기소개서: ${memberInfo.content}
                학교명: ${memberInfo.school_name}
                학교 기간: ${memberInfo.school_period}
                학교 전공: ${memberInfo.school_major}
                경력 회사명: ${memberInfo.career_nme}
                경력 기간: ${memberInfo.career_period}
                경력 담당업무: ${memberInfo.career_role}
                자격증 이름: ${memberInfo.certificate_name}
                자격증 취득일자: ${memberInfo.certificate_date}`,
                id: userId
            }),
            success: function(response) {
                alert("지원 및 이력서 전송이 성공적으로 완료되었습니다.");
            },
            error: function(xhr, status, error) {
                alert("지원 및 이력서 전송에 실패했습니다.");
            }
        });
    });
});


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