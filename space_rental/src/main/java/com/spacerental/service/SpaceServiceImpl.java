package com.spacerental.service;

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

//		이미지
		for (SpaceFile file : space.getFiles()) {
			file.setSpaceNo(newSpaceNo);
			spaceRepository.insertSpaceFile(file);
		}
		return newSpaceNo;
	}

}
