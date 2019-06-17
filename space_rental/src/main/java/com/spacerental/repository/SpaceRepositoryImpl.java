package com.spacerental.repository;

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

	@Override
	public int insertSpace(Space space) {
		spaceMapper.insertSpace(space);
		return space.getSpaceNo();
	}

	@Override
	public void insertSpaceFile(SpaceFile file) {
		spaceMapper.insertSpaceFile(file);
	}
}
