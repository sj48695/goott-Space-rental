package com.spacerental.service;

import java.util.List;

import com.spacerental.vo.Host;
import com.spacerental.vo.Member;
import com.spacerental.vo.Rent;
import com.spacerental.vo.SpaceFile;

public interface MemberService {

	void insertMember(Member member);

	Member selectMemberByIdAndPasswd(String id, String passwd);

	void updateMember(Member member);

	void deleteMember(String id);

	List<Rent> selectrentList(String id);

	List<Host> selectHostList(String id);

	SpaceFile selectHostFile(String id);

	List<Rent> selectHostRentList(int hostNo);

}
