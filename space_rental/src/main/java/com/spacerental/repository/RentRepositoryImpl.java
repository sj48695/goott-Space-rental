package com.spacerental.repository;

import com.spacerental.mapper.RentMapper;
import com.spacerental.vo.Rent;

public class RentRepositoryImpl implements RentRepository {

	public RentMapper rentMapper;

	public RentMapper getRentMapper() {
		return rentMapper;
	}

	public void setRentMapper(RentMapper rentMapper) {
		this.rentMapper = rentMapper;
	}

	@Override
	public void insertRent(Rent rent) {
		rentMapper.insertRent(rent);
	}

}
