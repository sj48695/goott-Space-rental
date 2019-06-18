package com.spacerental.mapper;

import java.util.List;

import com.spacerental.vo.Notice;

public interface NoticeMapper {

	List<Notice> selectNoticelist();

	void noticeUpload(Notice notice);

	Notice noticeDetail(int noticeNo);

	void noticeDelete(int noticeNo);
	
	List<Notice> findNoticeByNoticeNo(int noticeNo);

	void updateNoticeUpdate(Notice notice);
}
