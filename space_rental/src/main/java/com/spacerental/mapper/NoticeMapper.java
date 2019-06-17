package com.spacerental.mapper;

import java.util.List;

import com.spacerental.vo.Notice;

public interface NoticeMapper {

	List<Notice> selectNoticelist();

	void noticeUpload(Notice notice);
}
