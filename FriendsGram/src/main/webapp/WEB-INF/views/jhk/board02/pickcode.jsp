<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f9;
      margin: 0;
      padding: 20px;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      color: #333;
    }

    fieldset {
      background-color: #ffffff;
      border: 1px solid #ddd;
      border-radius: 8px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      padding: 20px;
      width: 400px;
    }

    h3 {
      font-size: 20px;
      color: #333;
      text-align: center;
      margin-bottom: 20px;
    }

    p {
      font-size: 14px;
      color: #555;
      margin-bottom: 10px;
    }

    label {
      font-size: 14px;
      color: #555;
      display: block;
      margin-bottom: 8px;
      cursor: pointer;
    }

    input[type="radio"] {
      margin-right: 10px;
    }

    input[type="submit"] {
      width: 100%;
      padding: 10px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-weight: bold;
      transition: background-color 0.3s ease;
      font-size: 16px;
      margin-top: 20px;
    }

    input[type="submit"]:hover {
      background-color: #0056b3;
    }
  </style>
  <title>Insert title here</title>
</head>
<body>
  <fieldset>
    <div>
      <h3>원하는 코드 신청하기</h3>

      <form method="post" action="/jointeam">
        <input type="hidden" name="b_no02" value="${list.b_no02}" />
        <input type="hidden" name="id" value="${user.id}" />

        <p><span>글 제목 : ${list.title}</span></p>
        <p><span>신청자 : ${user.id}</span></p>
        <c:forEach items="${picklist}" var="plist">
          <label><input type="radio" name="code" value="${plist.code}" />${plist.code}</label>
        </c:forEach>				
        <input type="submit" value="신청하기" class="insert" />
      </form>
    </div>
  </fieldset>
  
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(function() {
      $(".insert").click(function() {
        alert("신청이 완료되었습니다.");
      })
    })
  </script>
</body>
</html>
