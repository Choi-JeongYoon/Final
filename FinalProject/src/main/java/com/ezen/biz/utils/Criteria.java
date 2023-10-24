package com.ezen.biz.utils;

/*
 * 현재 페이지와 관련된 정보 저장
 * - 현재 페이지 번호
 * - 페이지당 게시글의 수
 * - 페이징쪽에서 다담아서 받으려고 만들어둔클래스...
 */
public class Criteria {
	// Integer: pageNum,rowsPerPage 왜 기본형이아닌 참조형으로선언했느냐???
	// 값을 전달하지 않아도 오류가 발생x : 기본값이 null 받을수 있도록 하기 위해서
	private Integer pageNum;	// 현재 페이지 번호
	private Integer rowsPerPage;	// 페이지당 게시글의 수
    // 검색어
    private String searchword;
    private String searchtype;
	
	// 생성자
	// 기본값: 페이지번호=1, 게시글의수=10
	public Criteria() {
		
		this(1, 10,"pname","");
	}		
	
	public Criteria(int pageNum, int rowsPerPage,String searchtype,String searchword) {
		this.pageNum = pageNum;
		this.rowsPerPage = rowsPerPage;
		this.searchtype=searchtype;
		this.searchword=searchword;
	}

	
	
	public String getSearchword() {
		return searchword;
	}

	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}

	public String getSearchtype() {
		return searchtype;
	}

	public void setSearchtype(String searchtype) {
		this.searchtype = searchtype;
	}

	public int getPageNum() {
		return pageNum;
	}

	// 페이지 번호는 0 이상이어야 함.
	public void setPageNum(int pageNum) {
		if (pageNum <= 0) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
	}

	public int getRowsPerPage() {
		return rowsPerPage;
	}

	// 페이지 당 게시글의 수는 5~20 사이로 한정
	public void setRowsPerPage(int rowsPerPage) {
		if (rowsPerPage <= 5) {
			this.rowsPerPage = 5;
		} else if (rowsPerPage > 20) {
			this.rowsPerPage = 20;
		} else {
			this.rowsPerPage = rowsPerPage;
		}
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", rowsPerPage=" + rowsPerPage + ", searchword=" + searchword
				+ ", searchtype=" + searchtype + "]";
	}

}
