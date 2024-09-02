<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    background-color: #f8f9fa;
    padding: 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    text-align: center;
    margin-bottom: 20px; /* 사이드바와의 간격 추가 */
    position: relative;
    z-index: 1;
}

header h1 {
    margin: 0;
    font-size: 28px;
    color: #343a40;
}

header nav {
    margin-top: 10px;
    display: flex;
    justify-content: center;
    gap: 15px;
}

header nav a {
    text-decoration: none;
    color: #495057;
    font-weight: bold;
}

header nav a:hover {
    color: #007bff;
}

.container-main {
    display: flex;
    flex-grow: 1;
}

aside {
    background-color: #343a40;
    padding: 20px;
    color: #fff;
    width: 200px;
    flex-shrink: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    height: calc(100vh - 60px); /* 전체 높이에서 헤더 높이 제외 */
    margin: -20px 0px -20px; /* 헤더와 사이드바 간격 추가 */
    box-sizing: border-box;
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
    color: #adb5bd;
    text-decoration: none;
    display: block;
    font-weight: bold;
}

aside ul li a:hover {
    color: #007bff;
}

main {
    flex-grow: 1;
    padding: 20px;
    background-color: #ffffff;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    margin: 0 20px;
}

.filter-bar {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-bottom: 20px;
}

.filter-bar select, .filter-bar input {
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ced4da;
    border-radius: 4px;
}

.filter-bar input[type="submit"] {
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-weight: bold;
}

.filter-bar input[type="submit"]:hover {
    background-color: #0056b3;
}

#delete {
    margin-bottom: 20px;
    background-color: #dc3545;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-weight: bold;
}

#delete:hover {
    background-color: #c82333;
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
    background-color: #e9ecef;
    color: #495057;
    font-weight: bold;
}

table td a {
    color: #007bff;
    text-decoration: none;
}

table td a:hover {
    text-decoration: underline;
}

.pagination {
    display: flex;
    justify-content: center;
    gap: 5px;
}

.pagination a {
    text-decoration: none;
    padding: 5px 10px;
    background-color: #007bff;
    color: #fff;
    border-radius: 5px;
}

.pagination a:hover {
    background-color: #0056b3;
}

.footer {
    background-color: rgba(30, 33, 40, 0.68);
    color: white;
    padding: 30px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    margin-top: 20px; /* 상단 여백 추가 */
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

/* 바로가기 버튼 스타일 */
button {
    background-color: #007bff; /* 기본 배경색 */
    color: #fff; /* 기본 텍스트 색상 */
    border: none; /* 기본 테두리 제거 */
    padding: 10px 20px; /* 패딩 */
    border-radius: 5px; /* 둥근 모서리 */
    cursor: pointer; /* 커서 변경 */
    font-weight: bold; /* 텍스트 두껍게 */
    font-size: 14px; /* 글씨 크기 */
    transition: background-color 0.3s, transform 0.2s; /* 배경색과 변형 효과 */
}

button:hover {
    background-color: #0056b3; /* 호버 시 배경색 */
    transform: scale(1.05); /* 호버 시 크기 변화 */
}

button:focus {
    outline: none; /* 포커스 시 아웃라인 제거 */
}
</style>
<title>Insert title here</title>
</head>
<body>
    <div class="container">
        <header>
            <h1>신고글 관리</h1>
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
                    <thead>
                        <tr>
                            <th>신고 내용</th>
                            <th>작성자</th>
                            <th>해당 글보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${rlist}" var="list">
                            <tr>
                                <td>${list.report_content}</td>
                                <td><a href="/adminpage/membercontent/${list.id}">${list.r_id}</a></td>
                                <td><button
                                        onclick="window.open('/adminreportboard/${list.num}/${list.co_no}/${list.report_num}', '_blank', 'width=500,height=400, top=50, left=50, scrollbars=yes')">바로가기</button></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
                <div id="page" class="pagination">
					<c:if test="${begin > pageNum }">
						<a href="reportlist?p=${begin-1}">[이전]</a>
					</c:if>
					<c:forEach begin="${begin }" end="${end}" var="i">
						<a href="reportlist?p=${i}">${i}</a>
					</c:forEach>
					<c:if test="${end < totalPages }">
						<a href="reportlist?p=${end+1}">[다음]</a>
					</c:if>
				</div>
            </main>
        </div>
        <footer class="footer">
            <div class="footer-links">
                <a href="#">프리랜서 이용약관</a> <a href="#">고객센터</a> <a href="#">개인정보
                    처리방침</a> <a href="#">광고문의</a><a href="/main">메인화면</a>
            </div>
            <div class="company-info">
                <p>(주)프렌즈그램(대표이사: 전재민)</p>
                <p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
            </div>
        </footer>
    </div>
</body>
</html>
