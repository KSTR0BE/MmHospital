package kr.or.ddit.review.vo;

import java.time.LocalDate;

public class ReviewVO {
	 private String rvNo;
	 private String rvTit;
	 private String rvCon;
	 private LocalDate rvDt;
	 private String memNo;
	 private String rvNm;
	 private String rvHit;
	 private long atchFileId;
	 
	public ReviewVO() {
		
	}
	
	public ReviewVO(String rvTit, String rvCon, String rvNo) {
		super();
		this.rvTit = rvTit;
		this.rvCon = rvCon;
		this.rvNo = rvNo;
	}
	
	public ReviewVO(String rvTit, String rvCon, String memNo, String rvNm) {
		super();
		this.rvTit = rvTit;
		this.rvCon = rvCon;
		this.memNo = memNo;
		this.rvNm = rvNm;
	}
	 
	public String getRvNo() {
		return rvNo;
	}
	public void setRvNo(String rvNo) {
		this.rvNo = rvNo;
	}
	public String getRvTit() {
		return rvTit;
	}
	public void setRvTit(String rvTit) {
		this.rvTit = rvTit;
	}
	public String getRvCon() {
		return rvCon;
	}
	public void setRvCon(String rvCon) {
		this.rvCon = rvCon;
	}
	public LocalDate getRvDt() {
		return rvDt;
	}
	public void setRvDt(LocalDate rvDt) {
		this.rvDt = rvDt;
	}
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public String getRvNm() {
		return rvNm;
	}

	public void setRvNm(String rvNm) {
		this.rvNm = rvNm;
	}

	public String getRvHit() {
		return rvHit;
	}

	public void setRvHit(String rvHit) {
		this.rvHit = rvHit;
	}
	
	public long getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(long atchFileId) {
		this.atchFileId = atchFileId;
	}
	
}
