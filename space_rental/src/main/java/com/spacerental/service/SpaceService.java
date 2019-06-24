package com.spacerental.service;

import java.util.List;

import com.spacerental.common.Pagination;
import com.spacerental.vo.Host;
import com.spacerental.vo.Rent;
import com.spacerental.vo.Space;
import com.spacerental.vo.SpaceFile;

public interface SpaceService {
	
	//int registerHost(Host host);
	
	Integer registerHostTx(Host host);

	Integer registerSpaceTx(Space space);
	
	int findHostListCnt(String type);
	
	List<Host> findHostList(Pagination pagination, String type);
	
	Host findHostByHostNo(int hostNo);
	
	SpaceFile findHostFile(int hostNo);
	
	List<SpaceFile> findSpaceFilesBySpaceNo(int spaceNo);
	
	List<SpaceFile> findHostFilesByHostNo(int hostNo);

	List<Space> findSpacesByHostNo(int hostNo);

	Space findSpaceBySpaceNo(int spaceNo);

	List<Host> searchspacelist(String value);
	
	List<Host> searchaddlist(String value);

	SpaceFile findSpaceFile(int hostNo);
	
	SpaceFile findSpaceFileBySpaceFileNo(int spaceFileNo);

	List<Rent> findRentsBySpaceNo(int spaceNo);
	
	List<Host> computerlist();
	List<Host> beamprojectlist();
	List<Host> wifilist();
	List<Host> tenlesslist();
	List<Host> tenmore();
	
	void updateHost(Host host);
	
	void updateSpace(Space space);

	void updateSpaceFile(SpaceFile file);
	
	void deleteSpace(int spaceNo);
	
	void deleteHost(int hostNo);
	
	void deleteSpaceFile(int spaceFileNo);

	void insertSpaceFiles(Space space, int spaceNo);

}
