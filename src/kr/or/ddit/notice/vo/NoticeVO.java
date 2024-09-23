package kr.or.ddit.notice.vo;

import java.time.LocalDate;

public class NoticeVO {
	 private String ntNo;
	 private String ntTit;
	 private LocalDate ntDt;
	 private String ntHit;
	 private String ntNm;
	 private String ntCon;
	 private String adNo;
	 private long atchFileId;
	 
	public NoticeVO() {

	 }
	
	public NoticeVO(String ntNo, String ntTit, String ntCon) {
		super();
		this.ntNo = ntNo;
		this.ntTit = ntTit;
		this.ntCon = ntCon;
	}
	
	public NoticeVO(String ntTit, String ntCon, String adNo, String ntNm) {
		super();
		this.ntTit = ntTit;
		this.ntCon = ntCon;
		this.adNo = adNo;
		this.ntNm = ntNm;
	}

	public String getNtNo() {
		return ntNo;
	}

	public void setNtNo(String ntNo) {
		this.ntNo = ntNo;
	}

	public String getNtTit() {
		return ntTit;
	}

	public void setNtTit(String ntTit) {
		this.ntTit = ntTit;
	}

	public LocalDate getNtDt() {
		return ntDt;
	}

	public void setNtDt(LocalDate ntDt) {
		this.ntDt = ntDt;
	}

	public String getNtHit() {
		return ntHit;
	}

	public void setNtHit(String ntHit) {
		this.ntHit = ntHit;
	}

	public String getNtNm() {
		return ntNm;
	}

	public void setNtNm(String ntNm) {
		this.ntNm = ntNm;
	}

	public String getNtCon() {
		return ntCon;
	}

	public void setNtCon(String ntCon) {
		this.ntCon = ntCon;
	}

	public String getAdNo() {
		return adNo;
	}

	public void setAdNo(String adNo) {
		this.adNo = adNo;
	}
	
	public long getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(long atchFileId) {
		this.atchFileId = atchFileId;
	}

}
