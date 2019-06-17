package com.spacerental.repository;

import com.spacerental.vo.Host;
import com.spacerental.vo.Space;
import com.spacerental.vo.SpaceFile;

public interface SpaceRepository {

	int insertSpace(Space space);

	void insertSpaceFile(SpaceFile file);

}
