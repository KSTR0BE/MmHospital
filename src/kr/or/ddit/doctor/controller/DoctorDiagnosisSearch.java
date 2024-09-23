package kr.or.ddit.doctor.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import kr.or.ddit.doctor.vo.DiagnosisVO;
import kr.or.ddit.doctor.vo.DiseaseVO;
import kr.or.ddit.doctor.vo.DoctorVO;
import kr.or.ddit.doctor.vo.MedicienVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;


@WebServlet("/DoctorDiagnosisSearch.do")
public class DoctorDiagnosisSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DoctorDiagnosisSearch() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IDoctorService docSerivce = DoctorServiceImpl.getInstance();
		List<DiseaseVO> disList = docSerivce.DiseaseMid();
		request.setAttribute("disList", disList);
		
		IDoctorService docService = DoctorServiceImpl.getInstance();
		List<MedicienVO> mediList = docService.mediList();
		request.setAttribute("mediList", mediList);
		
		request.getRequestDispatcher("/docMypage/Diagnosis.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mNm = request.getParameter("memNm");
		
		IMemberService memService = MemberServiceImpl.getInstance();
		List<MemberVO> memList = memService.memSearch(mNm);
		
		
		Gson gson = new Gson();
		String json = gson.toJson(memList);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);

		
		
	    

	}

}
