package kr.or.ddit.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.nurse.service.INurseService;
import kr.or.ddit.nurse.service.NurseServiceImpl;
import kr.or.ddit.nurse.vo.NurseVO;


@WebServlet("/Nlogin.do")
public class NurseLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/login/login4.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String uId = request.getParameter("uId");
		String uPw = request.getParameter("uPw");
		INurseService service = NurseServiceImpl.getInstance();
		
		NurseVO nv = service.getNurse(uId);
		boolean isAuthenticated = false;
		
		request.setAttribute("NUR", nv);
		if(uId.equals("uId") && uPw.equals("uPw")) {
			request.setAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}else if(uId.equals("uId") && uPw.equals("uPw")) {
			request.setAttribute("success", "로그인 성공!");
		}
		
		request.getRequestDispatcher(request.getContextPath() + "/login4.jsp");
		
		
		
		if(nv != null) {
			if(uPw.equals(nv.getNurPw())) {
				isAuthenticated = true;
			}
		}
		
		if(isAuthenticated) {
			HttpSession session = request.getSession();
			session.setAttribute("NUR", nv);
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("success");
		} else {
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("error");
		}
		
	}

}
