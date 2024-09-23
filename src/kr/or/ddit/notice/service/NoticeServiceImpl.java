package kr.or.ddit.notice.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.notice.dao.INoticeDao;
import kr.or.ddit.notice.dao.NoticeDaoImpl;
import kr.or.ddit.notice.vo.NoticeVO;

public class NoticeServiceImpl implements INoticeService{
	private INoticeDao ntDao;
	
	private static INoticeService ntService = new NoticeServiceImpl();
	
	public NoticeServiceImpl() {
		ntDao = NoticeDaoImpl.getInstance();
	}
	
	public static INoticeService getInstance() {
		return ntService;
	}
	
	@Override
	public List<NoticeVO> ntList(Map<String, Object> map) {
		return ntDao.ntList(map);
	}

	@Override
	public NoticeVO ntGet(String ntNo) {
		return ntDao.ntGet(ntNo);
	}

	@Override
	public int ntInsert(NoticeVO nv) {
		return ntDao.ntInsert(nv);
	}
	

	@Override
	public int ntUpdate(NoticeVO nv) {
		return ntDao.ntUpdate(nv);
	}

	@Override
	public int ntDelete(String ntNo) {
		return ntDao.ntDelete(ntNo);
	}

	@Override
	public int ntHit(String ntNo) {
		return ntDao.ntHit(ntNo);
	}

	@Override
	public List<NoticeVO> ntSearch(Map<String, Object> map) {
		return ntDao.ntSearch(map);
	}

	@Override
	public int countList() {
		return ntDao.countList();
	}

	@Override
	public int countList2(String ntTit) {
		return ntDao.countList2(ntTit);
	}

	
}
