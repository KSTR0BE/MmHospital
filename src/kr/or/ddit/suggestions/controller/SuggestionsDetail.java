package kr.or.ddit.suggestions.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.service.AtchFileServiceImpl;
import kr.or.ddit.comm.service.IAtchFileService;
import kr.or.ddit.comm.vo.AtchFileVO;
import kr.or.ddit.commentt.service.CommenttServiceImpl;
import kr.or.ddit.commentt.service.ICommenttService;
import kr.or.ddit.commentt.vo.CommenttVO;
import kr.or.ddit.suggestions.service.ISuggestionsService;
import kr.or.ddit.suggestions.service.SuggestionsServiceImpl;
import kr.or.ddit.suggestions.vo.SuggestionsVO;

@WebServlet("/suggestions/detail.do")
public class SuggestionsDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sgNo = request.getParameter("sgNo");
		
		ISuggestionsService sgService = SuggestionsServiceImpl.getInstance();
		ICommenttService cmService = CommenttServiceImpl.getInstance();
		
		int cnt = sgService.sgHit(sgNo);
		
		System.out.println("cnt : " + cnt);
		
		SuggestionsVO sv = sgService.sgGet(sgNo);
		CommenttVO cv = cmService.cmGet(sgNo);
		
		long atchFileId = sv.getAtchFileId();
		
		if(atchFileId > 0) {
			IAtchFileService fileService = 
					AtchFileServiceImpl.getInstance();
			
			AtchFileVO atchFileVO = new AtchFileVO();
			atchFileVO.setAtchFileId(atchFileId);
			atchFileVO = fileService.getAtchFile(atchFileVO);
			
			request.setAttribute("atchFileVO", atchFileVO);
		}
		
		request.setAttribute("sv", sv);
		request.setAttribute("cv", cv);
		
		request.getRequestDispatcher("/sub7/sgDetail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
