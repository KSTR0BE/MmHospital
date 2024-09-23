package kr.or.ddit.member.vo;

import java.time.LocalDate;

public class PatientListVO {
// 입퇴원내역 vo
	private String dg_tit;
	private LocalDate pt_et;
	private LocalDate pt_lv;
	private String dt_nm;
	private String cl_nm;
	private String pt_dyn;
	private String mem_no;
	
	
	
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public String getPt_dyn() {
		return pt_dyn;
	}
	public void setPt_dyn(String pt_dyn) {
		this.pt_dyn = pt_dyn;
	}
	public String getDg_tit() {
		return dg_tit;
	}
	public void setDg_tit(String dg_tit) {
		this.dg_tit = dg_tit;
	}
	public LocalDate getPt_et() {
		return pt_et;
	}
	public void setPt_et(LocalDate pt_et) {
		this.pt_et = pt_et;
	}
	public LocalDate getPt_lv() {
		return pt_lv;
	}
	public void setPt_lv(LocalDate pt_lv) {
		this.pt_lv = pt_lv;
	}
	public String getDt_nm() {
		return dt_nm;
	}
	public void setDt_nm(String dt_nm) {
		this.dt_nm = dt_nm;
	}
	public String getCl_nm() {
		return cl_nm;
	}
	public void setCl_nm(String cl_nm) {
		this.cl_nm = cl_nm;
	}
	
	
	
	
}
