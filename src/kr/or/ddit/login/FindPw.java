package kr.or.ddit.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/login/findPw.do")
public class FindPw extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IMemberService memberService = MemberServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("findPwfindPw", "findPw");
		
		request.getRequestDispatcher("/login/findPw.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트에서 전송된 데이터를 받아옴
		String uId = request.getParameter("uId");
		String reg = request.getParameter("reg");
		
		// 받아온 데이터를 Map에 저장
		Map<String, Object> map = new HashMap<>();
		map.put("uId", uId);
		map.put("reg", reg);
		
		// 서비스를 호출하여 해당하는 사용자 정보를 가져옴
		MemberVO member = memberService.mbGet(uId);
		
		// 사용자가 존재하지 않는 경우
		if(member == null) {
			// '등록되지 않은 회원입니다.' 메시지를 클라이언트에 응답으로 보냄
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getOutputStream().write("등록되지 않은 회원입니다.".getBytes("UTF-8"));
			return;
		}
		
		
		
		// 사용자가 존재하고 입력된 주민등록번호와 회원정보의 주민등록번호가 일치하는지 확인
		String foundPw = null;
		if(member != null && reg.equals(member.getMem_reg())) {
			// 임시 비밀번호 생성
			foundPw = memberService.findPw(map);
		} else {
			// 주민번호가 일치하지 않는 경우 클라이언트에 알림을 보냄 
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getOutputStream().write("주민등록번호가 일치하지 않습니다.".getBytes("UTF-8"));
			return;
		}
		
		// 찾은 비밀번호를 클라이언트에 응답으로 보냄
		response.setContentType("text/plain"); 
		response.setCharacterEncoding("UTF-8"); 
		response.getOutputStream().write(foundPw.getBytes("UTF-8"));
	}
	
}
