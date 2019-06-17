package com.spacerental.repository;

import java.util.ArrayList;

import com.spacerental.vo.Notice;

public interface NoticeRepository {
	
	ArrayList<Notice> selectNoticeList();

	void noticeUpload(Notice notice);
	

}
