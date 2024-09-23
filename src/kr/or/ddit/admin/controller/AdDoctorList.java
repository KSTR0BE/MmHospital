package kr.or.ddit.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.admin.service.AdminServiceImpl;
import kr.or.ddit.admin.service.IAdminService;
import kr.or.ddit.doctor.vo.DoctorVO;

@WebServlet("/adDoctorList.do")
public class AdDoctorList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IAdminService adService = AdminServiceImpl.getInstance();
		List<DoctorVO> dcList = adService.AdDoctorList();
		
		request.setAttribute("dcList", dcList);
		request.getRequestDispatcher("/adminMypage/AdDoctorList.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
