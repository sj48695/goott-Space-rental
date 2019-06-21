package com.spacerental.mapper;

import java.util.HashMap;
import java.util.List;

import com.spacerental.common.Pagination;
import com.spacerental.vo.Host;
import com.spacerental.vo.Space;
import com.spacerental.vo.SpaceFile;

public interface HostMapper {

	int insertHost(Host host);
	
	void insertHost2(Host host);
	
	Host selectHostByHostNo(int hostNo);
	
	int selectHostListCnt(HashMap<String, Object> param);
	
	List<Host> selectHost(HashMap<String, Object> param);
	
	SpaceFile selectHostFile(int hostNo); 
	
	List<SpaceFile> selectHostFilesByHostNo(int hostNo);

	List<Host> searchspacelist(String value);
	List<Host> searchaddlist(String value);

	List<Host> searchPClist();
	List<Host> searchBeamlist();
	List<Host> searchWifilist();
	List<Host> searchTenlesslist();
	List<Host> searchTenmorelist();


}
