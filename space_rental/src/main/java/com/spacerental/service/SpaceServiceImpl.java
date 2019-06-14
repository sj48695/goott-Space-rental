package com.spacerental.service;

import com.spacerental.repository.SpaceRepository;
import com.spacerental.vo.Space;
import com.spacerental.vo.SpaceFile;

public class SpaceServiceImpl implements SpaceService{

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
		
//		int result=10/0;
		for (SpaceFile file : space.getFiles()) {
			file.setSpaceNo(newSpaceNo);
			spaceRepository.insertSpaceFile(file);
		}

		return newSpaceNo;
	}
	
}
