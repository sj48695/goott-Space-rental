package com.spacerental.service;

import com.spacerental.repository.RentRepository;
import com.spacerental.vo.Rent;

public class RentServiceImpl implements RentService {

	public RentRepository rentRepository;

	public RentRepository getRentRepository() {
		return rentRepository;
	}

	public void setRentRepository(RentRepository rentRepository) {
		this.rentRepository = rentRepository;
	}

	@Override
	public void registerRent(Rent rent) {
		rentRepository.insertRent(rent);
	}

}
