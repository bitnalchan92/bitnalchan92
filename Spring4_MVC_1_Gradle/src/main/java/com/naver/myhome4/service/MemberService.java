package com.naver.myhome4.service;

import com.naver.myhome4.domain.Member;

import java.util.List;

public interface MemberService {
    public int isId(String id, String password);

    public void insert(Member m);

    public int isId(String id);

    public Member memberInfo(String id);

    public void delete(String id);

    public int update(Member m);

    public List<Member> getSearchList(int index, String searchWord, int page, int limit);

    public int getSearchListCount(int index, String searchWord);
}
