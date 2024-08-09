<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h3>회원 가입을 환영합니다.</h3>
<form action="insert" method="post" id="joinform">
   <table>
      <tr><td>아이디</td><td><input name="id" id="id">
         <input type="button" id="id_check" value="중복 확인"><span id="id_msg"></span></td></tr>
      <tr><td>비밀번호</td><td><input name="password" type="password" id="password"></td></tr>
      <tr><td>이름</td><td><input name="name" id="name"></td></tr>
      <tr><td>email</td><td><input name="email" id="email"><div id="emailresult"></div>
      <input type="button" id="mail_ck" value="메일 인증">
      <tr><td>인증번호 입력 공간</td><td>
      <div id="input">
         <input id="ck_num"> <input type="button" id="ck_b" value="인증 확인">
      </div>
      <div id="result"></div>
      </td></tr>
      <tr><td>생년월일</td><td><input name="birth" placeholder="yyyyMMdd"></td></tr>
	  <tr><td>성별 : <input type="radio" name="gender" value="m" checked>남자
					<input type="radio" name="gender" value="f">여자</td></tr>
	  <tr><td>전화번호 : <input type="text" name="phone"></td></tr>
   		<tr><td>동의 : <input type="radio" name="consent" value=1 checked>동의
					<input type="radio" name="consent" value=0>거절</td></tr>
      <tr><td colspan="2"><input type="submit" value="가입"></td></tr>
   </table>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

$(function(){
   $("#id_check").click(function(){
      let id = $("#id").val();
      if(!id){
         $("#id_msg").html("아이디를 입력하세요.")
         return false;
      }
      $.ajax({url:"/idCheck", data:"id="+id, datatype:"text"}
      ).done(function(data){
         //alert(data);
         if(data == ""){
            $("#id_msg").html("사용할 수 있는 아이디 입니다.");
            $("#id_msg").append("<input type='hidden' id='id_ck' value='1'>");
         }else{
            $("#id_msg").html("이미 사용중인 아이디 입니다.");
         }
      })
   });//아이디 중복 확인 click
   
   let num ="";// 인증번호
    $("#mail_ck").click(function(){
       let email = $("#email").val();
      if(!email){
            $("#result").css("display","block").html("메일 주소를 입력하세요");
            return false;
         } 
    $.ajax({url:"/send",
          data:"emailAddress="+email,
         dataType:"json"}
      ).done(function(data){
         // [인증번호, "true/false"]
         if(eval(data[1])){
            num = data[0];
            alert("메일이 전송되었습니다. 인증번호를 입력하세요.")
            $("#input,#result").css("display","block");
         }
      }); 
   }); //메일 보내고 인증번호 받아오기
   $("#ck_b").click(function(){
      let ck_num = $("#ck_num").val();
      if(ck_num == num){
         $("#result").html("인증이 확인되었습니다.")
         $("#result").append("<input type='hidden' id='ck' value='1'>");
      }else{
         $("#result").html("인증 실패했습니다. 다시 확인하세요.");
      }
   })
   
   
   $("#joinform").submit(function(){
      if($("#id_ck").val() != 1){
         $("#id_msg").html("아이디 중복 체크 하셔야 합니다.")
         return false;
      }
      if(!$("#password").val()){
         alert("비밀번호를 입력해야 합니다.");
         return false;
      }
      if( $("#ck").val() != 1){
         $("#emailresult").html("이메일 인증 하셔야 합니다.")
         return false;
      }
   
   });
   
})//ready

</script>

</body>
</html>