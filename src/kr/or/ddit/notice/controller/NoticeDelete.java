package kr.or.ddit.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;

@WebServlet("/notice/delete.do")
public class NoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ntNo = request.getParameter("ntNo");
		
		INoticeService ntService = NoticeServiceImpl.getInstance();
		
		int cnt = ntService.ntDelete(ntNo);
		
		System.out.println("cnt : " + cnt);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		request.getSession().setAttribute("msg", msg);
		
		response.sendRedirect(request.getContextPath() + "/notice.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
	}

}
