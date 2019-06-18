package com.spacerental.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spacerental.repository.SearchRepository;
import com.spacerental.vo.Notice;
import com.spacerental.vo.Space;

@Service("SearchService")
public class SearchServiceImpl implements SearchService {
	
	private SearchRepository searchRepository;	
	

	public SearchRepository getSearchRepository() {
		return searchRepository;
	}
	public void setSearchRepository(SearchRepository searchRepository) {
		this.searchRepository = searchRepository;
	}
	@Override
	public List<Notice> searchroomlist(String value) {
		ArrayList<Notice> notices = searchRepository.searchroomList(value);
		return notices;
	}
	@Override
	public List<Notice> searchaddlist(String value) {
		ArrayList<Notice> notices = searchRepository.searchaddList(value);
		return notices;
	}
	@Override
	public List<Notice> searchlosslist(String value) {
		ArrayList<Notice> notices = searchRepository.searchlossList(value);
		return notices;
	}

	@Override
	public List<Space> computerlist() {
		ArrayList<Space> Spaces = searchRepository.computerlist();
		return Spaces;
	}
	@Override
	public List<Space> beamprojectlist() {
		ArrayList<Space> Spaces = searchRepository.beamprojectlist();
		return Spaces;
	}
	@Override
	public List<Space> wifilist() {
		ArrayList<Space> Spaces = searchRepository.wifilist();
		return Spaces;
	}
	@Override
	public List<Space> tenlesslist() {
		ArrayList<Space> Spaces = searchRepository.tenlesslist();
		return Spaces;
	}
	@Override
	public List<Space> tenmore() {
		ArrayList<Space> Spaces = searchRepository.tenmorelist();
		return Spaces;
	}
	
}
