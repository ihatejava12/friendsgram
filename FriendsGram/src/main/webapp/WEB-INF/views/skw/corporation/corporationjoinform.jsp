<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<style>
    /* 기본 스타일 */
    body {
        font-family: 'Arial', sans-serif;
        background-color: #ffffff; /* 흰색 배경 */
        color: #333;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    h3 {
        text-align: center;
        color: #4CAF50; /* 초록색 텍스트 */
        font-size: 2.5em;
        margin-bottom: 20px;
    }

    form {
        background: #ffffff; /* 흰색 배경 */
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        max-width: 600px;
        width: 100%;
    }

    table {
        width: 100%;
        margin-top: 20px;
        border-collapse: collapse;
    }

    td {
        padding: 12px 15px;
        font-size: 1em;
    }

    td:first-child {
        text-align: right;
        font-weight: bold;
        color: #666;
        width: 30%;
    }

    td:last-child {
        text-align: left;
        width: 70%;
        display: flex;
        align-items: center;
        flex-wrap: wrap; /* 이 부분이 세로 정렬 방지 */
    }

    input[type="text"], input[type="password"], select {
        width: calc(100% - 120px); /* 버튼 옆으로 공간을 확보 */
        padding: 8px;
        border-radius: 5px;
        border: 1px solid #ccc;
        margin-bottom: 15px;
        font-size: 1em;
    }

    input[type="text"]:focus, input[type="password"]:focus, select:focus {
        border-color: #4CAF50;
        box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
    }

    input[type="button"], input[type="submit"] {
        background-color: #4CAF50; /* 초록색 버튼 */
        color: white;
        padding: 5px 10px; /* 버튼 크기 조정 */
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.3s ease;
        font-size: 0.9em; /* 버튼 글자 크기 조정 */
        margin-left: 10px; /* 버튼 간의 간격 확보 */
    }

    input[type="button"]:hover, input[type="submit"]:hover {
        background-color: #45a049;
        transform: scale(1.05);
    }

    input[type="button"]:active, input[type="submit"]:active {
        background-color: #3e8e41;
        transform: scale(1);
    }

    #id_msg, #emailresult, #result {
        color: #f44336;
        font-weight: bold;
        margin-left: 10px; /* 메시지와 입력창 간의 간격 확보 */
        display: inline-block; /* 가로 정렬을 유지 */
    }

    label {
        font-weight: bold;
        color: #333;
    }
</style>
</head>
<body>
    <form action="/insertCor" method="post" id="joinform">
        <h3>기업 회원 가입을 환영합니다.</h3>
        <table>
            <tr>
                <td>아이디</td>
                <td>
                    <input name="id" id="id">
                    <input type="button" id="corid_check" value="중복 확인">
                    <span id="id_msg"></span>
                </td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td>
                    <input name="password" type="password" id="password">
                    <span id="password_msg"></span>
                </td>
            </tr>
            <tr>
                <td>이름</td>
                <td>
                    <input name="name" id="name">
                    <span id="name_msg"></span>
                </td>
            </tr>
            <tr>
                <td>회사</td>
                <td>
                    <input name="company" id="company">
                    <span id="company_msg"></span>
                </td>
            </tr>
            <tr>
                <td>기업형태</td>
                <td>
                    <select name="scale" id="scale">
                        <option value="1">개인사업</option>
                        <option value="2">소기업</option>
                        <option value="3">중소기업</option>
                        <option value="4">대기업</option>
                    </select>
                    <span id="scale_msg"></span>
                </td>
            </tr>
            <tr>
                <td>사업자등록번호</td>
                <td>
                    <input name="business_number" id="business_number">
                    <span id="business_number_msg"></span>
                </td>
            </tr>
            <tr>
                <td>대표자명</td>
                <td>
                    <input name="boss_name" id="boss_name">
                    <span id="boss_name_msg"></span>
                </td>
            </tr>
            <tr>
                <td>회사주소</td>
                <td>
                    <input name="address" id="address">
                    <input type="button" id="addbtn" value="우편번호 검색" onclick="addPost()">
                    <span id="address_msg"></span>
                </td>
            </tr>
            <tr>
                <td>나머지 주소</td>
                <td><input name="detail_address" id="detail_address" value="${detail_address != null ? detail_address : ''}"></td>
            </tr>
            <tr>
                <td>email</td>
                <td>
                    <input name="email" id="email">
                    <input type="button" id="mail_ck" value="메일 인증">
                    <span id="emailresult"></span>
                </td>
            </tr>
            <tr>
                <td>인증번호 입력 공간</td>
                <td>
                    <input id="ck_num"> 
                    <input type="button" id="ck_b" value="인증 확인">
                    <span id="result"></span>
                </td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td>
                    <input type="text" name="company_number">
                    <span id="company_number_msg"></span>
                </td>
            </tr>
            <tr>
                <td>동의여부</td>
                <td>
                    <label><input type="radio" name="consent" value="1">동의</label>
                    <label><input type="radio" name="consent" value="0">거부</label>
                    <span id="consent_msg"></span>
                </td>
            </tr>
            <!-- <tr>
                <td>기업인증여부</td>
                <td>
                    <label><input type="radio" name="company_consent" value="1">동의</label>
                    <label><input type="radio" name="company_consent" value="0">거부</label>
                    <span id="company_consent_msg"></span>
                </td>
            </tr> -->
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="가입">
                </td>
            </tr>
        </table>
    </form>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function addPost(){
            new daum.Postcode({
                oncomplete: function(data) {
                    document.querySelector("#address").value = data.address;
                    alert("나머지 주소도 입력하세요.");
                }
            }).open();
        }    

        $(function(){
            // 아이디 중복 확인
            $("#corid_check").click(function(){
                let id = $("#id").val();
                if(!id){
                    $("#id_msg").html("아이디를 입력하세요.");
                    return false;
                }
                $.ajax({
                    url: "/coridCheck",
                    data: "id=" + id,
                    datatype: "text"
                }).done(function(data){
                    if(data == ""){
                        $("#id_msg").html("사용할 수 있는 아이디 입니다.");
                        $("#id_msg").append("<input type='hidden' id='corid_ck' value='1'>");
                    } else {
                        $("#id_msg").html("이미 사용중인 아이디 입니다.");
                    }
                });
            });

            // 이메일 인증
            let num = ""; // 인증번호
            $("#mail_ck").click(function(){
                let email = $("#email").val();
                if(!email){
                    $("#result").css("display", "block").html("메일 주소를 입력하세요.");
                    return false;
                }
                $.ajax({
                    url: "/send",
                    data: "emailAddress=" + email,
                    dataType: "json"
                }).done(function(data){
                    if(eval(data[1])){
                        num = data[0];
                        alert("메일이 전송되었습니다. 인증번호를 입력하세요.");
                        $("#input,#result").css("display", "block");
                    }
                });
            });

            // 인증번호 확인
            $("#ck_b").click(function(){
                let ck_num = $("#ck_num").val();
                if(ck_num == num){
                    $("#result").html("인증이 확인되었습니다.");
                    $("#result").append("<input type='hidden' id='ck' value='1'>");
                } else {
                    $("#result").html("인증 실패했습니다. 다시 확인하세요.");
                }
            });

            // 폼 제출
            $("#joinform").submit(function(){
                if($("#corid_ck").val() != 1){
                    $("#id_msg").html("아이디 중복 체크 하셔야 합니다.");
                    return false;
                }
                if(!$("#password").val()){
                    alert("비밀번호를 입력해야 합니다.");
                    return false;
                }
                if($("#ck").val() != 1){
                    $("#emailresult").html("이메일 인증 하셔야 합니다.");
                    return false;
                }
            });
        });
    </script>
</body>
</html>