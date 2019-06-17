package com.spacerental.service;

import java.util.List;

import com.spacerental.vo.Notice;

public interface NoticeService {

	List<Notice> selectNoticelist();
	void noticeUpload(Notice notice);
}
