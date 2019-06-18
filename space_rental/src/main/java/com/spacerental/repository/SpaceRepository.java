package com.spacerental.repository;

import java.util.List;

import com.spacerental.vo.Host;
import com.spacerental.vo.Space;
import com.spacerental.vo.SpaceFile;

public interface SpaceRepository {
	
	int insertHost(Host host);

	int insertSpace(Space space);

	void insertSpaceFile(SpaceFile file);

	List<Space> selectSpace();

	List<Host> selectHost();

	Host selectHostByHostNo(int hostNo);

	SpaceFile selectHostFile(int hostNo);

	List<SpaceFile> selectSpaceFilesBySpaceNo(int spaceNo);

	List<SpaceFile> selectHostFilesByHostNo(int hostNo);


}
