package com.spacerental.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spacerental.repository.NoticeRepository;
import com.spacerental.repository.SearchRepository;
import com.spacerental.vo.Notice;

@Service("SearchService")
public class SearchServiceImpl implements SearchService {
	
	private SearchRepository SearchRepository;	
	public SearchRepository getSearchRepository() {
		return SearchRepository;
	}
	public void setSearchRepository(SearchRepository searchRepository) {
		SearchRepository = searchRepository;
	}

	@Override
	public List<Notice> searchroomlist(String value) {
		ArrayList<Notice> notices = SearchRepository.searchroomList(value);
		return notices;
	}
	@Override
	public List<Notice> searchaddlist(String value) {
		ArrayList<Notice> notices = SearchRepository.searchaddList(value);
		return notices;
	}
	@Override
	public List<Notice> searchlosslist(String value) {
		ArrayList<Notice> notices = SearchRepository.searchlossList(value);
		return notices;
	}

	
}
