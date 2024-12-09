<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
        const result = '${result}';

        if (result === 'joinSuccess') {
            alert('회원가입을 축하합니다.');
        } else if (result == '0') {
            alert('비밀번호가 일치하지 않습니다.');
        } else if (result == '-1') {
            alert('아이디가 존재하지 않습니다.');
        }

        $(function () {
            $('.join').click(function () {
                location.href = '${pageContext.request.contextPath}/member/join';
            })
        })
    </script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background: #ffffff;
            padding: 30px 25px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            width: 320px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 20px;
            font-weight: 600;
            font-size: 22px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-group input {
            width: 100%;
            padding: 15px 20px; /* 높이 조정 */
            border: 1px solid #ddd;
            border-radius: 25px;
            font-size: 16px;
            background: #f9f9f9;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            background: #ffffff;
            border-color: #007bff;
            outline: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .form-group label {
            position: absolute;
            top: 10px; /* 라벨 위치 조정 */
            left: 15px;
            font-size: 16px;
            color: #aaa;
            pointer-events: none;
            transition: all 0.3s ease;
        }

        .form-group input:focus + label,
        .form-group input:not(:placeholder-shown) + label {
            top: -1px;
            left: 20px;
            font-size: 12px;
            color: #007bff;
        }

        .form-group button {
            width: 100%;
            padding: 12px;
            background: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 600;
        }

        .form-group button:hover {
            background: #0056b3;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .forgot-password {
            margin-top: 10px;
            font-size: 14px;
            color: #777;
        }

        .forgot-password a {
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .forgot-password a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>로그인</h2>
    <form action="${pageContext.request.contextPath}/member/loginProcess" method="post" name="loginForm">
        <div class="form-group">
            <input type="text" id="id" name="id" placeholder=" " required
            <c:if test="${!empty saveId}">
                   value="${saveId}"
            </c:if>
            >
            <label for="id">ID</label>
        </div>
        <div class="form-group">
            <input type="password" id="password" name="password" placeholder=" " required>
            <label for="password">PASSWORD</label>
        </div>
        <input type="checkbox"
        <c:if test="${!empty saveId}">
               checked
        </c:if>
        >Remember
        <div class="form-group">
            <button type="submit">로그인</button>
        </div>
    </form>
    <div class="form-group">
        <button class="join">회원가입</button>
    </div>
    <div class="forgot-password">
        <a href="#">비밀번호를 잊으셨나요?</a>
    </div>
</div>
</body>
</html>
