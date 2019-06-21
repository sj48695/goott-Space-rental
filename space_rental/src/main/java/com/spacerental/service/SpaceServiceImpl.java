package com.spacerental.service;

import java.util.List;

import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;

import com.spacerental.common.Pagination;
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
	public Integer registerHostTx(Host host) {
		int newHostNo = spaceRepository.insertHost2(host);
		return newHostNo;
	}
	
	@Override
	public int findHostListCnt(String type) {
		int hostCnt = spaceRepository.selectHostListCnt(type);
		return hostCnt;
	}


	@Override
	public List<Host> findHostList(Pagination pagination, String type) {
		
		List<Host> hosts = spaceRepository.selectHost(pagination, type);
		
		return hosts;
	}

	@Override
	public List<SpaceFile> findHostFilesByHostNo(int hostNo) {
		List<SpaceFile> hostfiles = spaceRepository.selectHostFilesByHostNo(hostNo);
		return hostfiles;
	}

	@Override
	public List<SpaceFile> findSpaceFilesBySpaceNo(int spaceNo) {
		List<SpaceFile> files = spaceRepository.selectSpaceFilesBySpaceNo(spaceNo);
		return files;
	}

	@Override
	public List<Space> findSpacesByHostNo(int hostNo) {
		List<Space> spaces = spaceRepository.selectSpacesByHostNo(hostNo);
		return spaces;
	}

	@Override
	public Host findHostByHostNo(int hostNo) {
		Host host = spaceRepository.selectHostByHostNo(hostNo);
		return host;
	}

	@Override
	public Space findSpaceBySpaceNo(int spaceNo) {
		Space space = spaceRepository.selectSpaceBySpaceNo(spaceNo);
		return space;
	}

	@Override
	public SpaceFile findHostFile(int hostNo) {
		SpaceFile file = spaceRepository.selectHostFile(hostNo);
		return file;
	}

	@Override
	public SpaceFile findSpcaeFile(int spaceNo) {
		SpaceFile file = spaceRepository.selectSpaceFile(spaceNo);
		return file;
	}

}
