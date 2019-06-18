package com.spacerental.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spacerental.mapper.NoticeMapper;
import com.spacerental.vo.Notice;

@Service("NoticeRepository")
public class NoticeRepositoryImpl implements NoticeRepository {
	
	
	private NoticeMapper NoticeMapper;
	public NoticeMapper getNoticeMapper() {
		return NoticeMapper;
	}
	public void setNoticeMapper(NoticeMapper noticeMapper) {
		NoticeMapper = noticeMapper;
	}

	@Override
	public ArrayList<Notice> selectNoticeList() {
		List<Notice> Notices = NoticeMapper.selectNoticelist();
		
		return (ArrayList<Notice>)Notices;
	}
	@Override
	public void noticeUpload(Notice notice) {
		NoticeMapper.noticeUpload(notice);
		
	}
	@Override
	public Notice noticeDetail(int noticeNo) {
		Notice notice = NoticeMapper.noticeDetail(noticeNo);
		return notice;
	}
	@Override
	public void noticeDelete(int noticeNo) {
		NoticeMapper.noticeDelete(noticeNo);
		
	}
	@Override
	public ArrayList<Notice> findNoticeByNoticeNo(int noticeNo) {
		List<Notice> notice = NoticeMapper.findNoticeByNoticeNo(noticeNo);
		return (ArrayList<Notice>)notice;
	}
	@Override
	public void updateNoticeUpdate(Notice notice) {
		NoticeMapper.updateNoticeUpdate(notice);
		
	}

}
