package com.naver.myhome4.domain;

import org.springframework.web.multipart.MultipartFile;

public class Board {
    private int BOARD_NUM; // 글 번호
    private String BOARD_NAME; // 글 작성자
    private String BOARD_PASS; // 글 비밀번호
    private String BOARD_SUBJECT; // 글 제목
    private String BOARD_CONTENT; // 글 내용
    private String BOARD_FILE; // 실제 저장된 파일의 이름
    private int BOARD_RE_REF; // 답변 글 작성시 참조되는 글의 번호
    private int BOARD_RE_LEV; // 답변 글의 깊이
    private int BOARD_RE_SEQ; // 답변 글의 순서
    private int BOARD_READCOUNT; // 글의 조회수

    // board_write.jsp에서 name속성 확인하세요.
    // <input type="file" id="upfile" name="uploadFile"> 확인
    private MultipartFile uploadFile;
    private String BOARD_ORIGINAL; // 첨부될 파일의 이름
    private String BOARD_DATE;

    public int getBOARD_NUM() {
        return BOARD_NUM;
    }

    public void setBOARD_NUM(int BOARD_NUM) {
        this.BOARD_NUM = BOARD_NUM;
    }

    public String getBOARD_NAME() {
        return BOARD_NAME;
    }

    public void setBOARD_NAME(String BOARD_NAME) {
        this.BOARD_NAME = BOARD_NAME;
    }

    public String getBOARD_PASS() {
        return BOARD_PASS;
    }

    public void setBOARD_PASS(String BOARD_PASS) {
        this.BOARD_PASS = BOARD_PASS;
    }

    public String getBOARD_SUBJECT() {
        return BOARD_SUBJECT;
    }

    public void setBOARD_SUBJECT(String BOARD_SUBJECT) {
        this.BOARD_SUBJECT = BOARD_SUBJECT;
    }

    public String getBOARD_CONTENT() {
        return BOARD_CONTENT;
    }

    public void setBOARD_CONTENT(String BOARD_CONTENT) {
        this.BOARD_CONTENT = BOARD_CONTENT;
    }

    public String getBOARD_FILE() {
        return BOARD_FILE;
    }

    public void setBOARD_FILE(String BOARD_FILE) {
        this.BOARD_FILE = BOARD_FILE;
    }

    public int getBOARD_RE_REF() {
        return BOARD_RE_REF;
    }

    public void setBOARD_RE_REF(int BOARD_RE_REF) {
        this.BOARD_RE_REF = BOARD_RE_REF;
    }

    public int getBOARD_RE_LEV() {
        return BOARD_RE_LEV;
    }

    public void setBOARD_RE_LEV(int BOARD_RE_LEV) {
        this.BOARD_RE_LEV = BOARD_RE_LEV;
    }

    public int getBOARD_RE_SEQ() {
        return BOARD_RE_SEQ;
    }

    public void setBOARD_RE_SEQ(int BOARD_RE_SEQ) {
        this.BOARD_RE_SEQ = BOARD_RE_SEQ;
    }

    public int getBOARD_READCOUNT() {
        return BOARD_READCOUNT;
    }

    public void setBOARD_READCOUNT(int BOARD_READCOUNT) {
        this.BOARD_READCOUNT = BOARD_READCOUNT;
    }

    public MultipartFile getUploadFile() {
        return uploadFile;
    }

    public void setUploadFile(MultipartFile uploadFile) {
        this.uploadFile = uploadFile;
    }

    public String getBOARD_ORIGINAL() {
        return BOARD_ORIGINAL;
    }

    public void setBOARD_ORIGINAL(String BOARD_ORIGINAL) {
        this.BOARD_ORIGINAL = BOARD_ORIGINAL;
    }

    public String getBOARD_DATE() {
        return BOARD_DATE;
    }

    public void setBOARD_DATE(String BOARD_DATE) {
        this.BOARD_DATE = BOARD_DATE;
    }
}