package kr.or.ddit.doctor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.doctor.service.DoctorServiceImpl;
import kr.or.ddit.doctor.service.IDoctorService;
import kr.or.ddit.doctor.vo.DiagnosisVO;

@WebServlet("/doctorDnList.do")
public class DoctorDnList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IDoctorService doctorService = DoctorServiceImpl.getInstance();
		List<DiagnosisVO> dnList = doctorService.doctorDnList();
		
		request.setAttribute("dnList", dnList);
		request.getRequestDispatcher("/docMypage/DocDnList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
		
		
		
		
		
	}

}
