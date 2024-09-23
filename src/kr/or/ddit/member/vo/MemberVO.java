package kr.or.ddit.member.vo;

public class MemberVO {
	private String mem_no; 
	private String mem_id;
	private String mem_pw;
	private String mem_em;
	private String mem_addr;
	private String mem_addr2;
	private String mem_tel;
	private String mem_nm;
	private String mem_gn;
	private String mem_reg;
	private String del_yn;
	private String mem_date;
	
	
	
	public MemberVO(String mem_nm, String mem_gn) {
		super();
		this.mem_nm = mem_nm;
		this.mem_gn = mem_gn;
	}

	public MemberVO(String mem_id, String mem_pw, String mem_nm, String mem_gn,
			String mem_em, String mem_tel, String mem_addr, String mem_addr2) 
	{
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_em = mem_em;
		this.mem_addr = mem_addr;
		this.mem_addr2 = mem_addr2;
		this.mem_tel = mem_tel;
		this.mem_nm = mem_nm;
		this.mem_gn = mem_gn;
	}

	public MemberVO() {
		
	}
	
	public MemberVO(String mem_id, String mem_pw, String mem_em, String mem_addr, String mem_addr2, String mem_tel) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_em = mem_em;
		this.mem_addr = mem_addr;
		this.mem_addr2 = mem_addr2;
		this.mem_tel = mem_tel;
	}

	public MemberVO(String mem_pw, String mem_em, String mem_addr, String mem_addr2, String mem_tel) {
		super();
		this.mem_pw = mem_pw;
		this.mem_em = mem_em;
		this.mem_addr = mem_addr;
		this.mem_addr2 = mem_addr2;
		this.mem_tel = mem_tel;
	}
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_em() {
		return mem_em;
	}
	public void setMem_em(String mem_em) {
		this.mem_em = mem_em;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_addr2() {
		return mem_addr2;
	}
	public void setMem_addr2(String mem_addr2) {
		this.mem_addr2 = mem_addr2;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_nm() {
		return mem_nm;
	}
	public void setMem_nm(String mem_nm) {
		this.mem_nm = mem_nm;
	}
	public String getMem_gn() {
		return mem_gn;
	}
	public void setMem_gn(String mem_gn) {
		this.mem_gn = mem_gn;
	}
	public String getMem_reg() {
		return mem_reg;
	}
	public void setMem_reg(String mem_reg) {
		this.mem_reg = mem_reg;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String getMem_date() {
		return mem_date;
	}
	public void setMem_date(String mem_date) {
		this.mem_date = mem_date;
	}

	public String getMemPw() {
		return mem_pw;
	}
	
	public void getMemPw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
}
