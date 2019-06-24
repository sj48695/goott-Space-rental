package com.spacerental.repository;

import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

import com.spacerental.common.Pagination;
import com.spacerental.vo.Host;
import com.spacerental.vo.Rent;
import com.spacerental.vo.Space;
import com.spacerental.vo.SpaceFile;
import com.spacerental.vo.Review;

public interface SpaceRepository {

	int insertHost(Host host);
	int insertHost2(Host host);
	
	int insertSpace(Space space);

	void insertSpaceFile(SpaceFile file);
	
	int selectHostListCnt(String type);

	List<Host> selectHost(Pagination pagination, String type);

	Host selectHostByHostNo(int hostNo);

	SpaceFile selectHostFile(int hostNo);

	List<SpaceFile> selectSpaceFilesBySpaceNo(int spaceNo);

	List<SpaceFile> selectHostFilesByHostNo(int hostNo);

	List<Space> selectSpacesByHostNo(int hostNo);

	Space selectSpaceBySpaceNo(int spaceNo);

	ArrayList<Host> searchspaceList(String value);
	ArrayList<Host> searchaddList(String value);

	ArrayList<Host> searchPCList();
	ArrayList<Host> searchBeamList();
	ArrayList<Host> searchWifiList();
	ArrayList<Host> searchTenlessList();
	ArrayList<Host> searchTenmoreList();

	SpaceFile selectSpaceFile(int spaceNo);

	List<Rent> selectRentsBySpaceNo(int spaceNo, Date rentDate);
	void insertReview(Review review);
	void deleteReview(int reviewNo);
	void updateReview(Review review);
	List<Review> selectReviewsBySpaceNo(int spaceNo);
	Review selectReviewByReviewNo(int reviewNo);
	void updateReviewStep(Review parent);
	void insertComment(Review review);

}
