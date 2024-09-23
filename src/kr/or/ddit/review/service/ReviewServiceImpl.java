package kr.or.ddit.review.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.review.dao.IReviewDao;
import kr.or.ddit.review.dao.ReviewDaoImpl;
import kr.or.ddit.review.vo.ReviewVO;

public class ReviewServiceImpl implements IReviewService{
	private IReviewDao rvDao;
	
	private static IReviewService rvService = new ReviewServiceImpl();
	
	public ReviewServiceImpl() {
		rvDao = ReviewDaoImpl.getInstance();
	}
	
	public static IReviewService getInstance() {
		return rvService;
	}
	
	@Override
	public List<ReviewVO> rvList(Map<String, Object> map) {
		return rvDao.rvList(map);
	}
	
	@Override
	public ReviewVO rvGet(String rvNo) {
		return rvDao.rvGet(rvNo);
	}

	@Override
	public int rvInsert(ReviewVO rv) {
		return rvDao.rvInsert(rv);
	}

	@Override
	public int rvUpdate(ReviewVO rv) {
		return rvDao.rvUpdate(rv);
	}

	@Override
	public int rvDelete(String rvNo) {
		return rvDao.rvDelete(rvNo);
	}

	@Override
	public int rvHit(String rvNo) {
		return rvDao.rvHit(rvNo);
	}

	@Override
	public List<ReviewVO> rvSearch(String rvTit) {
		return rvDao.rvSearch(rvTit);
	}

	@Override
	public int countList() {
		return rvDao.countList();
	}

	@Override
	public int countList2(String rvTit) {
		return rvDao.countList2(rvTit);
	}
	
}
