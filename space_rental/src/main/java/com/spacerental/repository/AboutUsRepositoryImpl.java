package com.spacerental.repository;

import org.springframework.stereotype.Service;

import com.spacerental.mapper.AboutUsMapper;
import com.spacerental.vo.Member;
import com.spacerental.vo.Space;

@Service("AboutUsRepository")
public class AboutUsRepositoryImpl implements AboutUsRepository {
	
	
	private AboutUsMapper aboutUsMapper;

	public AboutUsMapper getAboutUsMapper() {
		return aboutUsMapper;
	}

	public void setAboutUsMapper(AboutUsMapper aboutUsMapper) {
		this.aboutUsMapper = aboutUsMapper;
	}

	@Override
	public int countCustomer() {
		int customerCount=aboutUsMapper.countCustomer();
		return customerCount;
	}

	@Override
	public int countHost() {
		int hostCount=aboutUsMapper.countHost();
		return hostCount;
	}

	@Override
	public int countComputer() {
		int computerCount=aboutUsMapper.countComputer();
		return computerCount;
	}

	@Override
	public int countBeam() {
		int beamCount=aboutUsMapper.countBeam();
		return beamCount;
	}

	@Override
	public int countWifi() {
		int wifiCount=aboutUsMapper.countWifi();
		return wifiCount;
	}

	@Override
	public int countTotalSpace() {
		int spaceTotal=aboutUsMapper.countTotalSpace();
		return spaceTotal;
	}
	

	
}
