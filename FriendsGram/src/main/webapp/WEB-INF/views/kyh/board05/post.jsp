<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/kyh/post.css" rel="stylesheet">
</head>
<body>
   <header class="header">
      <div class="logo">
         <a href="/main"> <img src="/images/logo.png" alt="프렌즈그램 로고"
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
   <form action="/board05/post/${b_no05}" method="post">
       <h2>이력서 전송</h2>
   
       <div>
           <label for="return_man">받는 사람:</label>
           <input type="text" id="return_man" name="return_man" value="${cpdto.id}" readonly>
       </div>
       
       <div>
           <label for="title">제목:</label>
           <input type="text" id="title" name="title" value="${dto.name}의 이력서 입니다." readonly>
       </div>
   
       <div>
           <label for="content">내용:</label>
           <textarea id="content" name="content" rows="10" cols="30" readonly>
이력서
이름: ${dto.name}
생년월일: ${dto.birth}
나이: ${dto.age}
성별: ${dto.gender}
전화번호: ${dto.phone}
email: ${dto.email}
주소: ${dto.address}

자기소개서: ${dto.content}
학교명: ${dto.school_name}
학교 기간: ${dto.school_period}
학교 전공: ${dto.school_major}
경력 회사명: ${dto.career_nme}
경력 기간: ${dto.career_period}
경력 담당업무: ${dto.career_role}
자격증 이름: ${dto.certificate_name}
자격증 취득일자: ${dto.certificate_date}
         </textarea>
       </div>
   
       <div>
           <label for="id">보낸 사람:</label>
           <input type="text" id="id" name="id" value="${dto.id}" readonly>
       </div>
   
       <button type="submit">이력서 전송</button>
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