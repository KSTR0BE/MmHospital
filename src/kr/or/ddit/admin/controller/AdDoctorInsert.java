package kr.or.ddit.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.doctor.service.DoctorServiceImpl;
import kr.or.ddit.doctor.service.IDoctorService;
import kr.or.ddit.doctor.vo.ClassVO;
import kr.or.ddit.doctor.vo.DoctorVO;

@WebServlet("/adDoctorInsert.do")
public class AdDoctorInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IDoctorService dtService = DoctorServiceImpl.getInstance();
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ClassVO> clList = dtService.DoctorClass();
		
		request.setAttribute("clList", clList);
		request.getRequestDispatcher("/adminMypage/AdDoctorInsert.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String dtId 	= request.getParameter("dt_id");
		String dtPw 	= request.getParameter("dt_pw");
		String dtEm 	= request.getParameter("dt_em");
	    String dtName 	= request.getParameter("dt_nm");
	    String reg 		= request.getParameter("dt_reg");
	    String reg2 	= request.getParameter("dt_reg2");
	    String clNo 	= request.getParameter("cl_no"); 
	    
	    DoctorVO dtv = new DoctorVO();
	    
	    dtv.setDt_id(dtId);
	    dtv.setDt_pw(dtPw);
	    dtv.setDt_em(dtEm);
	    dtv.setDt_nm(dtName);
	    dtv.setDt_reg(reg + "-" + reg2);
	    dtv.setCl_no(Integer.parseInt(clNo));
	    
	    int cnt = dtService.InsertDoctor(dtv);
	    
	    if(cnt > 0) {
	    	response.sendRedirect(request.getContextPath()+"/adDoctorList.do");
	    } else {
	    	request.getRequestDispatcher(request.getContextPath() + "/adDoctorInsert.do").forward(request, response);
	    	
	    }
	    
	    
	    
	    
	}

}
