package com.spacerental.repository;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.spacerental.common.Pagination;
import com.spacerental.mapper.HostMapper;
import com.spacerental.mapper.RentMapper;
import com.spacerental.mapper.SpaceMapper;
import com.spacerental.vo.Host;
import com.spacerental.vo.Rent;
import com.spacerental.vo.Space;
import com.spacerental.vo.SpaceFile;
import com.spacerental.vo.Review;

public class SpaceRepositoryImpl implements SpaceRepository {

	private SpaceMapper spaceMapper;

	public SpaceMapper getSpaceMapper() {
		return spaceMapper;
	}

	public void setSpaceMapper(SpaceMapper spaceMapper) {
		this.spaceMapper = spaceMapper;
	}

	private HostMapper hostMapper;

	public HostMapper getHostMapper() {
		return hostMapper;
	}

	public void setHostMapper(HostMapper hostMapper) {
		this.hostMapper = hostMapper;
	}
	
	private RentMapper rentMapper;
	

	public RentMapper getRentMapper() {
		return rentMapper;
	}

	public void setRentMapper(RentMapper rentMapper) {
		this.rentMapper = rentMapper;
	}

	@Override
	public int insertHost(Host host) {
		int newHostNo = hostMapper.insertHost(host);
		return newHostNo;
	}
	
	@Override
	public int insertHost2(Host host) {
		hostMapper.insertHost2(host);
		return host.getHostNo();
	}

	@Override
	public int insertSpace(Space space) {
		spaceMapper.insertSpace(space);
		return space.getSpaceNo();
	}

	@Override
	public void insertSpaceFile(SpaceFile file) {
		spaceMapper.insertSpaceFile(file);
	}
	
	@Override
	public int selectHostListCnt(String type) {
		HashMap<String,Object> param = new HashMap<String, Object>();
		param.put("type", type);
		int hostCnt = hostMapper.selectHostListCnt(param);
		return hostCnt;
	}

	@Override
	public List<Host> selectHost(Pagination pagination, String type) {
		HashMap<String,Object> params = new HashMap<String, Object>();
		params.put("type", type);
		//params.put("pagination", pagination);
		params.put("startList", pagination.getStartList());
		params.put("endList", pagination.getEndList());
		
		List<Host> hosts = hostMapper.selectHost(params);
		return hosts;
	}

	@Override
	public Host selectHostByHostNo(int hostNo) {
		Host host = hostMapper.selectHostByHostNo(hostNo);
		return host;
	}

	@Override
	public SpaceFile selectHostFile(int hostNo) {
		SpaceFile file = hostMapper.selectHostFile(hostNo);
		return file;
	}

	@Override
	public List<SpaceFile> selectSpaceFilesBySpaceNo(int spaceNo) {
		List<SpaceFile> files = spaceMapper.selectSpaceFilesBySpaceNo(spaceNo);
		return files;
	}

	@Override
	public List<SpaceFile> selectHostFilesByHostNo(int hostNo) {
		List<SpaceFile> hostfiles = hostMapper.selectHostFilesByHostNo(hostNo);
		return hostfiles;
	}

	@Override
	public List<Space> selectSpacesByHostNo(int hostNo) {
		List<Space> spaces = spaceMapper.selectSpacesByHostNo(hostNo);
		return spaces;
	}

	@Override
	public Space selectSpaceBySpaceNo(int spaceNo) {
		Space space = spaceMapper.selectSpaceBySpaceNo(spaceNo);
		return space;
	}

	@Override
	public ArrayList<Host> searchspaceList(String value) {
		List<Host> space = hostMapper.searchspacelist(value);
		return (ArrayList<Host>)space;
	}

	@Override
	public ArrayList<Host> searchaddList(String value) {
		List<Host> space = hostMapper.searchaddlist(value);
		return (ArrayList<Host>)space;
	}

	@Override
	public ArrayList<Host> searchPCList() {
		List<Host> space = hostMapper.searchPClist();
		return (ArrayList<Host>)space;
	}

	@Override
	public ArrayList<Host> searchBeamList() {
		List<Host> space = hostMapper.searchBeamlist();
		return (ArrayList<Host>)space;
	}

	@Override
	public ArrayList<Host> searchWifiList() {
		List<Host> space = hostMapper.searchWifilist();
		return (ArrayList<Host>)space;
	}

	@Override
	public ArrayList<Host> searchTenlessList() {
		List<Host> space = hostMapper.searchTenlesslist();
		return (ArrayList<Host>)space;
	}

	@Override
	public ArrayList<Host> searchTenmoreList() {
		List<Host> space = hostMapper.searchTenmorelist();
		return (ArrayList<Host>)space;
	}

	@Override
	public SpaceFile selectSpaceFile(int spaceNo) {
		SpaceFile file = spaceMapper.selectSpaceFile(spaceNo);
		return file;
	}
	
	@Override
	public List<Rent> selectRentsBySpaceNo(int spaceNo, Date rentDate) {
		Connection conn = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Rent> rents = new ArrayList<Rent>();
		
		try {
			//1. 드라이버 준비
			Class.forName("oracle.jdbc.OracleDriver");
			
			//2. 연결 (연결 객체 가져오기)
			conn = DriverManager.getConnection("jdbc:oracle:thin:@211.197.18.246:1551:xe","space","cloud");
	
			//3. SQL 작성 + 명령 객체 가져오기
			String sql = 
					"select rentNo, rentDate, startTime, endTime, id from rent where spaceNo = ? and rentDate = ?"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, spaceNo);
			pstmt.setDate(2, rentDate);
			rs = pstmt.executeQuery();
			while(rs.next()) {
			Rent rent = new Rent();
			rent.setRentNo(rs.getInt(1));
			rent.setRentDate(rs.getDate(2));
			rent.setStartTime(rs.getInt(3));
			rent.setEndTime(rs.getInt(4));
			rent.setId(rs.getString(5));;
			rents.add(rent);
			}
		} catch (Exception ex) { 
			ex.printStackTrace(); 
		} finally {
		try {rs.close(); } catch (Exception ex){}
		try {pstmt.close(); } catch (Exception ex){}
		try {conn.close(); } catch (Exception ex){}
		}
		System.out.println(rentDate);
		return rents;
		
//		System.out.println(spaceNo);
//		List<Rent> rents = rentMapper.selectRentsBySpaceNo(spaceNo);
//		System.out.println(rents);
//		return rents;
	}

	@Override
	public void insertReview(Review review) {
		spaceMapper.insertReview(review);
	}
	
	@Override
	public void updateReview(Review review) {
		spaceMapper.updateReview(review);
	}
	
	@Override
	public void deleteReview(int reviewNo) {
		spaceMapper.deleteReview(reviewNo);
	}

	@Override
	public ArrayList<Review> selectReviewsBySpaceNo(int spaceNo) {
		List<Review> reviews =
			spaceMapper.selectReviewsBySpaceNo(spaceNo);
		return (ArrayList<Review>)reviews;
	}
	
	@Override
	public Review selectReviewByReviewNo(int reviewNo) {
		Review review =
			spaceMapper.selectReviewByReviewNo(reviewNo);
		return review;
	}
	
	@Override
	public void updateReviewStep(Review review) {
		spaceMapper.updateReviewStep(review);
	}
	
	@Override
	public void insertComment(Review review) {
		spaceMapper.insertComment(review);
	}

}
