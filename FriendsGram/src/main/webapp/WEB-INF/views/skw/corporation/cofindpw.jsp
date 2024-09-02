<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>비번 찾기</title>
        <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        h2 {
            text-align: center;
            font-size: 2em;
            margin-bottom: 20px;
            color: #333;
            border-bottom: 2px solid #2575fc;
            padding-bottom: 10px;
        }
        table {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            margin: 0 auto;
        }
        td {
            padding: 10px;
            font-size: 1em;
            vertical-align: middle;
        }
        input[type="text"], input[type="email"] {
            width: calc(100% - 22px);
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            margin-top: 5px;
            font-size: 1em;
        }
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            border-radius: 5px;
            border: none;
            background: #2575fc;
            color: white;
            font-size: 1.2em;
            cursor: pointer;
            transition: background 0.3s ease;
            margin-top: 20px;
        }
        input[type="submit"]:hover {
            background: #0056b3;
        }
        form:errors {
            color: #ff0000;
            margin-bottom: 10px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    
    <form:form action="/findcorpwresult" method="get" modelAttribute="command">
    <h2>비번 찾기</h2>
     	<form:errors element="div"/><%-- 글로벌 에러 출력 --%>
     	<table>
     	<tr><td>아이디</td><td><input name="id"></td></tr>
     	<tr><td>이름</td><td><input name="name"></td></tr>
     	<tr><td>이메일</td><td><input name="email"></td></tr>
     	<tr><td colspan="2"><input type="submit" value="비번찾기"></td></tr>
     	</table>
    </form:form>
</body>
</html>