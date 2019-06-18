package com.spacerental.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spacerental.repository.NoticeRepository;
import com.spacerental.vo.Notice;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService {
	
	private NoticeRepository NoticeRepository;	
	public NoticeRepository getNoticeRepository() {
		return NoticeRepository;
	}
	public void setNoticeRepository(NoticeRepository noticeRepository) {
		NoticeRepository = noticeRepository;
	}

	@Override
	public List<Notice> selectNoticelist() {
		
		ArrayList<Notice> notices = NoticeRepository.selectNoticeList();
		
		return notices;
	}
	@Override
	public void noticeUpload(Notice notice) {
		NoticeRepository.noticeUpload(notice);
		
	}
	@Override
	public Notice noticeDetail(int noticeNo) {
		Notice notice = NoticeRepository.noticeDetail(noticeNo);
		return notice;
	}
	@Override
	public void noticeDelete(int noticeNo) {
		NoticeRepository.noticeDelete(noticeNo);
		
	}
	@Override
	public List<Notice> findNoticeByNoticeNo(int noticeNo) {
		
		ArrayList<Notice> notice = NoticeRepository.findNoticeByNoticeNo(noticeNo);
		return notice;
	}
	@Override
	public void updateNoticeUpdate(Notice notice) {
		NoticeRepository.updateNoticeUpdate(notice);
		
	}

	
}

