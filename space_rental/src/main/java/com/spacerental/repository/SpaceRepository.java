package com.spacerental.repository;

import java.util.List;

import com.spacerental.vo.Host;
import com.spacerental.vo.Space;
import com.spacerental.vo.SpaceFile;

public interface SpaceRepository {

	int insertSpace(Space space);

	void insertSpaceFile(SpaceFile file);
	
	int insertHost(Host host);

	List<Host> selectHost();

	Host selectHostByHostNo(int hostNo);


}
