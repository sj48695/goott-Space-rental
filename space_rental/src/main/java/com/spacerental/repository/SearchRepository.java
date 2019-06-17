package com.spacerental.repository;

import java.util.ArrayList;

import com.spacerental.vo.Notice;

public interface SearchRepository {
	
	ArrayList<Notice> searchroomList(String value);
	ArrayList<Notice> searchaddList(String value);
	ArrayList<Notice> searchlossList(String value);

}
