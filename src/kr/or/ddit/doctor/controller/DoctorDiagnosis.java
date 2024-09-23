package kr.or.ddit.doctor.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.doctor.dao.DoctorDaoImpl;
import kr.or.ddit.doctor.service.DoctorServiceImpl;
import kr.or.ddit.doctor.service.IDoctorService;
import kr.or.ddit.doctor.vo.DiagnosisInsertVO;
import kr.or.ddit.doctor.vo.DiagnosisVO;
import kr.or.ddit.doctor.vo.DiseaseVO;
import kr.or.ddit.doctor.vo.DoctorVO;
import kr.or.ddit.doctor.vo.MedicienVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.nurse.vo.NurseVO;


@WebServlet("/DoctorDiagnosis.do")
public class DoctorDiagnosis extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DoctorDiagnosis() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IDoctorService docService = DoctorServiceImpl.getInstance();
		List<DiseaseVO> disList = docService.DiseaseMid();
		request.setAttribute("disList", disList);
		
		List<MedicienVO> mediList = docService.mediList();
		request.setAttribute("mediList", mediList);
		
		List<NurseVO> nurseList = docService.nurseList();
		request.setAttribute("nurseList", nurseList);
		request.getRequestDispatcher("/docMypage/Diagnosis.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mNm = request.getParameter("memNm");
		
		IMemberService memService = MemberServiceImpl.getInstance();
		List<MemberVO> memList = memService.memSearch(mNm);
		IDoctorService docService = DoctorServiceImpl.getInstance();
		
		Gson gson = new Gson();
		String json = gson.toJson(memList);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json); //DoctorDiagnosissearch로 옮김

		
		
		String dg_con = request.getParameter("write"); //진료 내용
		int md_no = Integer.parseInt(request.getParameter("medi")); // 약 번호
		int cl_no = Integer.parseInt(request.getParameter("clno")); // 과목 번호
		int dt_no = Integer.parseInt(request.getParameter("dtno")); //의사 번호
		int pt_no = Integer.parseInt(request.getParameter("memNumber")); //환자 차트번호
		int mem_no = Integer.parseInt(request.getParameter("memNumber")); //회원 번호
		String dg_dt = request.getParameter("date1"); // 진료 날짜
		String dg_st = request.getParameter("date2"); //발병 일자
		String ds_co = request.getParameter("min");  //병 번호
		String dg_tit = dg_con.substring(0, 10);
		int ns_no = Integer.parseInt(request.getParameter("ns_no")); //간호사 번호
		int am_no = Integer.parseInt(request.getParameter("am_no")); //입원 호실
		String pt_lv =request.getParameter("pt_nv"); //퇴원날짜
		DiagnosisInsertVO dv = new DiagnosisInsertVO(dg_tit, dg_con, dg_dt, md_no, cl_no, dt_no, pt_no, mem_no, dg_st, ds_co, ns_no, am_no, pt_lv);
		
		
		System.out.println("dg_tit->"+dg_tit);
		System.out.println("dg_con->"+dg_con);
		System.out.println("dg_dt->"+dg_dt);
		System.out.println("md_no->"+md_no);
		System.out.println("cl_no->"+cl_no);
		System.out.println("dt_no->"+dt_no);
		System.out.println("pt_no->"+pt_no);
		System.out.println("mem_no->"+mem_no);
		System.out.println("dg_st->"+dg_st);
		System.out.println("ds_co->"+ds_co);
		System.out.println("ns_no->"+ns_no);
		System.out.println("am_no->"+am_no);
		System.out.println("pt_lv->"+pt_lv);

	    String msg = "";
	    
		int cnt1 = docService.insertPatient(dv);
		int cnt = docService.insertDiagnosis(dv);
		int cnt2 = docService.insertAdmission(dv);
	    System.out.println("patient : " + cnt1);
	    System.out.println("diagnosis : " + cnt);
	    System.out.println("Admission : " + cnt2);
	    
	    int cnt3 = cnt1+cnt+cnt2;
	    
	    if(cnt3 == 3) {
	    	
	    	msg = "Y";
	    }else {
	    	msg = "N";
	    }
	    
	    request.getSession().setAttribute("msg", msg);
	    System.out.println(msg);
	}

}
