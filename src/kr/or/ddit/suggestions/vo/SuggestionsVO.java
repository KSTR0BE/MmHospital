package kr.or.ddit.suggestions.vo;

import java.time.LocalDate;

public class SuggestionsVO {
	 private String sgNo;
	 private String sgTit;
	 private String sgCon;
	 private LocalDate sgDt;
	 private String memNo;
	 private String sgNm;
	 private String sgHit;
	 private String dtNo;
	 private long atchFileId;
	 
	public SuggestionsVO() {
		
	}
	
	public SuggestionsVO(String sgTit, String sgCon, String sgNo) {
		super();
		this.sgTit = sgTit;
		this.sgCon = sgCon;
		this.sgNo = sgNo;
	}
	
	public SuggestionsVO(String sgTit, String sgCon, String memNo, String sgNm) {
		super();
		this.sgTit = sgTit;
		this.sgCon = sgCon;
		this.memNo = memNo;
		this.sgNm = sgNm;
	}
	
	public void SuggestionsVO1(String sgTit, String sgCon, String dtNo, String sgNm) {
		this.sgTit = sgTit;
		this.sgCon = sgCon;
		this.dtNo = dtNo;
		this.sgNm = sgNm;
	}

	public String getSgNo() {
		return sgNo;
	}

	public void setSgNo(String sgNo) {
		this.sgNo = sgNo;
	}

	public String getSgTit() {
		return sgTit;
	}

	public void setSgTit(String sgTit) {
		this.sgTit = sgTit;
	}

	public String getSgCon() {
		return sgCon;
	}

	public void setSgCon(String sgCon) {
		this.sgCon = sgCon;
	}

	public LocalDate getSgDt() {
		return sgDt;
	}

	public void setSgDt(LocalDate sgDt) {
		this.sgDt = sgDt;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getSgNm() {
		return sgNm;
	}

	public void setSgNm(String sgNm) {
		this.sgNm = sgNm;
	}

	public String getSgHit() {
		return sgHit;
	}

	public void setSgHit(String sgHit) {
		this.sgHit = sgHit;
	}

	public String getDtNo() {
		return dtNo;
	}

	public void setDtNo(String dtNo) {
		this.dtNo = dtNo;
	}
	
	public long getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(long atchFileId) {
		this.atchFileId = atchFileId;
	}
	
}
