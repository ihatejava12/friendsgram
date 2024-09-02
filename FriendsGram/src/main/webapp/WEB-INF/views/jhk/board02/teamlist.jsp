<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f9;
      margin: 0;
      padding: 20px;
      color: #333;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      flex-direction: column;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
      background-color: #ffffff;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      overflow: hidden;
    }

    th, td {
      padding: 12px;
      text-align: center;
      border: 1px solid #dee2e6;
    }

    th {
      background-color: #f8f9fa;
      color: #495057;
      font-weight: bold;
    }

    td {
      color: #555;
    }

    input[type="checkbox"] {
      width: 20px;
      height: 20px;
      cursor: pointer;
    }

    input[type="button"] {
      padding: 10px 20px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-weight: bold;
      transition: background-color 0.3s ease;
    }

    input[type="button"]:hover {
      background-color: #0056b3;
    }
  </style>
  <title>Insert title here</title>
</head>
<body>
  <table>
    <tr>
      <th>신청일자</th>
      <th>지원자</th>
      <th>신청한 언어</th>
      <th>참여 여부</th>
    </tr>
    <c:forEach items="${tlist}" var="team">
      <tr>
        <td><fmt:formatDate value="${team.date}" dateStyle="short"/></td>
        <td>${team.id}</td>
        <td>${team.code}</td>
        <td>
          <input type="checkbox" name="request" value="${team.id}">
        </td>
      </tr>
    </c:forEach>
  </table>
  <input type="button" value="확정완료" id="teamcheck">
  
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(function(){
      $("#teamcheck").on('click', function(){
        let list = [];
        $.each($("[name='request']:checked"), function(){
          list.push($(this).val())
        })
        let b_no02 = ${b_no02}
        
        $.ajax({
          url: "/maketeam",
          data: "list=" + list + "&b_no02=" + b_no02,
          method: "post"
        }).done(function(){
          alert("팀 확정이 완료되었습니다! 축하드립니다!")
          self.close();
        })
      })
    })
  </script>
</body>
</html>
