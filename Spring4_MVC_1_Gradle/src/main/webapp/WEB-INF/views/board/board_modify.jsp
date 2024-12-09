<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="header.jsp"/>
    <script src="${pageContext.request.contextPath}/js/modifyForm.js"></script>
    <style>
        #count {
            position: relative;
            top: -10px;
            left: -10px;
            background: orange;
            color: white;
            border-radius: 30%;
        }

        textarea {
            resize: none;
        }

        form[action=down] > input[type=submit] {
            position: relative;
            top: -25px;
            left: 10px;
            border: none;
            cursor: pointer;
        }
    </style>
    <script>
        if ('${result}' == 'passFail') {
            alert('비밀번호가 다릅니다.');
        }
    </script>
</head>
<body>
<%-- 게시판 수정 --%>
<div class="container">
    <form action="modifyAction" method="post" enctype="multipart/form-data" name="modifyForm">
        <input type="hidden" name="BOARD_NUM" value="${boardData.BOARD_NUM}">
        <input type="hidden" name="BOARD_FILE" value="${boardData.BOARD_FILE}">

        <h1>MVC 게시판 - modify 페이지</h1>
        <%-- 글쓴이 --%>
        <div class="form-group">
            <label for="board_name">글쓴이</label>
            <input class="form-control" type="text" name="BOARD_NAME" id="board_name" value="${id}"
                   placeholder="Enter board_name" readOnly>
        </div>ㅠ

        <%-- 제목 --%>
        <div class="form-group">
            <label for="board_subject">제목</label>
            <textarea class="form-control" type="text" name="BOARD_SUBJECT" id="board_subject" maxlength="100"
                      placeholder="Enter board_subject">${boardData.BOARD_SUBJECT}</textarea>
        </div>

        <%-- 내용 --%>
        <div class="form-group">
            <label for="board_content">내용</label>
            <textarea class="form-control" name="BOARD_CONTENT" id="board_content"
                      rows="10">${boardData.BOARD_CONTENT}</textarea>
        </div>

        <%-- 원문글인 경우에만 파일 첨부 수정이 가능합니다. --%>
        <c:if test="${boardData.BOARD_RE_LEV == 0}">
            <div class="form-group">
                <label>파일 첨부
                    <img src="${pageContext.request.contextPath}/image/attach.png" alt="파일첨부"
                         style="width: 25px; display: inline-block;">
                    <input type="file" id="upFile" name="uploadFile">
                </label>
                <span id="fileValue">${boardData.BOARD_ORIGINAL}</span>
                <img class="remove" src="${pageContext.request.contextPath}/image/fileDelete.png" alt="파일삭제"
                     style="width: 10px; display: inline-block;">
            </div>
        </c:if>

        <%-- 비밀번호 --%>
        <div class="form-group">
            <label for="board_pass">비밀번호</label>
            <input class="form-control" type="password" name="BOARD_PASS" id="board_pass" maxlength="30"
                   placeholder="Enter board_pass">
        </div>

        <%-- 수정 / 취소 버튼 --%>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">수정</button>
            <button type="reset" class="btn btn-danger" onclick="history.go(-1)">취소</button>
        </div>
    </form>
</div>
</body>
</html>
