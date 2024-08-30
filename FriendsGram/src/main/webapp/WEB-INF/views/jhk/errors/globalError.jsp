<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <style>
        /* 페이지 전체를 차지하는 컨테이너 */
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column; /* 세로 방향으로 정렬 */
            justify-content: center; /* 가로 중앙 정렬 */
            align-items: center; /* 세로 중앙 정렬 */
        }

        /* a 태그를 버튼처럼 스타일링 */
        a {
            display: inline-block;
            padding: 10px 20px;
            margin-top: -70px; /* 이미지와 버튼 사이의 간격을 10px로 설정 */
            font-size: 16px;
            color: #ffffff;
            background-color: #4CAF50; /* 초록색 버튼 */
            text-decoration: none;
            border-radius: 5px; /* 둥근 모서리 */
            transition: background-color 0.3s ease; /* 부드러운 색상 전환 */
        }

        /* 마우스를 올렸을 때의 효과 */
        a:hover {
            background-color: #45a049; /* 조금 더 어두운 초록색 */
        }
    </style>
</head>
<body>

    <img src="../images/GREEN.404.png">
    <a href="/main">Go to Main Page</a>

</body>
</html>
