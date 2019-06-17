package com.spacerental.service;

import java.util.List;

import com.spacerental.vo.Notice;

public interface SearchService {

	List<Notice> searchroomlist(String value);
	List<Notice> searchaddlist(String value);
	List<Notice> searchlosslist(String value);
	
}
