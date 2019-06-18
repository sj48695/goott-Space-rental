package com.spacerental.repository;

import com.spacerental.vo.Host;
import com.spacerental.vo.Member;

public interface MemberRepository {

	void insertMember(Member member);

	Member selectMemberByIdAndPasswd(String id, String passwd);

	void updateMember(Member member);

	void deleteMember(String id);

}
