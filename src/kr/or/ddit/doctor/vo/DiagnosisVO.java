package kr.or.ddit.doctor.vo;

import java.time.LocalDate;

public class DiagnosisVO {
	private int dg_no;
	private String dg_tit;
	private String dg_con;
	private LocalDate dg_dt;
	private LocalDate dg_dgdt;
	private int md_no;
	private int ds_no;
	private int cl_no;
	private int dt_no;
	private int pt_no;
	
	private String md_nm;
	private String mem_nm;
	private String mem_reg;
	
	
	public DiagnosisVO() {
	}
	
	
	
	
	public DiagnosisVO(String dg_tit, String dg_con, LocalDate dg_dt, LocalDate dg_dgdt, int md_no, int ds_no,
			int cl_no, int dt_no, int pt_no) {
		super();
		this.dg_tit = dg_tit;
		this.dg_con = dg_con;
		this.dg_dt = dg_dt;
		this.dg_dgdt = dg_dgdt;
		this.md_no = md_no;
		this.ds_no = ds_no;
		this.cl_no = cl_no;
		this.dt_no = dt_no;
		this.pt_no = pt_no;
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
	public LocalDate getDg_dt() {
		return dg_dt;
	}
	public void setDg_dt(LocalDate dg_dt) {
		this.dg_dt = dg_dt;
	}
	public LocalDate getDg_dgdt() {
		return dg_dgdt;
	}
	public void setDg_dgdt(LocalDate dg_dgdt) {
		this.dg_dgdt = dg_dgdt;
	}
	public int getMd_no() {
		return md_no;
	}
	public void setMd_no(int md_no) {
		this.md_no = md_no;
	}
	public int getDs_no() {
		return ds_no;
	}
	public void setDs_no(int ds_no) {
		this.ds_no = ds_no;
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
	public String getMd_nm() {
		return md_nm;
	}
	public void setMd_nm(String md_nm) {
		this.md_nm = md_nm;
	}
	public String getMem_nm() {
		return mem_nm;
	}
	public void setMem_nm(String mem_nm) {
		this.mem_nm = mem_nm;
	}
	public String getMem_reg() {
		return mem_reg;
	}
	public void setMem_reg(String mem_reg) {
		this.mem_reg = mem_reg;
	}
	
	
	
	
	
	
}
