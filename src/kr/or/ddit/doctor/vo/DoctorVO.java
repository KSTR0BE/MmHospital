package kr.or.ddit.doctor.vo;

public class DoctorVO {
	private String dt_no;
	private String dt_nm;
	private String dt_em;
	private String dt_reg;
	private String dt_id;
	private String dt_pw;
	private int cl_no;
	private String dt_yn;
	
	private String cl_nm;
	

	public DoctorVO() {
		
	}
	
	
	
	public DoctorVO(String dt_id, String dt_pw, String dt_nm, String dt_em ) {
		super();
		this.dt_nm = dt_nm;
		this.dt_em = dt_em;
		this.dt_id = dt_id;
		this.dt_pw = dt_pw;
	}



	public DoctorVO(String dt_id, String dt_pw, String dt_em) {
		
		super();
		this.dt_id = dt_id;
		this.dt_pw = dt_pw;
		this.dt_em = dt_em;
	}

	public String getDt_no() {
		return dt_no;
	}
	public void setDt_no(String dt_no) {
		this.dt_no = dt_no;
	}
	public String getDt_nm() {
		return dt_nm;
	}
	public void setDt_nm(String dt_nm) {
		this.dt_nm = dt_nm;
	}
	public String getDt_em() {
		return dt_em;
	}
	public void setDt_em(String dt_em) {
		this.dt_em = dt_em;
	}
	public String getDt_reg() {
		return dt_reg;
	}
	public void setDt_reg(String dt_reg) {
		this.dt_reg = dt_reg;
	}
	public String getDt_id() {
		return dt_id;
	}
	public void setDt_id(String dt_id) {
		this.dt_id = dt_id;
	}
	public String getDt_pw() {
		return dt_pw;
	}
	public void setDt_pw(String dt_pw) {
		this.dt_pw = dt_pw;
	}
	public int getCl_no() {
		return cl_no;
	}
	public void setCl_no(int cl_no) {
		this.cl_no = cl_no;
	}
	public Object getDocPW() {
		return dt_pw;
	}
	public String getDt_yn() {
		return dt_yn;
	}
	public void setDt_yn(String dt_yn) {
		this.dt_yn = dt_yn;
	}


	public String getCl_nm() {
		return cl_nm;
	}
	public void setCl_nm(String cl_nm) {
		this.cl_nm = cl_nm;
	}
	
	
}
