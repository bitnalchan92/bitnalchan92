<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="header.jsp"/>
    <script src="${pageContext.request.contextPath}/js/view.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/view.css" type="text/css">
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
</head>
<body>
<input type="hidden" id="loginId" value="${id}" name="loginId"><%-- view.js에서 사용하기 위해 추가합니다. --%>
<div class="container">
    <table class="table">
        <tr>
            <td colspan="2">MVC 게시판 - view페이지</td>
        </tr>
        <tr>
            <td>
                <div>글쓴이</div>
            </td>
            <td>
                <div>${boardData.BOARD_NAME}</div>
            </td>
        </tr>
        <tr>
            <td>
                <div>제목</div>
            </td>
            <td>
                <div>${boardData.BOARD_SUBJECT}</div>
            </td>
        </tr>
        <tr>
            <td>
                <div>내용</div>
            </td>
            <td style="padding-right: 0px;">
                <textarea class="form-control" rows="5" readonly>${boardData.BOARD_CONTENT}</textarea>
            </td>
        </tr>

        <c:if test="${boardData.BOARD_RE_LEV == 0}">
            <%-- 원문글인 경우에만 파일을 추가할 수 있습니다.--%>
            <tr>
                <td>
                    <div>첨부파일</div>
                </td>
                <c:if test="${!empty boardData.BOARD_FILE}">
                    <td>
                        <img src="${pageContext.request.contextPath}/image/down.png" alt="다운로드" width="10px">
                        <form action="down" method="post" style="height: 0px">
                            <input type="hidden" value="${boardData.BOARD_FILE}" name="fileName">
                            <input type="hidden" value="${boardData.BOARD_ORIGINAL}" name="original">
                            <input type="submit" value="${boardData.BOARD_ORIGINAL}">
                        </form>
                    </td>
                </c:if>
                <c:if test="${empty boardData.BOARD_FILE}">
                    <td></td>
                </c:if>
            </tr>
        </c:if>

        <tr>
            <td colspan="2" class="center">
                <button class="btn btn-primary">댓글</button>
                <span id="count">${count}</span>

                <c:if test="${boardData.BOARD_NAME == id || id== 'admin' }">
                    <a href="modifyView?num=${boardData.BOARD_NUM}">
                        <button class="btn btn-info">수정</button>
                    </a>

                    <%-- href의 주소를 #으로 설정합니다. --%>
                    <a href="#">
                        <button class="btn btn-danger" data-toggle="modal" data-target="#myModal">삭제</button>
                    </a>
                </c:if>

                <a href="replyView?num=${boardData.BOARD_NUM}">
                    <button class="btn btn-success">답변</button>
                </a>

                <a href="list">
                    <button class="btn btn-warning">목록</button>
                </a>
            </td>
        </tr>
    </table>

    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-body">
                    <form name="deleteForm" action="delete" method="post">
                        <%--http://localhost:9401/myhome4/detail?num=22
                            주소를 보면 num을 파라미터로 넘기고 있습니다.
                            이 값을 가져와서 ${param.num}를 사용 또는 ${boardData.BOARD_NUM}
                         --%>
                        <input type="hidden" name="num" value="${param.num}" id="board_num">
                        <div class="form-group">
                            <label for="board_pass">비밀번호</label> <input type="password"
                                                                        class="form-control"
                                                                        placeholder="Enter password"
                                                                        name="BOARD_PASS" id="board_pass">
                        </div>

                        <button type="submit" class="btn btn-primary">전송</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%-- comment --%>
    <div class="comment-area">
        <div class="comment-head">
            <h3 class="comment-count">
                댓글 <sup id="count"></sup><%-- superscript(윗첨자) --%>
            </h3>
            <div class="comment-order">
                <ul class="comment-order-list">
                </ul>
            </div>
        </div><!-- comment-head end-->
        <ul class="comment-list">
        </ul>
        <div class="comment-write">
            <div class="comment-write-area">
                <b class="comment-write-area-name">${id}</b>
                <span class="comment-write-area-count">0/200</span>
                <textarea placeholder="댓글을 남겨보세요" rows="1" class="comment-write-area-text" maxlength="200"></textarea>
            </div>
            <div class="register-box">
                <div class="button btn-cancel">취소</div>
                <%-- 댓글의 취소는 display:none, 등록만 보이도록 --%>
                <div class="button btn-register">등록</div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
