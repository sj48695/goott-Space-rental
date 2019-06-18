package com.spacerental.mapper;

import java.util.List;

import com.spacerental.vo.Host;

public interface HostMapper {

	int insertHost(Host host);

	List<Host> selectHost();

	Host selectHostByHostNo(int hostNo);

}
