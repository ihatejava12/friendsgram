<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    padding: 20px 40px; /* 패딩을 늘려서 높이 증가 */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    text-align: center; /* 중앙 정렬 */
    margin-bottom: 20px; /* main과 footer 간격을 조정 */
}

header h1 {
    margin: 0;
    font-size: 28px; /* 글씨 크기 증가 */
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
    margin-bottom: 40px; /* main과 footer 사이의 간격을 40px로 설정 */
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
    height: calc(100vh - 40px); /* header와 맞닿도록 높이 조정 */
    margin-top: -20px; /* header와 맞닿게 상단 여백 제거 */
    margin-bottom: -40px; /* footer와 맞닿게 하단 여백 제거 */
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
    margin: 0 20px; /* 사이드바와의 간격 추가 */
}

.input-container {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 10px; /* 입력칸과 버튼 사이 간격 */
    margin-bottom: 20px; /* 입력칸과 테이블 사이 간격 */
}

.input-container input[type="text"] {
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ced4da;
    border-radius: 4px;
    width: 200px; /* 고정 폭 설정 */
}

.input-container button {
    padding: 10px 20px;
    font-size: 14px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    background-color: #007bff;
    color: #fff;
    font-weight: bold;
}

.input-container button:hover {
    background-color: #0056b3;
}

table {
    width: 50%; /* 테이블의 폭을 50%로 설정 */
    margin: 0 auto; /* 테이블을 중앙 정렬 */
    border-collapse: collapse;
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
}

table td a:hover {
    text-decoration: underline;
}

.filter-bar {
    display: flex;
    justify-content: center; /* 중앙 정렬 */
    gap: 10px; /* 버튼 사이 간격 */
    margin-bottom: 20px; /* 버튼과 표 사이의 간격 */
}

.filter-bar input[type="submit"],
.filter-bar input[type="button"] {
    padding: 10px 20px;
    font-size: 14px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-weight: bold;
}

.filter-bar input[type="submit"] {
    background-color: #007bff;
    color: #fff;
}

.filter-bar input[type="submit"]:hover {
    background-color: #0056b3;
}

.filter-bar input[type="button"] {
    background-color: #dc3545;
    color: #fff;
}

.filter-bar input[type="button"]:hover {
    background-color: #c82333;
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

/* 삭제 버튼 및 전체 선택 체크박스 스타일 */
#delete {
    background-color: #dc3545;
    color: #fff;
    border-radius: 4px;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s;
}

#delete:hover {
    background-color: #c82333;
}

.filter-bar label {
    display: flex;
    align-items: center;
    font-size: 14px;
    color: #495057;
}

#allcheck {
    margin-right: 8px; /* 텍스트와 체크박스 사이 간격 */
    cursor: pointer;
    accent-color: #007bff; /* 체크박스 색상 */
}

.filter-bar label span {
    margin-left: 5px; /* 텍스트와 체크박스 사이 간격 */
}
</style>
<title>Insert title here</title>
</head>
<body>
    <div class="container">
        <header>
            <h1>금지어 관리</h1>
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
                <div class="input-container">
                    <input type="text" placeholder="금지할 단어를 입력하세요" name="newword" id="newword">
                    <button name="insert" id="insert">추가</button>
                </div>
                <div class="filter-bar">
                    <input type="button" name="delete" id="delete" value="삭제">
                    <label for="allcheck">
                        <input type="checkbox" name="allcheck" id="allcheck">
                        <span>전체선택</span>
                    </label>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>단어</th>
                            <th>선택</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${wlist}" var="word">
                            <tr>
                                <td>${word.word}</td>
                                <td><input type="checkbox" name="no" id="no" value="${word.word}"></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </main>
        </div>
        <footer class="footer">
            <div class="footer-links">
                <a href="#">프리랜서 이용약관</a> <a href="#">고객센터</a> <a href="#">개인정보 처리방침</a> <a href="#">이용약관</a>
            </div>
            <div class="company-info">
                <p>© 2024 Freelance Company. All Rights Reserved.</p>
            </div>
        </footer>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(function(){
            $("#insert").on("click", function(){
                let a = $("#newword").val();
                
                if(a != ""){
	                $.ajax({url:"/insertword",
	                        data:"word="+a,
	                        method:"post",
	                        dataType:"json"
	                }).always(function(){
	                    location.reload();
	                })
                } else {
                	alert("입력창이 비어있습니다!");
                }
            })
            
            $("#delete").click(function(){
                let dnums = [];
                $.each($("[name='no']:checked"), function(){
                    dnums.push($(this).val())
                })
                $.ajax({url:"/deleteword",
                        data:"list="+dnums,
                        method:"delete",
                        dataType:"json"
                }).done(function(){
                    location.reload();
                })
            })
            
            $("#allcheck").on("click", function(){
                if($("#allcheck").prop("checked")){
                    $("[name='no']").prop("checked", true)
                } else {
                    $("[name='no']").prop("checked", false)
                }
            })
        })
    </script>
</body>
</html>
