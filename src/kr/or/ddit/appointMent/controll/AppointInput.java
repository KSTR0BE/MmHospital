package kr.or.ddit.appointMent.controll;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import kr.or.ddit.doctor.vo.DoctorVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;


@WebServlet("/AppointInput.do")
public class AppointInput extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IMemberService service = MemberServiceImpl.getInstance();
	IAppointmentService amService = AppointmentServiceImpl.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("MEM");
		if(memberVO == null) {
			response.sendRedirect(request.getContextPath() + "/Mlogin.do");
			return;
		}
		MemberVO mv = service.getMember(memberVO.getMem_id());
		
		String msg = request.getParameter("msg");
		System.out.println("get msg >> "+msg);
		if(msg != null) {
			request.setAttribute("msg", msg);
		}
		
        request.setAttribute("MEM", mv);
        System.out.println("get mv>>"+mv);
        
		request.getRequestDispatcher("/sub3/sub_3_1.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		 // 클라이언트로부터 전송된 데이터 받기
		String date = request.getParameter("selectedDate");
        String time = request.getParameter("selectedTime");
        int memNo = Integer.parseInt(request.getParameter("memNo"));
        int dtNo = Integer.parseInt(request.getParameter("doctor"));
        
        // 받은 데이터 확인하기 (디버깅용)
        System.out.println("Selected Date: " + date);
        System.out.println("Selected Time: " + time);
        System.out.println("doctor No: " + dtNo);

        
        AppointMentVO apmVO1 = new AppointMentVO(date, time + ":00", dtNo);
        amService.amChk(apmVO1);
        
        AppointMentVO apmVO2 = new AppointMentVO(memNo);
        amService.amChk1(apmVO2);
        
        String msg = "";
        
        int cnt = 0;
        
        if((amService.amChk1(apmVO2) != null)) {
        
			msg = "예약존재";
        }
        
		else {
			if ((amService.amChk(apmVO1) == null)) {
				AppointMentVO apmVO = new AppointMentVO(date, memNo, dtNo, time + ":00");

				cnt = amService.insertAppoint(apmVO);

			}
			if (cnt > 0) {
				msg = "성공";
			} else {
				msg = "실패";
			}
		}
        
        System.out.println("cnt : " + cnt);
        
        System.out.println("msg:"+msg);
        request.getSession().setAttribute("msg", msg);
	}

}
