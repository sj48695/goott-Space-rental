package com.spacerental.service;

import java.util.List;

import com.spacerental.vo.Lose;
import com.spacerental.vo.LoseFile;
import com.spacerental.vo.Member;
import com.spacerental.vo.Notice;

public interface LoseService {

	//int registerLose(Lose lose);
	Integer registerLoseTx(Lose lose);

	List<Lose> findList();
	Lose findLoseByLoseNo(int loseNo);
	List<LoseFile> findLoseFilesByLoseNo(int loseNo);
	
	void updateLoseUpdate(Lose lose);
	Lose loseDetail(int loseNo);
	void loseDelete(int loseNo);
	List<Lose> loseList(String string); 
		
}
