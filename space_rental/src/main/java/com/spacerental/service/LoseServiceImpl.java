package com.spacerental.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spacerental.repository.LoseRepository;
import com.spacerental.vo.Lose;
import com.spacerental.vo.LoseFile;

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
		List<Lose> loses = loseRepository.findList();
		return loses;
	}

	
	@Override
	public void registerLose(Lose lose) {

		loseRepository.insertLose(lose);
		
	}

	@Override
	public void registerLose2(Lose lose) {
		loseRepository.insertlose2(lose);
		
	}
	@Override
	public Lose findLoseByLoseNo(int loseNo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<LoseFile> findLoseFilesByLoseFileNo(int loseNo) {
		// TODO Auto-generated method stub
		return null;
	}
}
