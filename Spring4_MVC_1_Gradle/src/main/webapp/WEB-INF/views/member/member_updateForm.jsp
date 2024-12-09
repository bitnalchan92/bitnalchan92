<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <jsp:include page="../board/header.jsp"/>
    <title>회원정보 수정 페이지</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="icon" href="${pageContext.request.contextPath}/image/home.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/memberModify.css" type="text/css">
</head>
<body>
<form name="updateForm" action="updateProcess" method="post" enctype="multipart/form-data">
    <h2 style="text-align: center; color: steelblue;">회원 정보 수정</h2>
    <hr>
    <b>아이디</b>
    <input type="text" name="id" maxlength="12" value="${id}" readonly>

    <b>비밀번호</b>
    <input type="password" name="pass" value="${member.password}" readonly>

    <b>이름</b>
    <input type="text" name="name" placeholder="Enter name" required value="${member.name}" required>

    <b>나이</b>
    <input type="text" name="age" maxlength="2" placeholder="Enter age" required value="${member.age}">

    <b>성별</b>
    <div style="padding-bottom: 20px;">
        <input type="radio" name="gender" value="1"><span>남자</span>
        <input type="radio" name="gender" value="2"><span>여자</span>
    </div>

    <b style="margin-top: 10px;">이메일 주소</b>
    <input type="text" name="email" placeholder="Enter email" maxlength="30" required value="${member.email}">
    <span id="email-message"></span>

    <div class="clearfix">
        <button type="submit" class="submitBtn">정보수정</button>
        <button type="button" class="join cancelBtn">뒤로가기</button>
    </div>
</form>

<script>
    $('input[value="${member.gender}"]').prop('checked', true);

    $('.cancelBtn').click(function () {
        location.href = '../boards/list';
    })

    // 처음 화면 로드시 보여줄 이메일은 이미 체크 완료된 것이므로 기본 checkEmail = true 입니다.
    let checkEmail = true;
    $('input[name=email]').on('keyup', function () {
        $('#email-message').empty();

        // [A-Za-z0-9_]와 동일한 것이 \w
        // +는 1회 이상 반복을 의미합니다. {1,}와 동일합니다.
        // \w+는 [A-Za-z0-9_]를 1개 이상 사용하라는 의미입니다.
        const pattern = /^\w+@\w+[.]\w{3}$/;
        const email = $(this).val();

        if (!pattern.test(email)) {
            $('#email-message').css('color', 'red').html('이메일 형식이 맞지 않습니다.');
            checkEmail = false;
        } else {
            $('#email-message').css('color', 'green').html('이메일 형식에 맞습니다.');
            checkEmail = true;
        }
    })

    $('form[name=updateForm]').submit(function () {
        if (!$.isNumeric($("input[name='age']").val())) {
            alert('나이는 숫자를 입력하세요!');
            $('input[name="age"]').val('').focus();

            return false;
        }

        if (!checkEmail) {
            alert('Email 형식을 확인하세요!');
            $("input[name=email]").focus();

            return false;
        }
    })
</script>
</body>
</html>
