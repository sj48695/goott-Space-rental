package com.spacerental.service;

import com.spacerental.vo.Member;

public interface MemberService {

	void insertMember(Member member);

	Member selectMemberByIdAndPasswd(String id, String passwd);

	void updateMember(Member member);

	void deleteMember(String id);
}
