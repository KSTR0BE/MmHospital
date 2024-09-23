package kr.or.ddit.suggestions.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.service.AtchFileServiceImpl;
import kr.or.ddit.comm.service.IAtchFileService;
import kr.or.ddit.comm.vo.AtchFileVO;
import kr.or.ddit.suggestions.service.ISuggestionsService;
import kr.or.ddit.suggestions.service.SuggestionsServiceImpl;
import kr.or.ddit.suggestions.vo.SuggestionsVO;

@MultipartConfig
@WebServlet("/suggestions/insert.do")
public class SuggestionsInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/sub7/sgInsert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memNo = request.getParameter("memNo");
		String sgNm = request.getParameter("sgNm");
		String sgTit = request.getParameter("sgTit");
		String sgCon = request.getParameter("sgCon");
		
		ISuggestionsService sgService = SuggestionsServiceImpl.getInstance();
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		AtchFileVO atchFileVO = fileService.saveAtchFileList(request.getParts());
		
		SuggestionsVO sv = new SuggestionsVO(sgTit, sgCon, memNo, sgNm);
		
		if(atchFileVO != null) {
			sv.setAtchFileId(atchFileVO.getAtchFileId());
		}
		
		int cnt = sgService.sgInsert(sv);
		
		System.out.println("cnt : " + cnt);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		request.getSession().setAttribute("msg", msg);
		
		response.sendRedirect(request.getContextPath() + "/suggestions.do");
	}

}
