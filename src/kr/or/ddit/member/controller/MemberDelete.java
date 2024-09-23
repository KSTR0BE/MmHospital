package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/delete.do")
public class MemberDelete extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("MEM");
		if(memberVO == null) {
			resp.sendRedirect(req.getContextPath() + "/Mlogin.do");
			return;
		}
		req.getRequestDispatcher("/memMypage/MemDelete.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("MEM"); // 세션에서 회원 정보 가져오기
		String userId = memberVO.getMem_id(); // 회원 아이디 가져오기
		String password = request.getParameter("uPw"); // 비밀번호 파라미터 가져오기
		IMemberService memberService = MemberServiceImpl.getInstance();
				
		// 비밀번호가 일치하면 DEL_YN값을 변경하여 회원 탈퇴
		if (memberService.checkPassword(userId, password)) {
			// DEL_YN 값을 'Y'로 변경하여 회원을 탈퇴 처리
			memberService.updateMemberDelYN(userId);
			// 세션 무효화
			session.invalidate();
			// 회원 탈퇴 완료 메시지 출력 후 메인 페이지로 이동
			response.sendRedirect(request.getContextPath() + "/home.do?msg=success");
		} else {
			// 비밀번호가 일치하지 않는 경우 현재 페이지에서 실패 메시지를 함께 전달
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
		    request.getRequestDispatcher("/memMypage/MemDelete.jsp").forward(request, response);
		}
	}
}
