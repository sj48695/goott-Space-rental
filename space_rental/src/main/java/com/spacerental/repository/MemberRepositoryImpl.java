package com.spacerental.repository;

import java.util.HashMap;
import java.util.List;

import com.spacerental.mapper.MemberMapper;
import com.spacerental.mapper.RentMapper;
import com.spacerental.mapper.SpaceMapper;
import com.spacerental.vo.Host;
import com.spacerental.vo.Lose;
import com.spacerental.vo.Member;
import com.spacerental.vo.Rent;
import com.spacerental.vo.SpaceFile;

public class MemberRepositoryImpl implements MemberRepository {

	private MemberMapper memberMapper;

	public MemberMapper getMemberMapper() {
		return memberMapper;
	}

	public void setMemberMapper(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}

	private RentMapper rentMapper;
	
	public RentMapper getRentMapper() {
		return rentMapper;
	}

	public void setRentMapper(RentMapper rentMapper) {
		this.rentMapper = rentMapper;
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
	public List<Rent> selectrentList(String id) {
		List<Rent> rent = rentMapper.selectrentList(id);
		return rent;
	}

	@Override
	public List<Host> selectHostList(String id) {
		List<Host> host = memberMapper.selectHostList(id);
		return host;
	}

	@Override
	public SpaceFile selectHostFile(String id) {
		SpaceFile file = memberMapper.selectHostFile(id);
		return file;
	}

	@Override
	public List<Rent> selectHostRentList(int hostNo) {
		List<Rent> rentlist = rentMapper.selectHostRentList(hostNo);
		return rentlist;
	}

	@Override
	public List<Lose> selectLoseList(String uploader) {
		List<Lose> loselist = memberMapper.selectLoseList(uploader);
		return loselist;
	}

}
