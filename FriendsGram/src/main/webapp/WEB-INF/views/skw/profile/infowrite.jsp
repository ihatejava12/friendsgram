<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!--  bList begin end count pageNum totalPages -->
<title>이력서 작성</title>
<style>

        /* 기본 스타일 */
        * {
          box-sizing: border-box;
          margin: 0;
          padding: 0;
        }

        body {
          font-family: 'Inter', sans-serif;
          background-color: #f0f0f0;
          color: #333;
          margin: 0;
          padding: 0;
          margin-top: 80px;
        }

        .header {
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          z-index: 1000;
          display: flex;
          justify-content: space-between;
          align-items: center;
          padding: 10px 20px;
          background-color: #fff;
          box-shadow: 0px 3px 6px rgba(18, 18, 18, 0.1);
          margin: 0;
        }

        .logo img {
          height: 50px;
          width: auto;
        }

        .navigation a {
          margin-right: 15px;
          color: #565E6C;
          font-weight: bold;
          text-decoration: none;
        }

        .actions a {
          margin-left: 10px;
          color: #0C9200;
          font-weight: bold;
          text-decoration: none;
        }

        main {
          font-family: 'Inter', sans-serif;
          font-size: 14px;
          line-height: 1.6;
          display: flex;
          flex-direction: column;
          min-height: 100vh;
          margin: 0 auto;
          padding: 0;
          overflow-x: hidden;
        }

        #center {
          max-width: 600px;
          margin: 50px auto;
          padding: 20px;
          background-color: #f9f9f9;
          border-radius: 10px;
          box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
          text-align: center;
          margin: 0 auto;
        }

        #center h1 {
          font-size: 2.5em;
          margin-bottom: 30px;
          color: #4CAF50;
          text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        #center a {
          display: inline-block;
          margin: 10px 15px;
          padding: 10px 20px;
          background-color: #4CAF50;
          color: #fff;
          text-decoration: none;
          border-radius: 5px;
          font-weight: bold;
          transition: background-color 0.3s ease, transform 0.3s ease;
        }

        #center a:hover {
          background-color: #45a049;
          transform: scale(1.05);
        }

        form {
          max-width: 500px;
          margin: auto;
          padding: 20px;
          background-color: #fff;
          border-radius: 10px;
          box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        table {
          width: 100%;
          border-collapse: collapse;
          margin-bottom: 20px;
        }

        table td {
          padding: 12px 15px;
          border-bottom: 1px solid #ddd;
        }

        table td:first-child {
          text-align: right;
          font-weight: bold;
          color: #666;
        }

        table td:last-child {
          text-align: left;
        }

        input[type="text"], textarea {
          width: calc(100% - 20px);
          padding: 10px;
          margin-top: 5px;
          margin-bottom: 15px;
          border-radius: 5px;
          border: 1px solid #ccc;
          font-size: 1em;
        }

        input[type="text"]:focus, textarea:focus {
          border-color: #4CAF50;
          box-shadow: 0 0 5px rgba(0, 255, 0, 0.5);
        }

        /* 버튼 스타일 */
        input[type="submit"], input[type="button"] {
          width: auto;
          padding: 8px 15px;
          border: none;
          border-radius: 5px;
          font-size: 1em;
          font-weight: bold;
          cursor: pointer;
          transition: background-color 0.3s ease, transform 0.3s ease;
        }

        input[type="submit"] {
          background-color: #4CAF50;
          color: #fff;
        }

        input[type="submit"]:hover {
          background-color: #45a049;
          transform: scale(1.05);
        }

        input[type="submit"]:active {
          background-color: #3e8e41;
          transform: scale(1);
        }

        /* 취소 버튼 스타일 */
        input[type="button"][value="취소"] {
          background-color: #f44336;
          color: #fff;
        }

        input[type="button"][value="취소"]:hover {
          background-color: #e53935;
          transform: scale(1.05);
        }

        input[type="button"][value="취소"]:active {
          background-color: #d32f2f;
          transform: scale(1);
        }

        /* 우편번호 검색 버튼 스타일 */
        input[type="button"][value="우편번호 검색"] {
          background-color: #008CBA;
          color: #fff;
          margin-left: 10px;
          padding-left: 15px;
          padding-right: 15px;
        }

        input[type="button"][value="우편번호 검색"]:hover {
          background-color: #007BB5;
          transform: scale(1.05);
        }

        input[type="button"][value="우편번호 검색"]:active {
          background-color: #005F8C;
          transform: scale(1);
        }

        .footer {
          background-color: rgba(30, 33, 40, 0.68);
          color: white;
          padding: 30px 20px;
          display: flex;
          justify-content: space-between;
          align-items: center;
          flex-wrap: wrap;
          width: 100%;
          margin-top: auto;
        }

        .footer-links a {
          margin-right: 15px;
          color: white;
          text-decoration: none;
          font-weight: bold;
        }

        .company-info p {
          margin-top: 10px;
          font-size: 14px;
        }

        /* 우편번호 검색 레이어 스타일 */
        #postcodeLayer {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            width: 400px;
            height: 500px;
            z-index: 9999;
            background: white;
            border: 1px solid black;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transform: translate(-50%, -50%);
        }
    </style>

</head>
<body>
<header class="header">
    <div class="logo">
        <a href="/main">
            <img src="../img/logo.png" alt="프렌즈그램 로고" class="logo-image"/>
        </a>
    </div>
    <nav class="navigation">
        <a href="/board01/main">코딩 게시판</a>  
        <a href="/board02/main">팀 모집</a> 
        <a href="/board03/main">프리랜서 검색</a>
        <a href="/list">프리랜서 공고</a> 
        <a href="/board05">취업 공고</a>
    </nav>
    <div class="actions">
        <c:if test="${user.id != null }">
            <a class="login" href="/logout">로그아웃</a>
        </c:if>
        <c:if test="${user.id == null }">
            <a class="login" href="/loginform">로그인</a>
        </c:if>
        <a class="profile" href="/myprofile">프로필</a>
        <a class="messages" href="/mail" onclick="window.open(this.href, '_blank', 'width=780, height=480'); return false;">메시지</a>
    </div>
</header>
<main>
<div id="center">
    <h1>이력서 작성</h1>
    <a href="/myprofile">나의 정보</a>
    <a href="/info">이력서</a>
    <a href="/review/${user.id}">나의 리뷰</a>
    <a href="/myquestion">문의 사항 보기</a>

<form action="insertInfo" method="post" id="infowrite">
    <h3>이력서 작성중</h3>
    <table>
        <tr><td>이름 :</td><td><input name="name" value="${user.name}"></td></tr>
        <tr><td>생년월일 :</td><td><input name="birth" value="${user.birth}"></td></tr>
        <tr><td>나이 :</td><td><input name="age" id="age"></td></tr>
        <tr><td>성별 :</td><td><input name="gender" value="${user.gender}"></td></tr>
        <tr><td>휴대폰 :</td><td><input name="phone" value="${user.phone}"></td></tr>            
        <tr><td>Email :</td><td><input name="email" value="${user.email}"></td></tr>
        <tr>
        <tr>
        <tr>
                <td>주소 :</td>
                <td>
                    <input name="address" id="address" value="${address != null ? address : ''}">
                    <input type="button" id="addbtn" value="우편번호 검색" onclick="openPostcodeSearch()">
                </td>
            </tr>
            <tr>
                <td>나머지 주소 :</td>
                <td><input name="detail_address" id="detail_address" value="${detail_address != null ? detail_address : ''}"></td>
            </tr>

        <tr><td>자기소개서 :</td><td><textarea name="content" id="content"></textarea></td></tr>
        <tr><td>학교명 :</td><td><input name="school_name" id="school_name"></td></tr>
        <tr><td>학교 기간 :</td><td><input name="school_period" id="school_period"></td></tr>
        <tr><td>학교 전공 :</td><td><input name="school_major" id="school_major"></td></tr>
        <tr><td>경력 회사명 :</td><td><input name="career_nme" id="career_nme"></td></tr>
        <tr><td>경력 기간 :</td><td><input name="career_period" id="career_period"></td></tr>
        <tr><td>경력 담당업무 :</td><td><input name="career_role" id="career_role"></td></tr>
        <tr><td>자격증 이름 :</td><td><input name="certificate_name" id="certificate_name"></td></tr>
        <tr><td>자격증 취득일자 :</td><td><input name="certificate_date" id="certificate_date"></td></tr>
        <input type="hidden" name="id" value="${user.id }">
        <!-- CSRF 보호 -->
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        <tr>
            <td><input type="submit" value="등록"></td>
            <td><input type="button" value="취소" onclick="history.back()"></td>
        </tr>
    </table>
</form>
</div>
</main>

 <div id="postcodeLayer"></div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
        function openPostcodeSearch() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 주소 필드에 선택된 주소를 입력
                    document.querySelector("#address").value = data.address;
                    // 나머지 주소 필드에 포커스를 설정
                    document.querySelector("#detail_address").focus();
                    alert("나머지 주소를 입력해 주세요.");

                    // 검색 레이어 닫기
                    document.getElementById('postcodeLayer').style.display = 'none';
                },
                onclose: function(state) {
                    if (state === 'FORCE_CLOSE') {
                        document.getElementById('postcodeLayer').style.display = 'none';
                    }
                },
                width: '100%',
                height: '100%'
            }).embed(document.getElementById('postcodeLayer'));

            // 검색 레이어를 화면에 표시
            document.getElementById('postcodeLayer').style.display = 'block';
        }
    </script>

<footer class="footer">
    <div class="footer-links">
        <a href="#">프리랜서 이용약관</a> <a href="#">고객센터</a> <a href="#">개인정보 처리방침</a> <a href="#">광고문의</a>
        <c:if test="${user != null && user.role == 2 || user.role == 1}"><a href="/adminpage/board01">관리자</a></c:if>
    </div>
    <div class="company-info">
        <p>(주)프렌즈그램(대표이사: 전재민)</p>
        <p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
    </div>
</footer>
</body>
</html>