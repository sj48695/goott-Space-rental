package com.spacerental.repository;

import java.util.ArrayList;
import java.util.List;

import com.spacerental.vo.Lose;
import com.spacerental.vo.LoseFile;

public interface LoseRepository {

	void insertLose(Lose lose);
	
	void insertLoseFile(LoseFile file);
	
	void insertlose2(Lose lose);

	List<Lose> findList();
	
}
