package com.spacerental.service;

import java.util.List;

import com.spacerental.common.Util;
import com.spacerental.repository.MemberRepository;
import com.spacerental.vo.Host;
import com.spacerental.vo.Member;
import com.spacerental.vo.Rent;
import com.spacerental.vo.SpaceFile;

public class MemberServiceImpl implements MemberService{

	private MemberRepository memberRepository;

	public MemberRepository getMemberRepository() {
		return memberRepository;
	}

	public void setMemberRepository(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	
	@Override
	public void insertMember(Member member) {		
		String passwd = Util.getHashedString(member.getPasswd(), "SHA-256"); //패스워드 암호화 (복원불가능)
		member.setPasswd(passwd);  
		memberRepository.insertMember(member);
		
	}

	@Override
	public Member selectMemberByIdAndPasswd(String id, String passwd) {
		passwd = Util.getHashedString(passwd, "SHA-256");
		Member member = memberRepository.selectMemberByIdAndPasswd(id, passwd);
		return member;
	}

	@Override
	public void updateMember(Member member) {
		String passwd = Util.getHashedString(member.getPasswd(), "SHA-256");
		member.setPasswd(passwd); 
		memberRepository.updateMember(member);	
	}

	@Override
	public void deleteMember(String id) {
		memberRepository.deleteMember(id);
		
	}

	@Override
	public List<Rent> selectrentList(String id) {
		List<Rent> rent = memberRepository.selectrentList(id);
		return rent;
	}

	@Override
	public List<Host> selectHostList(String id) {
		List<Host> host = memberRepository.selectHostList(id);
		return host;
	}

	@Override
	public SpaceFile selectHostFile(String id) {
		SpaceFile file = memberRepository.selectHostFile(id);
		return file;
	}

	@Override
	public List<Rent> selectHostRentList(int hostNo) {
		List<Rent> rentlist =  memberRepository.selectHostRentList(hostNo);
		return rentlist;
	}
	
}
