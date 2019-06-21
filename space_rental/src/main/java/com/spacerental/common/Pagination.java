package com.spacerental.common;

import lombok.Data;

@Data
public class Pagination {
	private int listSize = 6;  //초기값으로 목록개수를 10으로 셋팅
	private int rangeSize = 5;  //초기값으로 페이지범위를 10으로 셋팅(페이지네이션 몇개 나오는지)
	private int page;
	private int range;
	private int listCnt;
	private int pageCnt;
	private int startPage;
	private int endPage;
	private int startList;
	private int endList;
	private boolean prev;
	private boolean next;

	public void pageInfo(int page, int range, int listCnt) {// page : 현재 페이지, range : 현재 페이지 범위, listCnt : 게시물의 총 개수 

		this.page = page;
		this.range = range;
		this.listCnt = listCnt;

		//전체 페이지수 
		this.pageCnt = (int) Math.ceil((double)listCnt/listSize);

		//시작 페이지
		this.startPage = (range - 1) * rangeSize + 1 ;

		//끝 페이지
		this.endPage = range * rangeSize;

		//게시판 시작번호
		this.startList = (page - 1) * listSize + 1;
		
		//게시판 끝번호
		this.endList = page * listSize ;

		//이전 버튼 상태
		this.prev = range == 1 ? false : true;

		//다음 버튼 상태
		this.next = endPage > pageCnt ? false : true;

		if (this.endPage >= this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}

	}

}


