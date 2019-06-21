package com.spacerental.service;

import java.util.List;

import com.spacerental.vo.Host;
import com.spacerental.vo.Rent;
import com.spacerental.vo.Space;
import com.spacerental.vo.SpaceFile;

public interface SpaceService {
	
	int registerHost(Host host);

	Integer registerSpaceTx(Space space);
	
	List<Host> findHostList();
	
	Host findHostByHostNo(int hostNo);
	
	SpaceFile findHostFile(int hostNo);
	
	List<SpaceFile> findSpaceFilesBySpaceNo(int spaceNo);
	
	List<SpaceFile> findHostFilesByHostNo(int hostNo);

	List<Space> findSpacesByHostNo(int hostNo);

	Space findSpaceBySpaceNo(int spaceNo);

	SpaceFile findSpcaeFile(int hostNo);

	List<Rent> findRentsBySpaceNo(int spaceNo);
	
}
