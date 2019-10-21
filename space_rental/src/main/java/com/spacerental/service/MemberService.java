package com.spacerental.service;

import java.util.List;

import com.spacerental.vo.Host;
import com.spacerental.vo.Lose;
import com.spacerental.vo.LoseFile;
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

	SpaceFile selectHostFile(int hostNo);

	List<Rent> selectHostRentList(int hostNo);

	List<Lose> selectLoseList(String uploader);

	List<Host> selectOkHostList(int i);

	void updateOk(Host host);

	List<Host> selectAllHostList(int hostNo);

	void cancelRent(Rent rent);

	Member idCheck(String id);
	
}
