package kr.or.ddit.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.doctor.service.DoctorServiceImpl;
import kr.or.ddit.doctor.service.IDoctorService;
import kr.or.ddit.doctor.vo.DoctorVO;

@WebServlet("/Dlogin.do")
public class DoctorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/login/login3.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uId = request.getParameter("uId");
		String uPw = request.getParameter("uPw");
		IDoctorService service = DoctorServiceImpl.getInstance();
		
		System.out.println(uId + uPw);
		
		DoctorVO dv = service.getDoctor(uId); 
		
		boolean isAuthenticated = false;
		
		request.setAttribute("DOC", dv);
		
		
		if(uId.equals("uId") && uPw.equals("uPw")) {
			request.setAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
			request.getRequestDispatcher(request.getContextPath()+"/Dlogin.do").forward(request, response);
		} else if(uId.equals("uId") && uPw.equals("uPw")) {
			request.setAttribute("success", "로그인 성공!");
		}else {
			request.setAttribute("empty", "아이디 또는 비밀번호를 입력해주세요");
		}
		request.getRequestDispatcher(request.getContextPath()+ "/login3.jsp");
		
		if(dv != null) {
			if(uPw.equals(dv.getDocPW())) {
				isAuthenticated = true;
			}
		}
		
		if(isAuthenticated) {
			HttpSession session = request.getSession();
			session.setAttribute("DOC", dv);
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
