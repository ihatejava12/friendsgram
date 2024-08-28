<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/board05.css" rel="stylesheet">
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
		</div>
	</header>

	<main>
		<div class="container">
			<form action="/board05/search" method="get">
			    <div class="search-container">
			        <div class="search-filters">
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
			            <div class="filter-group">
			                <label for="region">지역</label>
			                <select id="region" name="region">
			                    <option value="all" ${region == 'all' ? 'selected' : ''}>전체</option>
			                    <option value="서울" ${region == '서울' ? 'selected' : ''}>서울</option>
			                    <option value="경기" ${region == '경기' ? 'selected' : ''}>경기</option>
			                    <option value="인천" ${region == '인천' ? 'selected' : ''}>인천</option>
			                    <option value="강원도" ${region == '강원도' ? 'selected' : ''}>강원도</option>
			                    <option value="충청도" ${region == '충청도' ? 'selected' : ''}>충청도</option>
			                    <option value="전라도" ${region == '전라도' ? 'selected' : ''}>전라도</option>
			                    <option value="경상도" ${region == '경상도' ? 'selected' : ''}>경상도</option>
			                </select>
			            </div>
			        </div>
			        <div class="search-input-button">
			            <input type="text" id="search" name="keyword" placeholder="채용 공고 검색" value="${keyword}">
			            <button type="submit" class="search-button">검색</button>
			        </div>
			    </div>
			</form>


			<div class="write-button-container">
				<c:if test="${user.role == 3 }">
					<button class="write-button">
						<a href="/board05/write">글쓰기</a>
					</button>
				</c:if>
			</div>

			<c:forEach var="board" items="${board05List}">
				<div class="job-post">
					<div class="job-header">
						<h3>${board.company}</h3>
						<!-- 회사명 -->
						<p>
							작성일:
							<fmt:formatDate value="${board.date}" pattern="yyyy-MM-dd" />
						</p>
					</div>
					<div class="job-description">
						<p>
							<a href="board05/content/${board.b_no05}" style="text-decoration: none;">${board.title}</a>
						</p>
					</div>

					<div class="job-details">
						<p>${board.work_area}|경력기간:${board.career_period}년|학력:${board.background }</p>
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
