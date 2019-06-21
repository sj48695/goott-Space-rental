package com.spacerental.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spacerental.repository.LoseRepository;
import com.spacerental.vo.Lose;
import com.spacerental.vo.LoseFile;
import com.spacerental.vo.Member;
import com.spacerental.vo.Notice;

@Service("loseService")
public class LoseServiceImpl implements LoseService {

	private LoseRepository loseRepository;
	public LoseRepository getLoseRepository() {
		return loseRepository;
	}
	public void setLoseRepository(LoseRepository loseRepository) {
		this.loseRepository = loseRepository;
	}
///////////////////////////////////////////////////////////////////////////////////////
	@Override
	public List<Lose> findList() {
		List<Lose> finds = loseRepository.findList();
		return finds;
	}

	@Override
	public Integer registerLoseTx(Lose lose) {
		int newloseNo = loseRepository.registerlose(lose);

		for (LoseFile file : lose.getFiles()) {
			file.setLoseNo(newloseNo);
			loseRepository.registerloseFile(file);
		}
		return newloseNo;
		
	}

	
	
	 @Override 
	 public void registerLose2(Lose lose) {
		 loseRepository.registerlose2(lose); 
		 }
	 
	 
	
	@Override
	public Lose findLoseByLoseNo(int loseNo) {
		Lose finds = loseRepository.findloseByLoseNo(loseNo);
		return finds;
	}
	@Override
	public List<LoseFile> findLoseFilesByLoseNo(int loseNo) {
		List<LoseFile> files = loseRepository.selectLoseFilesByLoseNo(loseNo);
		return files;
		
	}
	@Override
	public List<Lose> loseList(String type) {

			List<Lose> loses = loseRepository.loseList(type);
			return loses;
	}
	@Override
	public void updateLoseUpdate(Lose lose) {
		loseRepository.updateLoseUpdate(lose);
		
	}
	@Override
	public void loseDelete(int loseNo) {
		loseRepository.loseDelete(loseNo);
		
	}
	@Override
	public Lose loseDetail(int loseNo) {
		Lose lose = loseRepository.loseDetail(loseNo);
		return lose;
	}
}
