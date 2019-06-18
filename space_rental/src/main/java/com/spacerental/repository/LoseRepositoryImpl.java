package com.spacerental.repository;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spacerental.mapper.LoseMapper;
import com.spacerental.vo.Lose;
import com.spacerental.vo.LoseFile;

@Service("loseRepository")
public class LoseRepositoryImpl implements LoseRepository {
	
	private LoseMapper loseMapper;
	public LoseMapper getLoseMapper() {
		return loseMapper;
	}
	public void setLoseMapper(LoseMapper loseMapper) {
		this.loseMapper = loseMapper;
	}
	@Override
	public void insertLose(Lose lose) {
		loseMapper.insertLose(lose);
	}
	@Override
	public void insertLoseFile(LoseFile file) {
		loseMapper.insertLoseFile(file);
	}

	@Override
	public void insertlose2(Lose lose) {
		loseMapper.insertLose2(lose);
		
	}

	@Override
	public List<Lose> findList() {
		List<Lose> loses = loseMapper.findList();
		System.out.println(loses);
		return loses;
	}
}
