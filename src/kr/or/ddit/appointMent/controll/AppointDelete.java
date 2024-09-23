package kr.or.ddit.appointMent.controll;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.appointMent.service.AppointmentServiceImpl;
import kr.or.ddit.appointMent.service.IAppointmentService;
import kr.or.ddit.appointMent.vo.AppointMentVO;
import kr.or.ddit.appointMent.vo.DiagnosisVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;


@WebServlet("/AppointDelete.do")
public class AppointDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	IAppointmentService service = AppointmentServiceImpl.getInstance();

    public AppointDelete() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String apNo = request.getParameter("apNo");
		int cnt = service.appointDelete(Integer.parseInt(apNo));
		
		System.out.println(apNo);
		
		
		if(cnt!=0) {
			System.out.println("성공");
			response.sendRedirect(request.getContextPath() + "/MemberMypage.do");
		}else {
			System.out.println("실패");
			response.sendRedirect(request.getContextPath() + "/AppointDelete.do");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
