<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write Page</title>
<link href="/css/kyh/write.css" rel="stylesheet">
</head>
<body>
	<header class="header">
		<div class="logo">
			<a href="/main"> <img src="images/logo.png" alt="프렌즈그램 로고"
				class="logo-image" />
			</a>
		</div>
		<nav class="navigation">
			<a href="board01/main">코딩 게시판</a>  <a href="board02/main">팀 모집</a> <a href="board03/main">프리랜서 검색</a>
			 <a	href="/list">프리랜서 공고</a> <a href="/board05">취업 공고</a>
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
<form action="/board05/write" method="post">

    <label for="id">아이디:</label>
    <input type="text" id="id" name="id" value="${user.id }"><br><br>

    <label for="title">제목:</label>
    <input type="text" id="title" name="title"><br><br>

    <label for="company">회사명:</label>
    <input type="text" id="company" name="company" value="${user.company }"><br><br>

    <label for="work_type">근무 형태:</label>
    <input type="radio" id="onsite" name="work_type" value="true">
    <label for="onsite">원격</label>
    <input type="radio" id="remote" name="work_type" value="false">
    <label for="remote">상주</label><br><br>

    <div id="programming_language">스킬:
    <label><input type="checkbox" name="programming_language" value="JAVA"> JAVA</label><br>
    <label><input type="checkbox" name="programming_language" value="PYTHON"> PYTHON</label><br>
    <label><input type="checkbox" name="programming_language" value="HTML"> HTML</label><br>
    <label><input type="checkbox" name="programming_language" value="C"> C</label><br>
    <label><input type="checkbox" name="programming_language" value="DATABASE"> DATABASE</label><br>
    <label><input type="checkbox" name="other" id="other-checkbox" value="other"> 기타</label><br>
    <input type="text" id="other-input" name="programming_language" placeholder="Enter other language" style="display: none;"><br>
</div>

<script>
    document.getElementById('other-checkbox').addEventListener('change', function() {
        var otherInput = document.getElementById('other-input');
        if (this.checked) {
            otherInput.style.display = 'inline-block';
        } else {
            otherInput.style.display = 'none';
            otherInput.value = ''; // 입력된 값을 초기화
        }
    });
</script>
<br><br>

    <label for="work_area">근무 지역:</label>
    <select id="work_area" name="work_area">
        <option value="서울">서울</option>
        <option value="경기">경기</option>
        <option value="인천">인천</option>
        <option value="강원도">강원도</option>
        <option value="충청도">충청도</option>
        <option value="전라도">전라도</option>
        <option value="경상도">경상도</option>
    </select><br><br>

    <label for="salary">급여:</label>
    <input type="text" id="salary" name="salary"> 만<br><br>

    <label for="career_period">경력 기간:</label>
    <input type="text" id="career_period" name="career_period"> 년<br><br>

    <label for="background">학력:</label>
    <select id="background" name="background">
        <option value="중졸">중학교 졸업</option>
        <option value="고졸">고등학교 졸업</option>
        <option value="초대졸">초대졸(2,3년)</option>
        <option value="대졸">대졸(4년)</option>
        <option value="대학원석사">대학원 석사</option>
        <option value="대학원박사">대학원 박사</option>
    </select><br><br>

    <label for="content">내용:</label>
    <textarea id="content" name="content">주요업무:
    
    
자격요건:


우대사항:
	</textarea><br><br>

    <input type="submit" value="Submit">
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
