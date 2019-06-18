package com.spacerental.mapper;

import java.util.List;

import com.spacerental.vo.Host;
import com.spacerental.vo.Space;
import com.spacerental.vo.SpaceFile;

public interface HostMapper {

	int insertHost(Host host);
	
	Host selectHostByHostNo(int hostNo);
	
	List<Host> selectHost();
	
	SpaceFile selectHostFile(int hostNo); 
	
	List<SpaceFile> selectHostFilesByHostNo(int hostNo); 

}
