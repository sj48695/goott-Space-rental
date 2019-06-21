package com.spacerental.service;

import org.springframework.stereotype.Service;

import com.spacerental.repository.AboutUsRepository;

@Service("AboutUsService")
public class AboutUsServiceImpl implements AboutUsService {
	
	private AboutUsRepository aboutUsRepository;	
	
	public AboutUsRepository getAboutUsRepository() {
		return aboutUsRepository;
	}
	public void setAboutUsRepository(AboutUsRepository aboutUsRepository) {
		this.aboutUsRepository = aboutUsRepository;
	}
	@Override
	public int countCustomer() {
		int customerCount=aboutUsRepository.countCustomer();
		return customerCount;
	}
	@Override
	public int countHost() {
		int hostCount=aboutUsRepository.countHost();
		return hostCount;
	}
	@Override
	public int countComputer() {
		int computerCount=aboutUsRepository.countComputer();
		return computerCount;
	}
	@Override
	public int countBeam() {
		int beamCount=aboutUsRepository.countBeam();
		return beamCount;
	}
	@Override
	public int countWifi() {
		int wifiCount=aboutUsRepository.countWifi();
		return wifiCount;
	}
	@Override
	public int countTotalSpace() {
		int spaceTotal=aboutUsRepository.countTotalSpace();
		return spaceTotal;
	}
	
	
	
	
}
