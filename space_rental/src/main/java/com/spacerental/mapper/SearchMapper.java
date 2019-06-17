package com.spacerental.mapper;

import java.util.List;

import com.spacerental.vo.Notice;

public interface SearchMapper {

	List<Notice> searchroomlist(String value);
	List<Notice> searchaddlist(String value);
	List<Notice> searchlosslist(String value);
	
	
}
