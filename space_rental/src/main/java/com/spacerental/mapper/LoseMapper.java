package com.spacerental.mapper;

import com.spacerental.vo.Lose;
import com.spacerental.vo.LoseFile;

public interface LoseMapper {

	void insertLose(Lose lose);

	void insertLoseFile(LoseFile file);

}