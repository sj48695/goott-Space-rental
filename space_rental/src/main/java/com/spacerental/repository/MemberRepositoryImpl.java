package com.spacerental.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.spacerental.mapper.MemberMapper;
import com.spacerental.vo.Member;
import com.spacerental.vo.Rent;

public class MemberRepositoryImpl implements MemberRepository {

	private MemberMapper memberMapper;

	public MemberMapper getMemberMapper() {
		return memberMapper;
	}

	public void setMemberMapper(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}

	@Override
	public void insertMember(Member member) {
		memberMapper.insertMember(member);
	}

	@Override
	public Member selectMemberByIdAndPasswd(String id, String passwd) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("passwd", passwd);
		
		Member member = memberMapper.selectMemberByIdAndPasswd(params);
		return member;
	}

	@Override
	public void updateMember(Member member) {
		memberMapper.updateMember(member);
		
	}

	@Override
	public void deleteMember(String id) {
		memberMapper.deleteMember(id);
		
	}

	@Override
	public List<Rent> selectlentList(String id) {
		List<Rent> rent = memberMapper.selectlentList(id);
		return rent;
	}

}
