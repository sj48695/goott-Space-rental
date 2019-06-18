package com.spacerental.mapper;

import java.util.List;

import com.spacerental.vo.Notice;
import com.spacerental.vo.Space;

public interface SearchMapper {

	List<Notice> searchroomlist(String value);
	List<Notice> searchaddlist(String value);
	List<Notice> searchlosslist(String value);
	List<Space> computerlist();
	List<Space> beamprojectlist();
	List<Space> wifilist();
	List<Space> tenlesslist();
	List<Space> tenmorelist();
	
}
