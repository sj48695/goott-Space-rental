package com.spacerental.service;

import com.spacerental.common.Util;
import com.spacerental.repository.MemberRepository;
import com.spacerental.vo.Host;
import com.spacerental.vo.Member;

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
	public void insertHost(Host host) {
		memberRepository.insertHost(host);
	}
	
}
