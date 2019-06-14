package com.spacerental.repository;

import com.spacerental.mapper.SpaceMapper;
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

	@Override
	public int insertSpace(Space space) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertSpaceFile(SpaceFile file) {
		spaceMapper.insertSpaceFile(file);
	}
	
}
