package com.spacerental.service;

import com.spacerental.vo.Host;
import com.spacerental.vo.Member;

public interface MemberService {

	void insertMember(Member member);

	void insertHost(Host host);

	Member selectMemberByIdAndPasswd(String id, String passwd);

}
