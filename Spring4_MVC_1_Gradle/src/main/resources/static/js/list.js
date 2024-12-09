function ajax(sdata) {
    console.log(sdata);
    $.ajax({
        data: sdata,
        url: "list",
        dataType: "json",
        cache: false,
        success: function (data) {
            $("#viewcount").val(data.limit);
            $("thead").find("span").text("글 개수 : " + data.listCount);

            if (data.listCount > 0) {
                $('tbody').remove();
                updateBoardList(data); // 게시판 내용 업데이트
                generatePagination(data); // 페이지네이션 생성
            } else {
                $('table tbody').html("<tr><td colspan='5'>게시글이 없습니다.</td></tr>");
            }
        },
        error: function () {
            console.log('에러');
        }
    });
}

function updateBoardList(data) {
    let num = data.listCount - (data.page - 1) * data.limit;
    let output = "<tbody>";

    if (data.boardlList && data.boardList.length > 0) {
        $(data.boardList).each(function (index, item) {
            const blank = '&nbsp;&nbsp; '.repeat(item.BOARD_RE_LEV * 2);
            const img = item.BOARD_RE_LEV > 0 ? "<img src='../image/line.gif'>" : "";
            const subject = item.BOARD_SUBJECT.length >= 20
                ? item.BOARD_SUBJECT.substr(0, 20) + "..." : item.BOARD_SUBJECT;
            const changeSubject = subject.replace(/</g, '&lt;').replace(/>/g, '&gt;');

            output += `
					<tr>
							<td>${num--}</td>
							<td><div>${blank}${img}<a href='detail?num=${item.BOARD_NUM}'>${changeSubject}</a></div></td>
							<td><div>${item.BOARD_NAME}</div></td>
							<td><div>${item.BOARD_DATE}</div></td>
							<td><div>${item.BOARD_READCOUNT}</div></td>
					</tr>
			`;
        });
    } else {
        output += "<tr><td colspan='5'>게시글이 없습니다.</td></tr>";
    }

    output += "</tbody>";
    $('table').append(output); // 기존의 tbody를 대체
}

function go(page) {
    const limit = $('#viewcount').val();
    const data = `limit=${limit}&state=ajax&page=${page}`;
    ajax(data);
}

function setPaging(href, digit, isActive = false) {
    const gray = (href === "" && isNaN(digit)) ? "gray" : "";
    const active = isActive ? "active" : "";
    const anchor = `<a class="page-link ${gray}" ${href}>${digit}</a>`;
    return `<li class="page-item ${active}">${anchor}</li>`;
}

function generatePagination(data) {
    let output = "";

    //이전 버튼
    let prevHref = data.page > 1 ? `href=javascript:go(${data.page - 1})` : "";
    output += setPaging(prevHref, '이전&nbsp;');

    //페이지 번호
    for (let i = data.startPage; i <= data.endPage; i++) {
        const isActive = (i === data.page);
        let pageHref = !isActive ? `href=javascript:go(${i})` : "";
        output += setPaging(pageHref, i, isActive);
    }

    //다음 버튼
    let nextHref = (data.page < data.maxPage) ? `href=javascript:go(${data.page + 1})` : "";
    output += setPaging(nextHref, '&nbsp;다음&nbsp;');

    $('.pagination').empty().append(output);
}

$(function () {
    $("button").click(function () {
        location.href = "write";
    });

    $("#viewcount").change(function () {
        go(1); // 보여줄 페이지를 1페이지로 설정
    });
});