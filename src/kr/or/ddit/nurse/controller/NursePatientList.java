package kr.or.ddit.nurse.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.nurse.service.INurseService;
import kr.or.ddit.nurse.service.NurseServiceImpl;
import kr.or.ddit.nurse.vo.NurMemberAdListVO;

@WebServlet("/patList.do")
public class NursePatientList extends HttpServlet {
	// 입원환자 목록 서블릿입니다.
	private static final long serialVersionUID = 1L;
       

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		INurseService nurService = NurseServiceImpl.getInstance();
		List<NurMemberAdListVO> memList = nurService.NursePatientList();
		
		request.setAttribute("memList", memList);
		request.getRequestDispatcher("/nurseMypage/NurPatientList.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
