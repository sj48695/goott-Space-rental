package com.spacerental.service;

import java.util.List;

import com.spacerental.vo.Member;
import com.spacerental.vo.Rent;

public interface MemberService {

	void insertMember(Member member);

	Member selectMemberByIdAndPasswd(String id, String passwd);

	void updateMember(Member member);

	void deleteMember(String id);

	List<Rent> selectlentList(String id);

}
