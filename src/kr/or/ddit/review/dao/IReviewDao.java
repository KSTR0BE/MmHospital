package kr.or.ddit.review.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.review.vo.ReviewVO;

public interface IReviewDao {
	public List<ReviewVO> rvList(Map<String, Object> map);
	
	public ReviewVO rvGet(String rvNo);
	
	public int rvInsert(ReviewVO rv);
	
	public int rvUpdate(ReviewVO rv);
	
	public int rvDelete(String rvNo);
	
	public int rvHit(String rvNo);
	
	public List<ReviewVO> rvSearch(String rvTit);
	
	public int countList();
	
	public int countList2(String rvTit);
}
