package com.spacerental.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.spacerental.common.Pagination;
import com.spacerental.repository.SpaceRepository;
import com.spacerental.vo.Host;
import com.spacerental.vo.Rent;
import com.spacerental.vo.Space;
import com.spacerental.vo.SpaceFile;
import com.spacerental.vo.Review;

public class SpaceServiceImpl implements SpaceService {

	private SpaceRepository spaceRepository;

	public SpaceRepository getSpaceRepository() {
		return spaceRepository;
	}

	public void setSpaceRepository(SpaceRepository spaceRepository) {
		this.spaceRepository = spaceRepository;
	}

	@Override
	public Integer registerSpaceTx(Space space) {
System.out.println(space);
		int newSpaceNo = spaceRepository.insertSpace(space);
		System.out.println(space);
		
//		대표이미지
		SpaceFile titleFile = space.getFile();
		titleFile.setSpaceNo(newSpaceNo);
		spaceRepository.insertSpaceFile(titleFile);
		//System.out.println(titleFile);
		
		insertSpaceFiles(space, newSpaceNo);
		
		return newSpaceNo;
	}
	
	@Override
	public void insertSpaceFiles(Space space, int spaceNo) {

//		이미지
		for (SpaceFile file : space.getFiles()) {
			file.setSpaceNo(spaceNo);
			System.out.println(file);
			spaceRepository.insertSpaceFile(file);
			System.out.println(file);
		}
	}
	
	@Override
	public Integer registerHostTx(Host host) {
		int newHostNo = spaceRepository.insertHost2(host);
		return newHostNo;
	}
	
	@Override
	public int findHostListCnt(String type) {
		int hostCnt = spaceRepository.selectHostListCnt(type);
		return hostCnt;
	}


	@Override
	public List<Host> findHostList(Pagination pagination, String type) {
		
		List<Host> hosts = spaceRepository.selectHost(pagination, type);
		
		return hosts;
	}

	@Override
	public List<SpaceFile> findHostFilesByHostNo(int hostNo) {
		List<SpaceFile> hostfiles = spaceRepository.selectHostFilesByHostNo(hostNo);
		return hostfiles;
	}

	@Override
	public List<SpaceFile> findSpaceFilesBySpaceNo(int spaceNo) {
		List<SpaceFile> files = spaceRepository.selectSpaceFilesBySpaceNo(spaceNo);
		return files;
	}

	@Override
	public List<Space> findSpacesByHostNo(int hostNo) {
		List<Space> spaces = spaceRepository.selectSpacesByHostNo(hostNo);
		return spaces;
	}

	@Override
	public Host findHostByHostNo(int hostNo) {
		Host host = spaceRepository.selectHostByHostNo(hostNo);
		return host;
	}

	@Override
	public Space findSpaceBySpaceNo(int spaceNo) {
		Space space = spaceRepository.selectSpaceBySpaceNo(spaceNo);
		return space;
	}

	@Override
	public List<Host> searchspacelist(String value) {
		ArrayList<Host> space = spaceRepository.searchspaceList(value);
		return space;
	}

	@Override
	public List<Host> searchaddlist(String value) {
		ArrayList<Host> space = spaceRepository.searchaddList(value);
		return space;
	}

	@Override
	public List<Host> computerlist() {
		ArrayList<Host> space = spaceRepository.searchPCList();
		return space;
	}

	@Override
	public List<Host> beamprojectlist() {
		ArrayList<Host> space = spaceRepository.searchBeamList();
		return space;
	}

	@Override
	public List<Host> wifilist() {
		ArrayList<Host> space = spaceRepository.searchWifiList();
		return space;
	}

	@Override
	public List<Host> tenlesslist() {
		ArrayList<Host> space = spaceRepository.searchTenlessList();
		return space;
	}

	@Override
	public List<Host> tenmore() {
		ArrayList<Host> space = spaceRepository.searchTenmoreList();
		return space;
	}
	
	public SpaceFile findHostFile(int hostNo) {
		SpaceFile file = spaceRepository.selectHostFile(hostNo);
		return file;
	}

	@Override
	public SpaceFile findSpaceFile(int spaceNo) {
		SpaceFile file = spaceRepository.selectSpaceFile(spaceNo);
		return file;

	}
	
	@Override
	public SpaceFile findSpaceFileBySpaceFileNo(int spaceFileNo) {
		SpaceFile file = spaceRepository.selectSpaceFileBySpaceFileNo(spaceFileNo);
		return file;
	}

	@Override
	public ArrayList<Rent> findRentsBySpaceNo(int spaceNo, Date rentDate) {
		List<Rent> rents = spaceRepository.selectRentsBySpaceNo(spaceNo, rentDate);
		return (ArrayList<Rent>) rents;
	}

	@Override
	public void writeReview(Review review) {
		spaceRepository.insertReview(review);
	}

	@Override
	public void deleteReview(int reviewNo) {
		spaceRepository.deleteReview(reviewNo);
	}

	@Override
	public void updateReview(Review review) {
		spaceRepository.updateReview(review);		
	}

	@Override
	public List<Review> findReviewListBySpaceNo(int spaceNo) {
		List<Review> reviews = spaceRepository.selectReviewsBySpaceNo(spaceNo);
		return reviews;
	}
	@Override
	public void writeComment(Review review) {		
		
		Review parent = spaceRepository.selectReviewByReviewNo(review.getReviewNo());
		spaceRepository.updateReviewStep(parent);
		
		review.setGroupNo(parent.getGroupNo());
		review.setDepth(parent.getDepth() + 1);
		review.setStep(parent.getStep() + 1);		
		
		spaceRepository.insertComment(review);
	}

	@Override
	public void updateHost(Host host) {
		spaceRepository.updateHost(host);
		
	}

	@Override
	public void updateSpace(Space space) {
		spaceRepository.updateSpace(space);
		
	}

	@Override
	public void updateSpaceFile(SpaceFile file) {
		spaceRepository.updateSpaceFile(file);
		
	}

	@Override
	public void deleteSpace(int spaceNo) {
		spaceRepository.deleteSpace(spaceNo);
		
	}

	@Override
	public void deleteHost(int hostNo) {
		spaceRepository.deleteHost(hostNo);
		
	}

	@Override
	public void deleteSpaceFile(int spaceFileNo) {
		spaceRepository.deleteSpaceFile(spaceFileNo);
		
	}

}
