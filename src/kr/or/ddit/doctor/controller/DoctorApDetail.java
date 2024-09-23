package kr.or.ddit.doctor.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.appointMent.vo.AppointMentVO;
import kr.or.ddit.doctor.service.DoctorServiceImpl;
import kr.or.ddit.doctor.service.IDoctorService;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/doctorApDetail.do")
public class DoctorApDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String apNo = request.getParameter("apNo");
		IDoctorService dtService = DoctorServiceImpl.getInstance();
		AppointMentVO apVO = dtService.doctorApDetail(apNo);
		
		request.setAttribute("apVO", apVO);
		request.getRequestDispatcher("/docMypage/DocApDetail.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
