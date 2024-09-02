<%@ page contentType="text/html; charset=UTF-8"%>
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
    }

    fieldset {
      background-color: #ffffff;
      border: 1px solid #ddd;
      border-radius: 8px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      padding: 20px;
      width: 350px;
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
      background-color: #ff4d4d;
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
      background-color: #e60000;
    }
  </style>
  <title>Insert title here</title>
</head>
<body>

  <fieldset>
    <div>
      <h3>게시글/댓글 신고하기</h3>
      <form method="post" action="/board02/report">
        <input type="hidden" name="r_no" value="${list.b_no02}" /> 
        <input type="hidden" name="num" value="${list.num}" /> 
        <input type="hidden" name="id" value="${user.id}" />
        <input type="hidden" name="content" value="${list.content}" />

        <p><span>글 제목 : ${list.title}</span></p>
        <p><span>신고자 : ${user.id}</span></p>
        <p>신고사유</p>
        <label><input type="radio" name="report_content" value="욕설" />욕설</label>
        <label><input type="radio" name="report_content" value="도배" />도배</label>
        <label><input type="radio" name="report_content" value="음란성" />음란성</label>
        <input type="submit" value="신고하기" class="report" />
      </form>
    </div>
  </fieldset>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(function() {
      $(".report").click(function() {
        alert("신고 완료되었습니다.");
      })
    })
  </script>

</body>
</html>
