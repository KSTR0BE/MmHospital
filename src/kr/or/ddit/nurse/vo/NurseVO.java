package kr.or.ddit.nurse.vo;

public class NurseVO {
	private String ns_no;
	private String ns_nm;
	private String ns_em;
	private String ns_reg;
	private String ns_id;
	private String ns_pw;
	private String ns_yn;


	public NurseVO() {
		
	}

	
	public NurseVO(String ns_id, String ns_pw,  String ns_em,  String ns_nm) {
		super();
		this.ns_nm = ns_nm;
		this.ns_em = ns_em;
		this.ns_id = ns_id;
		this.ns_pw = ns_pw;
	}


	public NurseVO(String ns_id, String ns_pw,  String ns_em ) {
		super();
		this.ns_id = ns_id;
		this.ns_pw = ns_pw;
		this.ns_em = ns_em;
	}
	
	
	
	
	public String getNs_no() {
		return ns_no;
	}
	public void setNs_no(String ns_no) {
		this.ns_no = ns_no;
	}
	public String getNs_nm() {
		return ns_nm;
	}
	public void setNs_nm(String ns_nm) {
		this.ns_nm = ns_nm;
	}
	public String getNs_em() {
		return ns_em;
	}
	public void setNs_em(String ns_em) {
		this.ns_em = ns_em;
	}
	public String getNs_reg() {
		return ns_reg;
	}
	public void setNs_reg(String ns_reg) {
		this.ns_reg = ns_reg;
	}
	public String getNs_id() {
		return ns_id;
	}
	public void setNs_id(String ns_id) {
		this.ns_id = ns_id;
	}
	public String getNs_pw() {
		return ns_pw;
	}
	public void setNs_pw(String ns_pw) {
		this.ns_pw = ns_pw;
	}
	public String getNurPw() {
		return ns_pw;
	}
	public String getNs_yn() {
		return ns_yn;
	}
	public void setNs_yn(String ns_yn) {
		this.ns_yn = ns_yn;
	}

	
	
}
