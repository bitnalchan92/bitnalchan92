package com.naver.myhome4.service;

import com.naver.myhome4.domain.Board;
import com.naver.myhome4.mybatis.mapper.BoardMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;


@Service
public class BoardServiceImpl implements BoardService {
    private BoardMapper dao;

    public BoardServiceImpl(BoardMapper dao) {
        this.dao = dao;
    }

    @Override
    public int getListCount() {
        return dao.getListCount();
    }

    @Override
    public List<Board> getBoardList(int page, int limit) {
        HashMap<String, Integer> map = new HashMap<>();

        int startRow = (page - 1) * limit + 1;
        int endRow = startRow + limit - 1;

        map.put("start", startRow);
        map.put("end", endRow);

        return dao.getBoardList(map);
    }

    @Override
    public String saveUploadedFile(MultipartFile uploadFile, String saveFolder) throws Exception {
        return BoardService.super.saveUploadedFile(uploadFile, saveFolder);
    }

    @Override
    public void insertBoard(Board board) {
        dao.insertBoard(board);
    }

    @Override
    public void setReadCountUpdate(int num) {
        dao.setReadCountUpdate(num);
    }

    @Override
    public Board getDetail(int num) {
        return dao.getDetail(num);
    }

    @Override
    public boolean isBoardWriter(int boardNum, String boardPass) {
        HashMap<String, Object> map = new HashMap<>();


        map.put("num", boardNum);
        map.put("pass", boardPass);

        Board result = dao.isBoardWriter(map);

        return result != null; // result가 null이면 false, null이 아니면 true를 리턴합니다.
    }

    @Override
    public int boardModify(Board boardData) {
        return dao.boardModify(boardData);
    }

    public int boardReplyUpdate(Board board) {
        return dao.boardReplyUpdate(board);
    }

    @Override
    @Transactional
    public int boardReply(Board board) {
        boardReplyUpdate(board);
        board.setBOARD_RE_LEV(board.getBOARD_RE_LEV() + 1);
        board.setBOARD_RE_SEQ(board.getBOARD_RE_SEQ() + 1);

        return dao.boardReply(board);
    }

    @Override
    public int boardDelete(int num) {
        int result = 0;
        Board board = dao.getDetail(num);
        if (board != null) {
            result = dao.boardDelete(board);
        }

        return result;
    }
}
