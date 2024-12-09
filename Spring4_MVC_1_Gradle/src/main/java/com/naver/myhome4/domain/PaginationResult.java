package com.naver.myhome4.domain;

public class PaginationResult {
    private int maxPage;
    private int startPage;
    private int endPage;

    public PaginationResult(int page, int limit, int listCount) {
        // 총 페이지 수
        int maxPage = (listCount + limit - 1) / limit;

        // 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21, 등...)
        int startPage = ((page - 1) / 10) * 10 + 1;

        // 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
        int endPage = startPage + 10 - 1;

        if (endPage > maxPage) {
            endPage = maxPage;
        }

        this.maxPage = maxPage;
        this.endPage = endPage;
        this.startPage = startPage;
    }

    public int getMaxPage() {
        return maxPage;
    }

    public int getStartPage() {
        return startPage;
    }

    public int getEndPage() {
        return endPage;
    }
}
