package kr.or.ddit.appointMent.vo;

public class AppointMentVO {
	
	private int apNo;
	private String apDt;
	private String apYn;
	private int memNo;
	private int dtNo;
	private String apTm;
	private String memNm;
	private String amRn;
	private String dtNm;
	private String clNm;
	
	public AppointMentVO() {
		
	}
	
	public AppointMentVO(String apDt, int memNo, int dtNo, String apTm) {
		super();
		this.apDt = apDt;
		this.memNo = memNo;
		this.dtNo = dtNo;
		this.apTm = apTm;
	}
	
	public AppointMentVO(String apDt, String apTm, int dtNo) {
		super();
		this.apDt = apDt;
		this.apTm = apTm;
		this.dtNo = dtNo;
	}
	public AppointMentVO(int memNo) {
		super();
		this.memNo = memNo;
	}

	public int getApNo() {
		return apNo;
	}

	public void setApNo(int apNo) {
		this.apNo = apNo;
	}

	public String getApDt() {
		return apDt;
	}

	public void setApDt(String apDt) {
		this.apDt = apDt;
	}

	public String getApYn() {
		return apYn;
	}

	public void setApYn(String apYn) {
		this.apYn = apYn;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getDtNo() {
		return dtNo;
	}

	public void setDtNo(int dtNo) {
		this.dtNo = dtNo;
	}

	public String getApTm() {
		return apTm;
	}

	public void setApTm(String apTm) {
		this.apTm = apTm;
	}

	public String getMemNm() {
		return memNm;
	}

	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}

	public String getAmRn() {
		return amRn;
	}

	public void setAmRn(String amRn) {
		this.amRn = amRn;
	}

	public String getDtNm() {
		return dtNm;
	}

	public void setDtNm(String dtNm) {
		this.dtNm = dtNm;
	}

	public String getClNm() {
		return clNm;
	}

	public void setClNm(String clNm) {
		this.clNm = clNm;
	}
	
	
	
	
}
