package com.spacerental.mapper;

import java.util.HashMap;
import java.util.List;

import com.spacerental.vo.Host;
import com.spacerental.vo.Lose;
import com.spacerental.vo.Member;
import com.spacerental.vo.Rent;
import com.spacerental.vo.SpaceFile;

public interface MemberMapper {
	
	void insertMember(Member member);

	Member selectMemberByIdAndPasswd(HashMap<String, Object> params);

	void updateMember(Member member);

	void deleteMember(String id);	

	List<Rent> selectSpaceList(String id);

	List<Host> selectHostList(String id);

	SpaceFile selectHostFile(int hostNo);

	List<Lose> selectLoseList(String uploader);

	List<Host> selectOkHostList(int i);

	void updateOk(Host host);
	
}
