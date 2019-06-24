package com.spacerental.mapper;

import java.util.List;

import com.spacerental.vo.Host;
import com.spacerental.vo.Rent;
import com.spacerental.vo.Space;
import com.spacerental.vo.SpaceFile;
import com.spacerental.vo.Review;

public interface SpaceMapper {

	void insertSpace(Space space);

	void insertSpaceFile(SpaceFile file);
	
	List<Host> selectHost();
	
	List<SpaceFile> selectSpaceFilesBySpaceNo(int spaceNo);

	List<Space> selectSpacesByHostNo(int hostNo);

	Space selectSpaceBySpaceNo(int spaceNo);

	SpaceFile selectSpaceFile(int spaceNo);
	
	void insertReview(Review review);

	void updateReview(Review review);

	void deleteReview(int reviewNo);

	List<Review> selectReviewsBySpaceNo(int spaceNo);

	Review selectReviewByReviewNo(int reviewNo);

	void updateReviewStep(Review review);

	void insertComment(Review review);
	
}
