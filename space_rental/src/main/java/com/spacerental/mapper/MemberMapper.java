package com.spacerental.mapper;

import java.util.HashMap;

import com.spacerental.vo.Host;
import com.spacerental.vo.Member;

public interface MemberMapper {
	
	void insertMember(Member member);

	Member selectMemberByIdAndPasswd(HashMap<String, Object> params);
}
