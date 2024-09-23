package kr.or.ddit.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/Mlogin.do")
public class MemberLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//      System.out.println("get으로 넘어왔음");
		req.getRequestDispatcher("/login/login2.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uId = request.getParameter("uId");
		String uPw = request.getParameter("uPw");
		IMemberService service = MemberServiceImpl.getInstance();
		System.out.println("받아옴 >> " + uId + uPw);
		MemberVO mv = service.getMember(uId);

		boolean isAuthenticated = false;
		
		request.setAttribute("MEM", mv);
		if(uId.equals("uId") && uPw.equals("uPw")) {
			request.setAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
			request.getRequestDispatcher(request.getContextPath()+"/Mlogin.do").forward(request, response);
			
		}else if(uId.equals("uId") && uPw.equals("uPw")) {
			request.setAttribute("success", "로그인 성공!");
		} else {
			request.setAttribute("empty", "아이디 또는 비밀번호를 입력해주세요");
		}
		request.getRequestDispatcher(request.getContextPath() + "/login2.jsp");
		
		if (mv != null) {
			if (uPw.equals(mv.getMemPw())) {
				isAuthenticated = true;
			}
		}
		
		if (isAuthenticated) {
			HttpSession session = request.getSession();
			session.setAttribute("MEM", mv);
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