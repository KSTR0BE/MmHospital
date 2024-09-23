package kr.or.ddit.appointMent.controll;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.appointMent.service.AppointChkServiceImpl;
import kr.or.ddit.appointMent.service.IAppointChkService;
import kr.or.ddit.appointMent.vo.AppointMentVO;

@WebServlet("/AppointChk.do")
public class AppointChk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public AppointChk() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IAppointChkService apService = AppointChkServiceImpl.getInstance();
		List<AppointMentVO> apcList = apService.calAppoint();
		
		request.setAttribute("apcList", apcList);
		request.getRequestDispatcher("/sub3/sub_3_2.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		
	}

}
