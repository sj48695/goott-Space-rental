package com.spacerental.service;

import java.util.List;

import com.spacerental.vo.Host;
import com.spacerental.vo.Space;

public interface SpaceService {
	List<Host> findHost();
	
	int registerHost(Host host);

	Integer registerSpaceTx(Space space);

	Host findHostByHostNo(int hostNo);


}
