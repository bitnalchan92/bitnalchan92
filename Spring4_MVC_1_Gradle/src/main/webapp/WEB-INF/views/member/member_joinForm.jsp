<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.7.1.js"></script>
    <style>

    </style>
    <script>
        $(function () {
            let checkId = false; //아이디의 정규식 체크하기 위한 변수로 기본값은 false, 규칙에 맞게 입력하면 true값을 갖습니다.
            let checkEmail = false; //아이디의 정규식 체크하기 위한 변수로 기본값은 false, 규칙에 맞게 입력하면 true값을 갖습니다.

            /**🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨
             *                                               ID VALID CHECK
             🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨*/
            $("input[name=id]").on('keyup', function () {
                //[A-Za-z0-9_]의 의미가 \w
                const pattern = /^\w{5,12}$/;
                const id = $(this).val();

                if (!pattern.test(id)) {
                    $("#id-message").css('color', 'red')
                        .html("영문자 숫자 _로 5~12자 가능합니다.");
                    checkId = false;
                    return;
                }

                $.ajax({
                    url: "idCheck",
                    data: {id},
                    success: function (resp) {
                        if (resp === -1) { //db에 해당 id가 없는 경우
                            $("#id-message").css('color', 'green').html("사용 가능한 아이디 입니다.");
                            checkId = true;
                        } else { //db에 해당 id가 있는 경우('0')
                            $("#id-message").css('color', 'blue').html("사용중인 아이디 입니다.");
                            checkId = false;
                        }
                    }
                }); //ajax end
            }) //id keyup end

            /**🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨
             *                                               EMAIL VALID CHECK
             🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨*/
            $("input[name=email]").on('keyup', function () {
                //[A-Za-z0-9_]와 동일한 것이 \w 입니다.
                //+는 1회 이상 반복을 의미하고 {1,}와 동일합니다.
                //\w+ 는 [A-Za-z0-9_]를 1개 이상 사용하라는 의미입니다.
                const pattern = /^\w+@\w+[.][A-Za-z0-9]{3}$/;
                const email_value = $(this).val();

                if (!pattern.test(email_value)) {
                    $("#email-message").css('color', 'red')
                        .html("이메일형식이 맞지 않습니다.");
                    checkEmail = false;
                } else {
                    $("#email-message").css('color', 'green')
                        .html("이메일형식에 맞습니다.");
                    checkEmail = true;
                }
            }); // email keyup 이벤트 처리 끝

            /**🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨
             *                                               FORM SUBMIT
             🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨*/
            $('form[action="joinProcess"]').submit(function () {
                if (!$.isNumeric($("input[name='age']").val())) {
                    alert("나이는 숫자로 입력하세요");
                    $("input[name='age']").val('').focus();

                    return false;
                }

                if (!checkId) {
                    alert("사용가능한 id로 입력하세요.");
                    $("input[name=id]").val('').focus();
                    $("#id-message").text('');

                    return false;
                }

                if (!checkEmail) {
                    alert("email 형식을 확인하세요");
                    $("input[name=email]").focus();

                    return false;
                }
            }); //submit
        })
    </script>
</head>
<body>
<form name="joinform" action="joinProcess" method="post" class="form">
    <h1>회원가입 페이지</h1>
    <hr>
    <b>아이디</b>
    <input type="text" name="id" placeholder="Enter id" maxlength="12" required>
    <span id="id-message"></span>

    <b>비밀번호</b>
    <input type="password" name="password" placeholder="Enter password" required>

    <b>이름</b>
    <input type="text" name="name" placeholder="Enter name" maxlength="12" required>
    <span id="name-message"></span>

    <b>나이</b>
    <input type="text" name="age" maxlength=2 placeholder="Enter age" required>

    <b>성별</b>
    <div>
        <input type="radio" name="gender" value="남" checked><span>남자</span>
        <input type="radio" name="gender" value="여"><span>여자</span>
    </div>

    <b>이메일</b>
    <input type="email" name="email" placeholder="Enter email" maxlength="50" required>
    <span id="email-message"></span>


    <div class="clearfix" style="margin-top: 20px;">
        <button type="submit" class="submitbtn">회원가입</button>
        <button type="reset" class="cancelbtn">다시작성</button>
    </div>
</form>
</body>
</html>
