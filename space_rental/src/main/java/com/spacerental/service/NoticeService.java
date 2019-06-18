package com.spacerental.service;

import java.util.List;

import com.spacerental.vo.Notice;

public interface NoticeService {

	List<Notice> selectNoticelist();
	void noticeUpload(Notice notice);
	Notice noticeDetail(int noticeNo);
	void noticeDelete(int noticeNo);
	List<Notice> findNoticeByNoticeNo(int noticeNo);
	void updateNoticeUpdate(Notice notice);
}
