package com.spacerental.repository;

import java.util.ArrayList;

import com.spacerental.vo.Notice;
import com.spacerental.vo.Space;

public interface SearchRepository {
	
	ArrayList<Notice> searchroomList(String value);
	ArrayList<Notice> searchaddList(String value);
	ArrayList<Notice> searchlossList(String value);
	
	ArrayList<Space> computerlist();
	ArrayList<Space> beamprojectlist();
	ArrayList<Space> wifilist();
	ArrayList<Space> tenlesslist();
	ArrayList<Space> tenmorelist();
}
