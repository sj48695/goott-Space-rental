package com.spacerental.mapper;

import com.spacerental.vo.Host;
import com.spacerental.vo.Member;

public interface MemberMapper {
	
	void insertMember(Member member);

	void insertHost(Host host);
}
