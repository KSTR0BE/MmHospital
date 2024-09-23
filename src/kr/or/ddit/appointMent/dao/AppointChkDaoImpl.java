package kr.or.ddit.appointMent.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.appointMent.vo.AppointMentVO;
import kr.or.ddit.util.MyBatisUtil;

public class AppointChkDaoImpl implements IAppointChkDao {
	
	private static IAppointChkDao instance = null;
	
	private AppointChkDaoImpl() {};
	
	public static IAppointChkDao getInstance() {
		if(instance == null) {
			instance = new AppointChkDaoImpl();
		}
		return instance;
	}

	@Override
	public List<AppointMentVO> calAppoint() {
		
		List<AppointMentVO> apcList = new ArrayList<AppointMentVO>();
		
		SqlSession session = null;
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			
			apcList = session.selectList("appointMent.calAppoint");
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return apcList;
	}
	
	
	
	
}
