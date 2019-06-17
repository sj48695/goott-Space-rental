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

}
