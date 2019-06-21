package com.spacerental.service;

import java.util.ArrayList;
import java.util.List;

import com.spacerental.repository.SpaceRepository;
import com.spacerental.vo.Host;
import com.spacerental.vo.Space;
import com.spacerental.vo.SpaceFile;

public class SpaceServiceImpl implements SpaceService {

	private SpaceRepository spaceRepository;

	public SpaceRepository getSpaceRepository() {
		return spaceRepository;
	}

	public void setSpaceRepository(SpaceRepository spaceRepository) {
		this.spaceRepository = spaceRepository;
	}

	@Override
	public Integer registerSpaceTx(Space space) {

		int newSpaceNo = spaceRepository.insertSpace(space);
		
//		대표이미지
		SpaceFile titleFile = space.getFile();
		titleFile.setSpaceNo(newSpaceNo);
		spaceRepository.insertSpaceFile(titleFile);
		//System.out.println(titleFile);
//		이미지
		for (SpaceFile file : space.getFiles()) {
			file.setSpaceNo(newSpaceNo);
			spaceRepository.insertSpaceFile(file);
			//System.out.println(file);
		}
		return newSpaceNo;
	}
	
	@Override
	public int registerHost(Host host) {
		int newHostNo = spaceRepository.insertHost(host);
		return newHostNo;
	}

	@Override
	public List<Host> findHostList() {
		
		List<Host> hosts = spaceRepository.selectHost();
		
		return hosts;
	}

	@Override
	public Host findHostByHostNo(int hostNo) {
		
		Host host = spaceRepository.selectHostByHostNo(hostNo);
		
		return host;
	}

	@Override
	public SpaceFile findHostFile(int hostNo) {
		
		SpaceFile file = spaceRepository.selectHostFile(hostNo);
		
		return file;
	}

	@Override
	public List<SpaceFile> findSpaceFilesBySpaceNo(int spaceNo) {
		
		List<SpaceFile> files = spaceRepository.selectSpaceFilesBySpaceNo(spaceNo);
		
		return files;
	}

	@Override
	public List<SpaceFile> findHostFilesByHostNo(int hostNo) {
		
		List<SpaceFile> hostfiles = spaceRepository.selectHostFilesByHostNo(hostNo);
		
		return hostfiles;

	
	}

	@Override
	public List<Space> findSpacesByHostNo(int hostNo) {
		List<Space> spaces =spaceRepository.selectSpacesByHostNo(hostNo);
		return spaces;
	}

	@Override
	public Space findSpaceBySpaceNo(int spaceNo) {
		Space space = spaceRepository.selectSpaceBySpaceNo(spaceNo);
		return space;
	}

	@Override
	public List<Host> searchspacelist(String value) {
		ArrayList<Host> space = spaceRepository.searchspaceList(value);
		return space;
	}

	@Override
	public List<Host> searchaddlist(String value) {
		ArrayList<Host> space = spaceRepository.searchaddList(value);
		return space;
	}

	@Override
	public List<Host> computerlist() {
		ArrayList<Host> space = spaceRepository.searchPCList();
		return space;
	}

	@Override
	public List<Host> beamprojectlist() {
		ArrayList<Host> space = spaceRepository.searchBeamList();
		return space;
	}

	@Override
	public List<Host> wifilist() {
		ArrayList<Host> space = spaceRepository.searchWifiList();
		return space;
	}

	@Override
	public List<Host> tenlesslist() {
		ArrayList<Host> space = spaceRepository.searchTenlessList();
		return space;
	}

	@Override
	public List<Host> tenmore() {
		ArrayList<Host> space = spaceRepository.searchTenmoreList();
		return space;
	}

}
