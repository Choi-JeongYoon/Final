package com.ezen.biz.utils;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

/*
 * 화면에 표시할 페이지 버튼 정보
 */
public class PageMaker {
	private Criteria criteria;	// 현재 페이지 정보
	private int totalCount;		// 조회된 전체 게시글의 수
	private int beginPage;		// 화면에 표시할 시작 페이지 번호
	private int endPage;		// 화면에 표시할 끝 페이지 번호
	private boolean prev;		// 이전 버튼 유무
	private boolean next;		// 다음 버튼 유무
	private int cntPageNum = 10;	// 한 화면에 표시할 페이지 버튼의 수
	private int realEndPage;	// 실제 끝 페이지 번호
	
	/*
	 * 생성자
	 * 페이지 및 검색조건에 해당하는 설정 값 및 전체 행의 개수 
	 */
	public PageMaker(Criteria cri,int totalCount) {
		this.criteria=cri;
		this.totalCount=totalCount;
		// 멤버변수 초기화
		fieldInit();
	}
	/*
	 * 화면에서 페이지 번호를 클릭하면, 요청하는 URL의 Query String에
	 * 페이지 번호화 페이지 당 게시글의 수를 조립하는 메소드
	 * <예>
	 * 화면 페이지 클릭: 3
	 * 결과: ?pageNum=3&searchtype=title&searchword=지구
	 */
	public String makeQuery(int page) {
		UriComponents uriComp = UriComponentsBuilder.newInstance()
				.queryParam("pageNum", page)
				.queryParam("searchtype", criteria.getSearchtype())
				.queryParam("searchword", criteria.getSearchword())
				.build();
		
		return uriComp.toString();
	}
	
	public Criteria getCriteria() {
		return criteria;
	}
	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}
	public int getTotalCount() {
		return totalCount;
	}
	
	// 전체 게시글의 수가 정해지면 다른 멤버 변수 초기화
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		// 멤버변수 초기화
		fieldInit();
	}
	
	public void fieldInit() {
		// (1) 끝 페이지 번호 계산
		// 올림(현재 페이지 번호 / 한 화면에 표시할 페이지 버튼의 수) * 한 화면에 표시할 페이지 버튼의 수
		endPage = (int)(Math.ceil(criteria.getPageNum() / (double)cntPageNum) * cntPageNum);
		
		// (2) 시작 페이지 계산
		// 끝 페이지 번호 - 한 화면에 표시할 페이지 버튼의 수 + 1
		beginPage = endPage - cntPageNum + 1;
		
		// (3) 실제 끝 페이지 번호 계산
		// 올림(전체 게시글의 수 / 페이지 당 게시글의 수)
		realEndPage = (int)(Math.ceil(totalCount / (double)criteria.getRowsPerPage()));
		
		
		// (4) 실제 끝 페이지 번호로 endPage 값 수정
		if (endPage > realEndPage)
			endPage = realEndPage;
		
		// (5) 이전, 다음 버튼 유무 표시
		prev = beginPage == 1 ? false : true;	// 시작 페이지가 1일 경우 '이전'버튼 없음
		next = endPage * criteria.getRowsPerPage() < totalCount ? true : false;
	}
	
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getCntPageNum() {
		return cntPageNum;
	}
	public void setCntPageNum(int cntPageNum) {
		this.cntPageNum = cntPageNum;
	}
	public int getRealEndPage() {
		return realEndPage;
	}
	public void setRealEndPage(int realEndPage) {
		this.realEndPage = realEndPage;
	}
	
    public boolean nextPageScore() {
    	boolean next=false;
    	int totalPage = (int)Math.ceil(totalCount/(double)criteria.getRowsPerPage());//5
        
        if(totalPage<criteria.getPageNum()+1){
            next = false;//다음페이지 보이지않도록
        }else{
            next = true;
        }
        return next;
    }
	@Override
	public String toString() {
		return "PageMaker [criteria=" + criteria + ", totalCount=" + totalCount + ", beginPage=" + beginPage
				+ ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", cntPageNum=" + cntPageNum
				+ ", realEndPage=" + realEndPage + "]";
	}
}
