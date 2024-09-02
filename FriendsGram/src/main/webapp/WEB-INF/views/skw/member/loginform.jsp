<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<style>
    /* 기본 스타일 설정 */
    body {
        font-family: 'Arial', sans-serif;
        background-color: #ffffff;
        color: #333;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    h5 {
        text-align: center;
        font-size: 1.5em;
        margin-bottom: 20px;
        color: #333;
    }

    form {
        background: #ffffff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.2);
        max-width: 400px;
        width: 100%;
        position: relative;
    }

    label {
        font-size: 1em;
        color: #333;
    }

    table {
        width: 100%;
        margin-top: 20px;
        border-collapse: collapse;
    }

    td {
        padding: 10px;
        font-size: 1em;
    }

    td[bgcolor="orange"] {
        background-color: #4CAF50;
        color: white;
        text-align: center;
        font-weight: bold;
    }

    input[type="text"], input[type="password"] {
        width: calc(100% - 20px);
        padding: 8px;
        border-radius: 5px;
        border: 1px solid #ccc;
        margin-bottom: 10px;
        transition: all 0.3s ease;
    }

    input[type="text"]:focus, input[type="password"]:focus {
        border-color: #4CAF50;
        box-shadow: 0 0 10px rgba(76, 175, 80, 0.5);
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.3s ease;
        font-size: 1em;
    }

    input[type="submit"]:hover {
        background-color: #388E3C;
        transform: scale(1.05);
    }

    a {
        text-decoration: none;
        color: #4CAF50;
        font-weight: bold;
        margin: 0 5px;
        transition: color 0.3s ease;
    }

    a:hover {
        color: #388E3C;
    }

    .radio-group {
        text-align: center;
        margin-bottom: 20px;
    }

    .radio-group input[type="radio"] {
        display: none;
    }

    .radio-group label {
        font-size: 1em;
        color: #fff;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        background-color: #ccc;
        transition: background-color 0.3s ease, transform 0.3s ease;
        margin-right: 10px;
    }

    .radio-group input[type="radio"]:checked + label {
        background-color: #4CAF50;
        transform: scale(1.05);
    }
</style>
<script>
    function updateLinks() {
        var type = document.querySelector('input[name="type"]:checked').value;
        var joinLink = document.getElementById('join-link');
        var findPwLink = document.getElementById('findpw-link');
        
        if (type == '0') {
            joinLink.href = '/insert';
            joinLink.textContent = '회원 가입';
            findPwLink.href = '/findpw';
            findPwLink.textContent = '비번 찾기';
        } else {
            joinLink.href = '/corporationinsert';
            joinLink.textContent = '회원 가입';
            findPwLink.href = '/cofindpw';
            findPwLink.textContent = '비번 찾기';
        }
    }
</script>
</head>
<body>
<form:form action="login" method="post" modelAttribute="command">
    <h5>id와 password를 입력하세요</h5>
    <form:errors element="div" />
    
    <div class="radio-group">
    <input type="radio" id="type1" name="type" value="0" checked onclick="updateLinks()">
    <label for="type1">일반회원</label>

    <input type="radio" id="type2" name="type" value="1" onclick="updateLinks()">
    <label for="type2">기업회원</label>
</div>
    
    <table border="0">
        <tr>
            <td bgcolor="orange">아이디</td>
            <td><input name="id" type="text" size="10">
                <form:errors path="id"></form:errors>
            </td>
        </tr>
        <tr>
            <td bgcolor="orange">비밀번호</td>
            <td><input name="password" type="password" size="10"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="로그인">
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <a id="join-link" href="/insert">회원 가입</a>
                <a id="findpw-link" href="/findpw">비번찾기</a>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>