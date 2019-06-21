package com.spacerental.mapper;

import java.util.List;

import com.spacerental.vo.Lose;
import com.spacerental.vo.LoseFile;
import com.spacerental.vo.Member;
import com.spacerental.vo.Notice;

public interface LoseMapper {

	void insertLose(Lose lose);

	void insertLoseFile(LoseFile file);

	void insertLose2(Lose lose);

	List<Lose> findList();

	void registerlose(Lose lose);

	void registerloseFile(LoseFile file);

	Lose selectLoseByLoseNo(int loseNo);
	
	List<LoseFile> selectLoseFilesByLoseNo(int loseNo);

	void updateLoseUpdate(Lose lose);

	void loseDelete(int loseNo);
	
	void loseFileDelete(int loseNo);

	Lose loseDetail(int loseNo);

	List<Lose> loseList(String type);

	List<Lose> searchlosslist(String value);
}