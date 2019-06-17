package com.spacerental.mapper;

import com.spacerental.vo.Space;
import com.spacerental.vo.SpaceFile;

public interface SpaceMapper {

	void insertSpace(Space space);

	void insertSpaceFile(SpaceFile file);

}
