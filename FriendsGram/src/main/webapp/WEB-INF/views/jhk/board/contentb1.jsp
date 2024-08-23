<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

.container {
    display: flex;
    flex-direction: column;
    min-height: 100vh; /* 컨테이너가 전체 화면을 차지하도록 설정 */
}

header {
    background-color: #f8f9fa; /* 부드러운 회색 배경 */
    padding: 10px 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    text-align: center; /* 중앙 정렬 */
    margin-bottom: 20px; /* main과 footer 간격을 조정 */
}

header h1 {
    margin: 0;
    font-size: 24px;
    color: #343a40; /* 짙은 회색 텍스트 */
}

header nav {
    margin-top: 10px; /* h1 태그와 a 태그 사이의 간격 */
    display: flex;
    justify-content: center;
    gap: 15px; /* 각 a 태그 사이의 간격 */
}

header nav a {
    text-decoration: none;
    color: #495057; /* 회색 텍스트 */
    font-weight: bold;
}

header nav a:hover {
    color: #007bff; /* 링크에 마우스를 올렸을 때의 색상 */
}

.container-main {
    display: flex;
    flex-grow: 1;
    margin-bottom: 0; /* main과 footer 사이의 간격 제거 */
}

aside {
    background-color: #343a40; /* 짙은 회색 배경 */
    padding: 20px;
    color: #fff;
    width: 200px;
    flex-shrink: 0;
    display: flex;
    flex-direction: column;
    align-items: center; /* 중앙 정렬 */
    text-align: center; /* 중앙 정렬 */
    margin-top: -20px; /* header와 맞닿게 상단 여백 제거 */
    margin-bottom: 0; /* footer와 맞닿게 하단 여백 제거 */
    height: auto; /* 높이를 내용에 맞게 조정 */
}

aside ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

aside ul li {
    margin-bottom: 10px;
}

aside ul li a {
    color: #adb5bd; /* 연한 회색 텍스트 */
    text-decoration: none;
    display: block;
    font-weight: bold;
}

aside ul li a:hover {
    color: #007bff; /* 링크에 마우스를 올렸을 때의 색상 */
}

main {
    flex-grow: 1;
    padding: 20px;
    background-color: #ffffff; /* 화이트 배경 */
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
    border-radius: 8px; /* 둥근 모서리 */
    margin: 0 20px 20px 20px; /* 사이드바와의 간격 추가 및 하단 간격 추가 */
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

table th, table td {
    border: 1px solid #dee2e6;
    padding: 8px;
    text-align: center;
}

table th {
    background-color: #e9ecef; /* 부드러운 회색 배경 */
    color: #495057;
    font-weight: bold;
}

table td a {
    color: #007bff; /* 링크 텍스트 색상 */
    text-decoration: none;
    padding: 8px 16px;
    background-color: #e9ecef;
    border-radius: 4px;
    font-weight: bold;
}

table td a:hover {
    background-color: #007bff;
    color: white;
    text-decoration: none;
}

#delete input[type="button"] {
    background-color: #dc3545; /* 붉은색 배경 */
    color: #fff;
    padding: 8px 16px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-weight: bold;
}

#delete input[type="button"]:hover {
    background-color: #c82333; /* 버튼에 마우스를 올렸을 때의 색상 */
}

footer {
    background-color: rgba(30, 33, 40, 0.68);
    color: white;
    padding: 30px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    margin-top: 0; /* 자동 여백 설정으로 footer가 컨테이너 하단에 위치 */
}

.footer-links a {
    margin-right: 15px;
    color: white;
    text-decoration: none;
    font-weight: bold;
}

.footer-links a:hover {
    text-decoration: underline;
}

.company-info p {
    margin-top: 10px;
    font-size: 14px;
}
</style>
<title>코딩 게시판 내부</title>
</head>
<body>
    <div class="container">
        <header>
            <h1>게시글 삭제</h1>
            <nav>
                <a href="/adminpage/board01">코딩 게시판</a>
                <a href="/adminpage/board02">팀 모집</a>
                <a href="/adminpage/board03">프리랜서 검색</a>
                <a href="/adminpage/board04">프리랜서 공고</a>
                <a href="/adminpage/board05">취업 공고</a>
            </nav>
        </header>

        <div class="container-main">
            <aside>
                <ul>
                    <li><a href="/adminpage/board01">게시판 관리</a></li>
					<li><a href="/adminpage/notice">공지사항</a></li>
					<li><a href="/adminpage/questionlist">문의사항</a></li>
					<li><a href="/adminpage/advertisinglist">광고문의</a></li>
					<li><a href="/adminpage/consent">기업회원 인증 관리</a></li>
					<li><a href="/adminpage/memberlist">비매너 회원 제재</a></li>
					<li><a href="/adminpage/adminlist">관리자 등급 권한 관리</a></li>
					<li><a href="/adminpage/wordlist">금지어 추가 및 관리</a></li>
					<li><a href="/adminpage/reportlist">신고 상황</a></li>
                </ul>
            </aside>

            <main>
                <table>
                    <tr><td>제목</td><td>${blist1.title}</td></tr>
                    <tr><td>작성자</td><td>${blist1.id}</td></tr>
                    <tr><td>내용</td><td>${blist1.content}</td></tr>
                    <tr><td>등록일</td><td><fmt:formatDate value="${blist1.date}" dateStyle="short"/></td></tr>
                    <tr><td>조회수</td><td>${blist1.readcount}</td></tr>
                    <tr><td colspan="2" align="right">
                        <a href="/adminpage/board01">목록으로 이동</a>
                        <span id="delete">
                            <input type="button" value="삭제">
                        </span>
                    </td></tr>
                </table>
                
                <c:forEach items="${clist}" var="comm">
                    <c:if test="${comm.ref_level == 0}">
                        <fieldset>
                            <span>
                                ${comm.id} / <fmt:formatDate value="${comm.date}" dateStyle="short"/> 
                                <input type="button" class="delete" id="${comm.ref}" value="삭제">
                                <div>${comm.coment}</div>
                            </span>
                        </fieldset>
                    </c:if>
                    <c:if test="${comm.ref_level == 1}">
                        <fieldset>
                            <div style="float:left; height:50px; margin-right: 10px;">
                                <span class="icon">
                                    <img src="/img/level.gif" width="${comm.ref_level * 10}">    
                                    <img src="/img/re.gif" alt="답변" />
                                </span>
                            </div>
                            <span>
                                ${comm.id} / <fmt:formatDate value="${comm.date}" dateStyle="short"/> 
                                <input type="button" class="delete" id="${comm.ref}" value="삭제">
                                <div>${comm.coment}</div>
                            </span>
                        </fieldset>
                    </c:if>
                </c:forEach>
            </main>
        </div>
        
        <footer>
            <div class="footer-links">
                <a href="#">프리랜서 이용약관</a> <a href="#">고객센터</a> <a href="#">개인정보 처리방침</a> <a href="#">광고문의</a>
            </div>
            <div class="company-info">
                <p>(주)프렌즈그램(대표이사: 전재민)</p>
                <p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
            </div>
        </footer>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(function(){
            $("#delete").on("click", function(){
                let no = ${blist1.b_no01};
                $.ajax({url:"/delete1/"+no,
                    method:"delete"
                }).done(function(){
                    location.href='/adminpage/board01';
                })
            });

            $(".delete").click(function(){
                let ref = $(this).attr("id");
                $.ajax({url:"/deletecomm01/"+ref,
                        method:"delete"
                }).always(function(){
                    location.reload();
                });
            });
        })
    </script>
</body>
</html>
