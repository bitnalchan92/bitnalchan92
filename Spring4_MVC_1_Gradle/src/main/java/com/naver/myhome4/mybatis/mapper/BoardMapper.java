package com.naver.myhome4.mybatis.mapper;

import com.naver.myhome4.domain.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;


/*
    Mapper 인터페이스란 MyBatis에서 SQL쿼리를 매핑하고 실행하기 위해 사용하는 인터페이스입니다.
    MyBatis-Spring은 Mapper인터페이스를 이용해서 실제 SQL 처리가 되는 클래스를 자동으로 생성합니다.
 */
@Mapper
public interface BoardMapper {
    //  글의 갯수 구하기
    public int getListCount();

    public List<Board> getBoardList(HashMap<String, Integer> map);

    // 글 등록하기
    public void insertBoard(Board board);

    // 글 내용 보기
    public Board getDetail(int num);

    // 조회수 업데이트
    public int setReadCountUpdate(int num);

    // 글쓴이인지 확인
    public Board isBoardWriter(HashMap<String, Object> map);

    // 글 수정
    public int boardModify(Board modifyBoard);

    // BOARD_RE_SEQ값 수정
    public int boardReplyUpdate(Board board);

    // 글 답변
    public int boardReply(Board board);

    // 글 삭제
    public int boardDelete(Board board);

    void updateReadCount(int num);
}
