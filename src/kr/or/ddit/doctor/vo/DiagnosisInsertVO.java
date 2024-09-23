package kr.or.ddit.doctor.vo;

public class DiagnosisInsertVO {
	 private int dg_no;
	 private String dg_tit;
	 private String dg_con;
	 private String dg_dt;
	 private int md_no;
	 private int cl_no;
	 private int dt_no;
	 private int pt_no;
	 private int mem_no;
	 private String dg_st;
	 private String ds_co;
	 
	 
	 private int ns_no;
	 private int am_no;
	 String pt_lv;
	 
	 
	 
	public int getNs_no() {
		return ns_no;
	}
	public void setNs_no(int ns_no) {
		this.ns_no = ns_no;
	}
	public int getAm_no() {
		return am_no;
	}
	public void setAm_no(int am_no) {
		this.am_no = am_no;
	}
	public String getPt_nv() {
		return pt_lv;
	}
	public void setPt_nv(String pt_lv) {
		this.pt_lv = pt_lv;
	}
	public int getDg_no() {
		return dg_no;
	}
	public void setDg_no(int dg_no) {
		this.dg_no = dg_no;
	}
	public String getDg_tit() {
		return dg_tit;
	}
	public void setDg_tit(String dg_tit) {
		this.dg_tit = dg_tit;
	}
	public String getDg_con() {
		return dg_con;
	}
	public void setDg_con(String dg_con) {
		this.dg_con = dg_con;
	}
	public String getDg_dt() {
		return dg_dt;
	}
	public void setDg_dt(String dg_dt) {
		this.dg_dt = dg_dt;
	}
	public int getMd_no() {
		return md_no;
	}
	public void setMd_no(int md_no) {
		this.md_no = md_no;
	}
	public int getCl_no() {
		return cl_no;
	}
	public void setCl_no(int cl_no) {
		this.cl_no = cl_no;
	}
	public int getDt_no() {
		return dt_no;
	}
	public void setDt_no(int dt_no) {
		this.dt_no = dt_no;
	}
	public int getPt_no() {
		return pt_no;
	}
	public void setPt_no(int pt_no) {
		this.pt_no = pt_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getDg_st() {
		return dg_st;
	}
	public void setDg_st(String dg_st) {
		this.dg_st = dg_st;
	}
	public String getDs_co() {
		return ds_co;
	}
	public void setDs_co(String ds_co) {
		this.ds_co = ds_co;
	}
	public DiagnosisInsertVO(String dg_tit, String dg_con, String dg_dt, int md_no, int cl_no, int dt_no,
			int pt_no, int mem_no, String dg_st, String ds_co, int ns_no, int am_no, String pt_lv) {
		super();
		
		this.dg_tit = dg_tit;
		this.dg_con = dg_con;
		this.dg_dt = dg_dt;
		this.md_no = md_no;
		this.cl_no = cl_no;
		this.dt_no = dt_no;
		this.pt_no = pt_no;
		this.mem_no = mem_no;
		this.dg_st = dg_st;
		this.ds_co = ds_co;
		this.ns_no = ns_no;
		this.am_no = am_no;
		this.pt_lv = pt_lv;
	}

	 
	 
	 
	 
}
