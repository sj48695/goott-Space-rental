package com.spacerental.service;

import java.util.List;

import com.spacerental.vo.Notice;
import com.spacerental.vo.Space;

public interface SearchService {

	List<Notice> searchroomlist(String value);
	List<Notice> searchaddlist(String value);
	List<Notice> searchlosslist(String value);
	List<Space> computerlist();
	List<Space> beamprojectlist();
	List<Space> wifilist();
	List<Space> tenlesslist();
	List<Space> tenmore();
	
}
