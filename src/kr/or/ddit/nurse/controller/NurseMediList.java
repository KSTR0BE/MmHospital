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
import kr.or.ddit.nurse.vo.NurseMediListVO;

@WebServlet("/nurseMediList.do")
public class NurseMediList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		INurseService service = NurseServiceImpl.getInstance();
		List<NurseMediListVO> medList = service.NurseMedList();
		
		
		
		request.setAttribute("medList", medList);
		request.getRequestDispatcher("/nurseMypage/NurMediList.jsp").forward(request, response);
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
