package com.spacerental.service;

import java.util.List;

import com.spacerental.vo.Host;
import com.spacerental.vo.Space;
import com.spacerental.vo.SpaceFile;

public interface SpaceService {

	Integer registerSpaceTx(Space space);
	
	List<Space> findSpaceList();
	
	List<Host> findHostList();
	
	Host findHostByHostNo(int hostNo);
	
	SpaceFile findHostFile(int productNo);
	
	List<SpaceFile> findSpaceFilesBySpaceNo(int spaceNo);
	
	List<SpaceFile> findHostFilesByHostNo(int hostNo);
	
	
}
