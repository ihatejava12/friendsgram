<%@ page contentType="text/html; charset=UTF-8"%>
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

/* 제목 입력란의 실선 제거 */
input[name="title"] {
    border: none; /* 실선 제거 */
    padding: 8px; /* 입력란에 여백 추가 */
    width: 100%; /* 입력란이 부모 요소의 너비를 채우도록 설정 */
    box-sizing: border-box; /* padding이 너비에 포함되도록 설정 */
    font-size: 16px; /* 글자 크기 */
    font-family: Arial, sans-serif; /* 글꼴 */
}

/* 내용 입력란의 실선 제거 및 크기 조정 */
textarea[name="content"] {
    border: none; /* 실선 제거 */
    padding: 8px; /* 입력란에 여백 추가 */
    width: 100%; /* 입력란이 부모 요소의 너비를 채우도록 설정 */
    min-height: 200px; /* 최소 높이 설정 */
    box-sizing: border-box; /* padding과 border가 너비에 포함되도록 설정 */
    resize: vertical; /* 세로 방향으로만 크기 조정 가능하도록 설정 */
    font-size: 16px; /* 글자 크기 */
    font-family: Arial, sans-serif; /* 글꼴 */
}

/* 새글 등록 버튼 스타일 */
input[type="submit"]#save {
    background-color: #007bff; /* 기본 배경색: 파란색 */
    color: white; /* 텍스트 색상: 흰색 */
    border: none; /* 경계 제거 */
    padding: 12px 24px; /* 패딩 조정 */
    border-radius: 4px; /* 둥근 모서리 */
    font-size: 16px; /* 글자 크기 */
    font-weight: bold; /* 글자 두께 */
    cursor: pointer; /* 마우스 커서: 포인터로 변경 */
    transition: background-color 0.3s ease, transform 0.2s ease; /* 배경색과 트랜지션 효과 */
    text-align: center; /* 텍스트 중앙 정렬 */
}

input[type="submit"]#save:hover {
    background-color: #0056b3; /* 호버 시 배경색: 어두운 파란색 */
    transform: scale(1.05); /* 버튼 크기 확대 효과 */
}

input[type="submit"]#save:focus {
    outline: none; /* 포커스 시 경계 제거 */
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
        <header>
            <h1>새로운 공지사항 수정</h1>
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
	<form action="/updatenotice" method="post">
		<input type="hidden" name="n_no" value="${nolist.n_no}">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input name="title" value="${nolist.title}"/></td>
			</tr>
			<tr>
				<td>작성자</td><!-- value칸에는 나중에 세션에 저장되어 있는 아이디를 불러오게 만들거임 -->
				<td><input name="id" value="${user.id}" type="hidden">${user.id}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
	        	<textarea name="content" id="editorTxt" rows="20" cols="70" placeholder="내용을 입력해주세요">${nolist.content}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" id="save" value="재등록하기"> 
				</td>
			</tr>
		</table>
	</form>
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
	
	
</body>
</html>