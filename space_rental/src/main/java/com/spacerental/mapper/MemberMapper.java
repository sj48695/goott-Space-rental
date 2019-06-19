package com.spacerental.mapper;

import java.util.HashMap;
import java.util.List;

import com.spacerental.vo.Host;
import com.spacerental.vo.Member;
import com.spacerental.vo.Rent;

public interface MemberMapper {
	
	void insertMember(Member member);

	Member selectMemberByIdAndPasswd(HashMap<String, Object> params);

	void updateMember(Member member);

	void deleteMember(String id);

	List<Rent> selectlentList(String id);
}
