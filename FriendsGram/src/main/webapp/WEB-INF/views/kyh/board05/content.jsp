<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.title}</title>
<link href="/css/kyh/board05content.css" rel="stylesheet">
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
	
	<main>
        <div class="main-container">
            <div class="content">
            	<div class="company">${dto.company}
                    <div class="action-buttons" style="display: inline-block; float: right;">
                    <c:if test="${user.id == dto.id }">
                        <a href="/board05/edit/${dto.b_no05}" class="button">수정</a>
                        <a href="/board05/delete/${dto.b_no05}" class="button">삭제</a>
                    </c:if>
                        <a href="/board05" class="button">목록</a>
                    </div>
                </div>
                <div class="title">${dto.title }</div>
                <div class="tags">
                     <c:forEach var="code" items="${dto.codes}">
                     	<c:if test="${code != '' }">
            				<span class="tag">${code}</span>
            			</c:if> 
       				 </c:forEach>
                </div>
                <dl class="details">
                <dt>작성일</dt>
                    <dd><fmt:formatDate value="${dto.date}" pattern="yyyy-MM-dd" /></dd>
                    <dt>경력</dt>
                    <dd>${dto.career_period}년</dd>
                    <dt>학력</dt>
                    <dd>${dto.background}</dd>
                    <dt>근무 형태</dt>
                    <div class="work-type">
							<c:if test="${dto.work_type == true}">
								<dd class="work-type-tag red">상주</dd>
							</c:if>
							<c:if test="${dto.work_type == false}">
								<dd class="work-type-tag blue">원격</dd>
							</c:if>
						</div>
                    
                    <dt>모집지역</dt>
                    <dd>${dto.work_area}</dd>
                    <dt>주요업무</dt>
                    <dd>${dto.content}</dd>
                </dl>
            </div>
            
            <div class="sidebar">
                <h2>${dto.company}</h2>
                <p>${dto.company}에 지원 하시겠습니까?</p>
                <a href="/board05/post/${b_no05}" class="button">지원하기</a>
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
</body>
</html>
