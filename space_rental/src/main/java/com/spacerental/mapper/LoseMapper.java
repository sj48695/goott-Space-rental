package com.spacerental.mapper;

import java.util.List;

import com.spacerental.vo.Lose;
import com.spacerental.vo.LoseFile;

public interface LoseMapper {

	void insertLose(Lose lose);

	void insertLoseFile(LoseFile file);

	void insertLose2(Lose lose);

	List<Lose> findList();
}