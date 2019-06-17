package com.spacerental.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import com.spacerental.mapper.SearchMapper;
import com.spacerental.vo.Notice;

public class SearchRepositoryImpl implements SearchRepository {
	
	private JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	private SearchMapper SearchMapper;
	public SearchMapper getSearchMapper() {
		return SearchMapper;
	}
	public void setSearchMapper(SearchMapper searchMapper) {
		SearchMapper = searchMapper;
	}
	

	@Override
	public ArrayList<Notice> searchroomList(String value) {
		List<Notice> Notices = SearchMapper.searchroomlist(value);
		return (ArrayList<Notice>)Notices;
	}
	
	@Override
	public ArrayList<Notice> searchaddList(String value) {
		List<Notice> Notices = SearchMapper.searchaddlist(value);
		return (ArrayList<Notice>)Notices;
	}
	
	@Override
	public ArrayList<Notice> searchlossList(String value) {
		List<Notice> Notices = SearchMapper.searchlosslist(value);
		return (ArrayList<Notice>)Notices;
	}


}
