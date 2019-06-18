package com.spacerental.repository;

import java.util.ArrayList;
import java.util.List;

import com.spacerental.vo.Notice;

public interface NoticeRepository {
	
	ArrayList<Notice> selectNoticeList();

	void noticeUpload(Notice notice);

	Notice noticeDetail(int noticeNo);

	void noticeDelete(int noticeNo);

	ArrayList<Notice> findNoticeByNoticeNo(int noticeNo);

	void updateNoticeUpdate(Notice notice);
	

}
