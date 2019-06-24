package com.spacerental.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spacerental.mapper.HostMapper;
import com.spacerental.mapper.LoseMapper;
import com.spacerental.mapper.RentMapper;
import com.spacerental.vo.Host;
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

	private RentMapper rentMapper;

	public RentMapper getRentMapper() {
		return rentMapper;
	}

	public void setRentMapper(RentMapper rentMapper) {
		this.rentMapper = rentMapper;
	}
	
	private HostMapper hostMapper;

	public HostMapper getHostMapper() {
		return hostMapper;
	}

	public void setHostMapper(HostMapper hostMapper) {
		this.hostMapper = hostMapper;
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
		List<Lose> finds = loseMapper.findList();
		return finds;
	}

	@Override
	public int registerlose(Lose lose) {
		loseMapper.registerlose(lose);

		return lose.getLoseNo();
	}

	@Override
	public void registerloseFile(LoseFile file) {
		loseMapper.registerloseFile(file);
	}
//	@Override
//	public void registerloseUpload2(Lose lose) {
//		loseMapper.registerloseUpload(lose);
//		
//	}
	@Override
	public List<Lose> loseList(String type) {
		List<Lose> loses = loseMapper.loseList(type);
		return loses;
	}
	@Override
	public Lose findloseByLoseNo(int loseNo) {
		Lose lose = loseMapper.selectLoseByLoseNo(loseNo);
		return lose;   
	} 
	@Override
	public List<LoseFile> selectLoseFilesByLoseNo(int loseNo) {
		List<LoseFile> loses = loseMapper.selectLoseFilesByLoseNo(loseNo);
		return loses;
	}
	@Override
	public void updateLoseUpdate(Lose lose) {
		loseMapper.updateLoseUpdate(lose);
		
	}
	@Override
	public void loseDelete(int loseNo) {
		
		loseMapper.loseFileDelete(loseNo);
		loseMapper.loseDelete(loseNo);
	}
	
	@Override
	public Lose loseDetail(int loseNo) {
		Lose lose = loseMapper.loseDetail(loseNo);
		return lose;
	}
//	@Override
//	public void registerlose2(Lose lose) {
//		loseMapper.insertLose2(lose);
//		
//	}

	@Override
	public ArrayList<Lose> searchlossList(String value) {
		List<Lose> loses = loseMapper.searchlosslist(value);
		return (ArrayList<Lose>)loses;
	}

	@Override
	public ArrayList<Host> selectHostNoById(String id) {
		ArrayList<Host> hostNos = hostMapper.selectHostById(id);
		return hostNos;
	}
	
//	@Override
//	public List<Rent> selectrentList(String id) {
//		List<Rent> rent = rentMapper.selectrentList(id);
//		return rent;
//	}


}
