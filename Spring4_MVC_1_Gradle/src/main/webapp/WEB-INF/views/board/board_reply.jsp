<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="header.jsp"/>
    <script src="${pageContext.request.contextPath}/js/reply.js"></script>
    <style>
        h1 {
            font-size: 1.5rem;
            text-align: center;
            color: #1a92b9;
        }

        .container {
            width: 60%;
        }

        label {
            font-weight: bold;
        }

        #upFile {
            display: none;
        }

        img {
            width: 20px;
        }

        img:hover {
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="container">
    <form action="replyAction" method="post" name="replyForm">
        <input type='hidden' value='${boardData.BOARD_RE_REF}' name='BOARD_RE_REF'>
        <input type='hidden' value='${boardData.BOARD_RE_LEV}' name='BOARD_RE_LEV'>
        <input type='hidden' value='${boardData.BOARD_RE_SEQ}' name='BOARD_RE_SEQ'>

        <h1>MVC 게시판 - reply 페이지</h1>
        <%-- 글쓴이 --%>
        <div class="form-group">
            <label for="board_name">글쓴이</label>
            <input class="form-control" type="text" name="BOARD_NAME" id="board_name" value="${id}"
                   placeholder="Enter board_name" readOnly>
        </div>

        <%-- 제목 --%>
        <div class="form-group">
            <label for="board_subject">제목</label>
            <textarea class="form-control" name="BOARD_SUBJECT" id="board_subject" rows="1"
                      maxlength="100">Re: ${boardData.BOARD_SUBJECT}</textarea>
        </div>

        <%-- 내용 --%>
        <div class="form-group">
            <label for="board_content">내용</label>
            <textarea class="form-control" name="BOARD_CONTENT" id="board_content"
                      rows="10"></textarea>
        </div>

        <%-- 비밀번호 --%>
        <div class="form-group">
            <label for="board_pass">비밀번호</label>
            <input class="form-control" type="password" name="BOARD_PASS" id="board_pass" maxlength="30"
                   placeholder="Enter board_pass">
        </div>

        <%-- 저장 / 취소 버튼 --%>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">등록</button>
            <button type="reset" class="btn btn-danger" onclick="history.go(-1)">취소</button>
        </div>
    </form>
</div>
</body>
</html>
