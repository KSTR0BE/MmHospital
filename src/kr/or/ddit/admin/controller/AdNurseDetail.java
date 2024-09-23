package kr.or.ddit.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.nurse.service.INurseService;
import kr.or.ddit.nurse.service.NurseServiceImpl;
import kr.or.ddit.nurse.vo.NurseVO;

@WebServlet("/adNurseDetail.do")
public class AdNurseDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nsNo = request.getParameter("nsNo");
		INurseService nsService = NurseServiceImpl.getInstance();
		NurseVO nsVO = nsService.nurseDetail(nsNo);
		
		request.setAttribute("nsVO", nsVO);
		request.getRequestDispatcher("/adminMypage/AdNurseDetail.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
