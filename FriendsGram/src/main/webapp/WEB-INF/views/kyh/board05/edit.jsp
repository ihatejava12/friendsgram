<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${dto.title} 수정</title>
    <link href="/css/kyh/edit.css" rel="stylesheet">
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
			<a class="messages" href="/mail" onclick="window.open(this.href, '_blank', 'width=780, height=480,left=600,top=200'); return false;">메시지</a>
		</div>
	</header>
    
    <form action="/board05/update/${dto.b_no05}" method="post">
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" value="${dto.title}" required><br>
        <label for="company">회사:</label>
         <input type="text" name="company" value="${dto.company}" required>
        <label for="id">작성자:</label>
         <input type="text" name="id" value="${dto.id}" required readonly>
		
        

         <label for="career_period">경력 기간:</label>
		    <div style="display: inline-flex; align-items: center;">
		        <input type="text" id="career_period" name="career_period" value="${dto.career_period}" style="width: 50px;" required>
		        <span>년</span>
		    </div>
		    <br>
        
        <label for="work_type">근무 형태:</label>
			<div class="work-type-options">
			    <input type="radio" id="onsite" name="work_type" value="true" <c:if test="${dto.work_type == true}">checked</c:if>>
			    <label for="onsite">원격</label>
			    
			    <input type="radio" id="remote" name="work_type" value="false" <c:if test="${dto.work_type == false}">checked</c:if>>
			    <label for="remote">상주</label>
			</div>


        

        <label for="background">학력:</label>
			<select id="background" name="background">
			    <option value="중졸" <c:if test="${dto.background == '중졸'}">selected</c:if>>중학교 졸업</option>
			    <option value="고졸" <c:if test="${dto.background == '고졸'}">selected</c:if>>고등학교 졸업</option>
			    <option value="초대졸" <c:if test="${dto.background == '초대졸'}">selected</c:if>>초대졸(2,3년)</option>
			    <option value="대졸" <c:if test="${dto.background == '대졸'}">selected</c:if>>대졸(4년)</option>
			    <option value="대학원석사" <c:if test="${dto.background == '대학원석사'}">selected</c:if>>대학원 석사</option>
			    <option value="대학원박사" <c:if test="${dto.background == '대학원박사'}">selected</c:if>>대학원 박사</option>
			</select>
			<br>

       <label for="work_area">근무 지역:</label>
		<select id="work_area" name="work_area">
		    <option value="서울" <c:if test="${dto.work_area == '서울'}">selected</c:if>>서울</option>
		    <option value="경기" <c:if test="${dto.work_area == '경기'}">selected</c:if>>경기</option>
		    <option value="인천" <c:if test="${dto.work_area == '인천'}">selected</c:if>>인천</option>
		    <option value="강원도" <c:if test="${dto.work_area == '강원도'}">selected</c:if>>강원도</option>
		    <option value="충청도" <c:if test="${dto.work_area == '충청도'}">selected</c:if>>충청도</option>
		    <option value="전라도" <c:if test="${dto.work_area == '전라도'}">selected</c:if>>전라도</option>
		    <option value="경상도" <c:if test="${dto.work_area == '경상도'}">selected</c:if>>경상도</option>
		</select>

        <label for="salary">급여:</label>
		    <div style="display: inline-flex; align-items: center;">
		        <input type="text" id="salary" name="salary" value="${dto.salary}" style="width: 100px;" required>
		        <span>만</span>
		    </div>
		    <br>

        <div id="programming_language">스킬:
    <label><input type="checkbox" name="programming_language" value="JAVA" 
        <c:if test="${fn:contains(dto.codes, 'JAVA')}">checked</c:if>> JAVA</label><br>
    <label><input type="checkbox" name="programming_language" value="PYTHON" 
        <c:if test="${fn:contains(dto.codes, 'PYTHON')}">checked</c:if>> PYTHON</label><br>
    <label><input type="checkbox" name="programming_language" value="HTML" 
        <c:if test="${fn:contains(dto.codes, 'HTML')}">checked</c:if>> HTML</label><br>
    <label><input type="checkbox" name="programming_language" value="C" 
        <c:if test="${fn:contains(dto.codes, 'C')}">checked</c:if>> C</label><br>
    <label><input type="checkbox" name="programming_language" value="DATABASE" 
        <c:if test="${fn:contains(dto.codes, 'DATABASE')}">checked</c:if>> DATABASE</label><br>
    <label><input type="checkbox" name="other" id="other-checkbox" value="other"
        <c:if test="${fn:contains(dto.codes, 'other')}">checked</c:if>> 기타</label><br>
    <input type="text" id="other-input" name="programming_language" placeholder="Enter other language" style="display: none;" 
        <c:if test="${fn:contains(dto.codes, 'other')}">style="display: inline-block;"</c:if>><br>
</div>


<script>
    document.getElementById('other-checkbox').addEventListener('change', function() {
        var otherInput = document.getElementById('other-input');
        if (this.checked) {
            otherInput.style.display = 'inline-block';
        } else {
            otherInput.style.display = 'none';
            otherInput.value = '';
        }
    });

    // 페이지 로드 시 체크 상태를 확인하여 숨김 여부를 설정합니다.
    window.addEventListener('load', function() {
        var otherInput = document.getElementById('other-input');
        if (!document.getElementById('other-checkbox').checked) {
            otherInput.style.display = 'none';
            otherInput.value = '';
        }
    });
</script>

<label for="content">내용:</label>
        <textarea id="content" name="content" required>${dto.content}</textarea><br>

        <button type="submit">수정하기</button>
    </form>
    
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
</body>
</html>
