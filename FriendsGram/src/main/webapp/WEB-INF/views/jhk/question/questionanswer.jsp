<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

button {
	background-color: #007bff; /* 기본 파란색 배경 */
	color: #fff;
	padding: 8px 16px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-weight: bold;
	transition: background-color 0.3s ease, transform 0.2s ease;
	/* 배경색과 트랜지션 효과 */
	margin-right: 10px; /* 버튼 사이 간격 추가 */
}

button:hover {
	background-color: #0056b3; /* 호버 시 배경색 */
	transform: scale(1.05); /* 버튼 크기 확대 효과 */
}

button:focus {
	outline: none; /* 포커스 시 경계 제거 */
}

button#delete {
	background-color: #dc3545; /* 붉은색 배경 */
}

button#delete:hover {
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
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="container-main">


			<main>
				<table>
					<tr>
						<td>제목</td>
						<td>${dto.title}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="hidden" name="id" value="${user.id}"
							readonly>${user.id}</td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td><fmt:formatDate value="${dto.date}" dateStyle="short" /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" id="editorTxt" rows="20"
								cols="70" readonly>${dto.content}</textarea></td>
					</tr>

				</table>
			</main>
		</div>
	</div>
</body>
</html>