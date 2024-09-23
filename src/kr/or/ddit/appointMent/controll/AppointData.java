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


@WebServlet("/AppointData.do")
public class AppointData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	IAppointmentService service = AppointmentServiceImpl.getInstance();
	IMemberService memService = MemberServiceImpl.getInstance();
	
    public AppointData() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("MEM");
		if(memberVO == null) {
			response.sendRedirect(request.getContextPath() + "/Mlogin.do");
			return;
		}
		int no = Integer.parseInt(memberVO.getMem_no());
		
		List<DiagnosisVO> DgList = service.appointData(no);

		request.setAttribute("DgList", DgList);
		
		request.getRequestDispatcher("/sub3/sub_3_5.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
