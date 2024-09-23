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

@WebServlet("/adNurseInsert.do")
public class AdNurseInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private INurseService nsService = NurseServiceImpl.getInstance();
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/adminMypage/AdNurseInsert.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String nsId 	= request.getParameter("ns_id");
		String nsPw 	= request.getParameter("ns_pw");
		String nsEm 	= request.getParameter("ns_em");
	    String nsName 	= request.getParameter("ns_nm");
	    String reg 		= request.getParameter("ns_reg");
	    String reg2 	= request.getParameter("ns_reg2");
	    
	    NurseVO nv = new NurseVO();
	    
	    nv.setNs_id(nsId);
	    nv.setNs_pw(nsPw);
	    nv.setNs_em(nsEm);
	    nv.setNs_nm(nsName);
	    nv.setNs_reg(reg + "-" + reg2);
	    
	    int cnt = nsService.nurseInsert(nv);
	    
	    if(cnt > 0) {
	    	response.sendRedirect(request.getContextPath()+"/adNurseList.do");
	    } else {
	    	request.getRequestDispatcher(request.getContextPath() + "/adNurseInsert.do").forward(request, response);
	    	
	    }
	    
	    
	    
	    
	}

}
