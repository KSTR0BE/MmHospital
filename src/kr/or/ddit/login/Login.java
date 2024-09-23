package kr.or.ddit.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.admin.service.AdminServiceImpl;
import kr.or.ddit.admin.service.IAdminService;
import kr.or.ddit.admin.vo.AdminVO;



@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/login/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 로그인
		String adId = request.getParameter("memId");
		String adPw = request.getParameter("memPw");
		
		IAdminService adService = AdminServiceImpl.getInstance();

		AdminVO av = adService.adGet(adId);

		boolean isAuthenticated = false;
		
		if(av != null) {
			if(adPw.equals(av.getAdPw())) {
				isAuthenticated = true;
			}
		}
		
		String msg = "";
		
		if(isAuthenticated) {
			request.getSession().setAttribute("USER", av);
//			request.getSession().setAttribute("flag", "admin");
			
			response.sendRedirect(request.getContextPath() + "/home.do");
		}else {
			response.sendRedirect(request.getContextPath() + "/login.do");
			
			msg = "실패";
		}
		request.getSession().setAttribute("msg", msg);
		
		
		
	}

}
