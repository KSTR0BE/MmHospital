package kr.or.ddit.appointMent.service;

import java.util.List;

import kr.or.ddit.appointMent.dao.AppointChkDaoImpl;
import kr.or.ddit.appointMent.dao.IAppointChkDao;
import kr.or.ddit.appointMent.vo.AppointMentVO;

public class AppointChkServiceImpl implements IAppointChkService {

	private static IAppointChkService instance = null;
	
	private AppointChkServiceImpl() {}
	
	public static IAppointChkService getInstance() {
		if(instance == null) {
			instance = new AppointChkServiceImpl();
		}
		return instance;
	} 
	
	IAppointChkDao acDao = AppointChkDaoImpl.getInstance();

	@Override
	public List<AppointMentVO> calAppoint() {
		return acDao.calAppoint();
	}
	
	
}
