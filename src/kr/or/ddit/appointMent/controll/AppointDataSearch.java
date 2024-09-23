package kr.or.ddit.appointMent.controll;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.appointMent.service.AppointmentServiceImpl;
import kr.or.ddit.appointMent.service.IAppointmentService;
import kr.or.ddit.appointMent.vo.DiagnosisVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.notice.vo.NoticeVO;



@WebServlet("/AppointDataSearch.do")
public class AppointDataSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	IAppointmentService service = AppointmentServiceImpl.getInstance();
  
    public AppointDataSearch() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("MEM");
		if(memberVO == null) {
			response.sendRedirect(request.getContextPath() + "/Mlogin.do");
			return;
		}
		int memNo = Integer.parseInt(memberVO.getMem_no());
		
		String month1 = request.getParameter("month");
		String month = month1.substring(5,7);
		 System.out.println("month: " + month);
		 System.out.println("Member number: " + memNo);
		    
		 Map<String, Object> paramMap = new HashMap<>();
         paramMap.put("memNo", memNo);
         paramMap.put("month", month);
          
		List<DiagnosisVO> dgList = service.DgSearch(paramMap);
		
		 if (dgList == null || dgList.isEmpty()) {
	            System.out.println("No data.");
	        }
		
		request.setAttribute("DgList", dgList);
		
		
		
		request.getRequestDispatcher("/sub3/sub_3_5.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
