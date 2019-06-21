package com.spacerental.repository;

import java.util.ArrayList;
import java.util.List;

import com.spacerental.mapper.HostMapper;
import com.spacerental.mapper.SpaceMapper;
import com.spacerental.vo.Host;
import com.spacerental.vo.Lose;
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
	public int insertSpace(Space space) {
		spaceMapper.insertSpace(space);
		return space.getSpaceNo();
	}

	@Override
	public void insertSpaceFile(SpaceFile file) {
		spaceMapper.insertSpaceFile(file);
	}

	@Override
	public List<Host> selectHost() {
		List<Host> hosts = hostMapper.selectHost();
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
	public ArrayList<Host> searchspaceList(String value) {
		List<Host> space = hostMapper.searchspacelist(value);
		return (ArrayList<Host>)space;
	}

	@Override
	public ArrayList<Host> searchaddList(String value) {
		List<Host> space = hostMapper.searchaddlist(value);
		return (ArrayList<Host>)space;
	}

	@Override
	public ArrayList<Host> searchPCList() {
		List<Host> space = hostMapper.searchPClist();
		return (ArrayList<Host>)space;
	}

	@Override
	public ArrayList<Host> searchBeamList() {
		List<Host> space = hostMapper.searchBeamlist();
		return (ArrayList<Host>)space;
	}

	@Override
	public ArrayList<Host> searchWifiList() {
		List<Host> space = hostMapper.searchWifilist();
		return (ArrayList<Host>)space;
	}

	@Override
	public ArrayList<Host> searchTenlessList() {
		List<Host> space = hostMapper.searchTenlesslist();
		return (ArrayList<Host>)space;
	}

	@Override
	public ArrayList<Host> searchTenmoreList() {
		List<Host> space = hostMapper.searchTenmorelist();
		return (ArrayList<Host>)space;
	}
}
