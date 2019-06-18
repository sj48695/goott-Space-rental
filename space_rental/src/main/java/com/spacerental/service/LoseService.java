package com.spacerental.service;

import java.util.List;

import com.spacerental.vo.Lose;
import com.spacerental.vo.LoseFile;

public interface LoseService {

	void registerLose(Lose lose);
	void registerLose2(Lose lose);

	List<Lose> findList();
	Lose findLoseByLoseNo(int loseNo);
	List<LoseFile> findLoseFilesByLoseFileNo(int loseNo);

}
