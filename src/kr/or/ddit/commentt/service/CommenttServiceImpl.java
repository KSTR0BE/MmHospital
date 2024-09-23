package kr.or.ddit.commentt.service;

import kr.or.ddit.commentt.dao.CommenttDaoImpl;
import kr.or.ddit.commentt.dao.ICommenttDao;
import kr.or.ddit.commentt.vo.CommenttVO;

public class CommenttServiceImpl implements ICommenttService{
	private ICommenttDao cmDao;
	
	private static ICommenttService cmService = new CommenttServiceImpl();
	
	public CommenttServiceImpl() {
		cmDao = CommenttDaoImpl.getInstance();
	}
	
	public static ICommenttService getInstance() {
		return cmService;
	}
	
	
	@Override
	public int cmInsert(CommenttVO cv) {
		return cmDao.cmInsert(cv);
	}

	@Override
	public CommenttVO cmGet(String sgNo) {
		return cmDao.cmGet(sgNo);
	}

	@Override
	public int cmUpdate(CommenttVO cv) {
		return cmDao.cmUpdate(cv);
	}

	@Override
	public int cmDelete(String sgNo) {
		return cmDao.cmDelete(sgNo);
	}
	
}
