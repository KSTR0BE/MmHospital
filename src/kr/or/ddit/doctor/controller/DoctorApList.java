package kr.or.ddit.doctor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.appointMent.vo.AppointMentVO;
import kr.or.ddit.doctor.service.DoctorServiceImpl;
import kr.or.ddit.doctor.service.IDoctorService;
import kr.or.ddit.doctor.vo.AdmissionVO;
import kr.or.ddit.doctor.vo.DoctorVO;

@WebServlet("/doctorApList.do")
public class DoctorApList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		DoctorVO doctorVO = (DoctorVO)session.getAttribute("DOC");
		String apNo = doctorVO.getDt_no();
		IDoctorService doctorService = DoctorServiceImpl.getInstance();
		List<AppointMentVO> apList = doctorService.doctorApList(apNo);
		
		request.setAttribute("apList", apList);
		request.getRequestDispatcher("/docMypage/DocApList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String docno = request.getParameter("docno");
		
		
		
		
		
		
	}

}
