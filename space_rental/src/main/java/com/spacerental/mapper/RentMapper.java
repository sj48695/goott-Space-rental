package com.spacerental.mapper;

import java.util.List;

import com.spacerental.vo.Rent;

public interface RentMapper {

	void insertRent(Rent rent);
	
	List<Rent> selectrentList(String id);

	List<Rent> selectHostRentList(int hostNo);

	List<Rent> selectRentsBySpaceNo(int spaceNo);

	void cancelRent(Rent rent);

}
