package com.spacerental.repository;

import com.spacerental.vo.Host;
import com.spacerental.vo.Member;

public interface MemberRepository {

	void insertMember(Member member);

	void insertHost(Host host);

	Member selectMemberByIdAndPasswd(String id, String passwd);

}
