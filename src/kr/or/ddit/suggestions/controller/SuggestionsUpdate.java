package kr.or.ddit.suggestions.controller;

import java.io.IOException;
import java.util.List;

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
@WebServlet("/suggestions/update.do")
public class SuggestionsUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sgNo = request.getParameter("sgNo");
		
		ISuggestionsService sgService = SuggestionsServiceImpl.getInstance();
		
		SuggestionsVO sv = sgService.sgGet(sgNo);
		
		long atchFileId = sv.getAtchFileId();

		if (atchFileId > 0) {
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();

			AtchFileVO atchFileVO = new AtchFileVO();
			atchFileVO.setAtchFileId(atchFileId);
			atchFileVO = fileService.getAtchFile(atchFileVO);

			request.setAttribute("atchFileVO", atchFileVO);
		}
		
		request.setAttribute("sv", sv);
		
		request.getRequestDispatcher("/sub7/sgUpdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sgNo = request.getParameter("sgNo");
		String sgTit = request.getParameter("sgTit");
		String sgCon = request.getParameter("sgCon");
		
		long atchFileId = request.getParameter("atchFileId") == null ?
				-1 : Long.parseLong(request.getParameter("atchFileId"));
		
		ISuggestionsService sgService = SuggestionsServiceImpl.getInstance();
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		AtchFileVO atchFileVO = fileService.saveAtchFileList(request.getParts());
		
		SuggestionsVO sv = new SuggestionsVO(sgTit, sgCon, sgNo);
		
		if(atchFileVO == null) { // 신규 첨부파일이 존재하지 않은 경우
			// 기존첨부파일 삭제 체크되었으면
			
			sv.setAtchFileId(atchFileId);
		}else {
			sv.setAtchFileId(atchFileVO.getAtchFileId());
		}
		
		int cnt = sgService.sgUpdate(sv);
		
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
