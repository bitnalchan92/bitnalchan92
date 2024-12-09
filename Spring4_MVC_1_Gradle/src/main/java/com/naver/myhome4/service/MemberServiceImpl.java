package com.naver.myhome4.service;

import com.naver.myhome4.domain.Member;
import com.naver.myhome4.mybatis.mapper.MemberMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {
    private MemberMapper dao;

    public MemberServiceImpl(MemberMapper dao) {
        this.dao = dao;
    }

    @Override
    public int isId(String id, String password) {
        int result = -1; // 아이디가 존재하지 않는 경우 - rMember가 null인 경우

        Member rMember = dao.isId(id);

        if (rMember != null) {
            // 아이디가 존재하는 경우
            if (rMember.getPassword().equals(password)) {
                result = 1; // 아이디와 비밀번호가 일치하는 경우
            } else {
                result = 0; // 아이디는 존재하지만 비밀번호가 일치하지 않는 경우
            }

        } else {
            result = 0;
            
        }

        return result;
    }

    @Override
    public void insert(Member m) {
        dao.insert(m);
    }

    @Override
    public int isId(String id) {
        Member rMember = dao.isId(id);
        /*
            -1은 아이디가 존재하지 않는 경우
             1은 아이디가 존재하는 경우
         */
        return (rMember == null) ? -1 : 1;
    }

    @Override
    public Member memberInfo(String id) {
        return dao.memberInfo(id);
    }

    @Override
    public void delete(String id) {
    }

    @Override
    public int update(Member m) {
        return 0;
    }

    @Override
    public List<Member> getSearchList(int index, String searchWord, int page, int limit) {
        return null;
    }

    @Override
    public int getSearchListCount(int index, String searchWord) {
        return 0;
    }
}
