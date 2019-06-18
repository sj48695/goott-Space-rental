package com.spacerental.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import com.spacerental.mapper.SearchMapper;
import com.spacerental.vo.Notice;
import com.spacerental.vo.Space;

public class SearchRepositoryImpl implements SearchRepository {
	
	private JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	private SearchMapper searchMapper;
	
	public SearchMapper getSearchMapper() {
		return searchMapper;
	}
	public void setSearchMapper(SearchMapper searchMapper) {
		this.searchMapper = searchMapper;
	}
	@Override
	public ArrayList<Notice> searchroomList(String value) {
		List<Notice> Notices = searchMapper.searchroomlist(value);
		return (ArrayList<Notice>)Notices;
	}
	
	@Override
	public ArrayList<Notice> searchaddList(String value) {
		List<Notice> Notices = searchMapper.searchaddlist(value);
		return (ArrayList<Notice>)Notices;
	}
	
	@Override
	public ArrayList<Notice> searchlossList(String value) {
		List<Notice> Notices = searchMapper.searchlosslist(value);
		return (ArrayList<Notice>)Notices;
	}


	@Override
	public ArrayList<Space> computerlist() {
		List<Space> Spaces = searchMapper.computerlist();
		return (ArrayList<Space>)Spaces;
	}
	@Override
	public ArrayList<Space> beamprojectlist() {
		List<Space> Spaces = searchMapper.beamprojectlist();
		return (ArrayList<Space>)Spaces;
	}
	@Override
	public ArrayList<Space> wifilist() {
		List<Space> Spaces = searchMapper.wifilist();
		return (ArrayList<Space>)Spaces;
	}
	@Override
	public ArrayList<Space> tenlesslist() {
		List<Space> Spaces = searchMapper.tenlesslist();
		return (ArrayList<Space>)Spaces;
	}
	@Override
	public ArrayList<Space> tenmorelist() {
		List<Space> Spaces = searchMapper.tenmorelist();
		return (ArrayList<Space>)Spaces;
	}
}
