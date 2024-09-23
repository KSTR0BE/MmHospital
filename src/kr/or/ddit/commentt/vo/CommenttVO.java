package kr.or.ddit.commentt.vo;

import java.time.LocalDate;

public class CommenttVO {
	private String cmNo;
	private String cmCon;
	private LocalDate cmDt;
	private String sgNo;
	
	public CommenttVO() {
		
	}
	
	public CommenttVO(String cmCon, String sgNo) {
		super();
		this.cmCon = cmCon;
		this.sgNo = sgNo;
	}

	public String getCmNo() {
		return cmNo;
	}

	public void setCmNo(String cmNo) {
		this.cmNo = cmNo;
	}

	public String getCmCon() {
		return cmCon;
	}

	public void setCmCon(String cmCon) {
		this.cmCon = cmCon;
	}

	public LocalDate getCmDt() {
		return cmDt;
	}

	public void setCmDt(LocalDate cmDt) {
		this.cmDt = cmDt;
	}

	public String getSgNo() {
		return sgNo;
	}

	public void setSgNo(String sgNo) {
		this.sgNo = sgNo;
	}
	
}
