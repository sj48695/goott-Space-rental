package com.spacerental.repository;

import org.mybatis.spring.SqlSessionTemplate;

import com.spacerental.mapper.MemberMapper;
import com.spacerental.vo.Member;

public class MemberRepositoryImpl implements MemberRepository{
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

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

}
