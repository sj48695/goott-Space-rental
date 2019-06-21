package com.spacerental.repository;

import java.util.HashMap;
import java.util.List;

import com.spacerental.common.Pagination;
import com.spacerental.mapper.HostMapper;
import com.spacerental.mapper.SpaceMapper;
import com.spacerental.vo.Host;
import com.spacerental.vo.Space;
import com.spacerental.vo.SpaceFile;

public class SpaceRepositoryImpl implements SpaceRepository {

	private SpaceMapper spaceMapper;

	public SpaceMapper getSpaceMapper() {
		return spaceMapper;
	}

	public void setSpaceMapper(SpaceMapper spaceMapper) {
		this.spaceMapper = spaceMapper;
	}

	private HostMapper hostMapper;

	public HostMapper getHostMapper() {
		return hostMapper;
	}

	public void setHostMapper(HostMapper hostMapper) {
		this.hostMapper = hostMapper;
	}

	@Override
	public int insertHost(Host host) {
		int newHostNo = hostMapper.insertHost(host);
		return newHostNo;
	}
	
	@Override
	public int insertHost2(Host host) {
		hostMapper.insertHost2(host);
		return host.getHostNo();
	}

	@Override
	public int insertSpace(Space space) {
		spaceMapper.insertSpace(space);
		return space.getSpaceNo();
	}

	@Override
	public void insertSpaceFile(SpaceFile file) {
		spaceMapper.insertSpaceFile(file);
	}
	
	@Override
	public int selectHostListCnt(String type) {
		HashMap<String,Object> param = new HashMap<String, Object>();
		param.put("type", type);
		int hostCnt = hostMapper.selectHostListCnt(param);
		return hostCnt;
	}

	@Override
	public List<Host> selectHost(Pagination pagination, String type) {
		HashMap<String,Object> params = new HashMap<String, Object>();
		params.put("type", type);
		//params.put("pagination", pagination);
		params.put("startList", pagination.getStartList());
		params.put("endList", pagination.getEndList());
		
		List<Host> hosts = hostMapper.selectHost(params);
		return hosts;
	}

	@Override
	public Host selectHostByHostNo(int hostNo) {
		Host host = hostMapper.selectHostByHostNo(hostNo);
		return host;
	}

	@Override
	public SpaceFile selectHostFile(int hostNo) {
		SpaceFile file = hostMapper.selectHostFile(hostNo);
		return file;
	}

	@Override
	public List<SpaceFile> selectSpaceFilesBySpaceNo(int spaceNo) {
		List<SpaceFile> files = spaceMapper.selectSpaceFilesBySpaceNo(spaceNo);
		return files;
	}

	@Override
	public List<SpaceFile> selectHostFilesByHostNo(int hostNo) {
		List<SpaceFile> hostfiles = hostMapper.selectHostFilesByHostNo(hostNo);
		return hostfiles;
	}

	@Override
	public List<Space> selectSpacesByHostNo(int hostNo) {
		List<Space> spaces = spaceMapper.selectSpacesByHostNo(hostNo);
		return spaces;
	}

	@Override
	public Space selectSpaceBySpaceNo(int spaceNo) {
		Space space = spaceMapper.selectSpaceBySpaceNo(spaceNo);
		return space;
	}

	@Override
	public SpaceFile selectSpaceFile(int spaceNo) {
		SpaceFile file = spaceMapper.selectSpaceFile(spaceNo);
		return file;
	}

}
