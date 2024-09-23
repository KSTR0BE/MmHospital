package kr.or.ddit.notice.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.notice.vo.NoticeVO;

public interface INoticeService {
	public List<NoticeVO> ntList(Map<String, Object> map);
	
	public NoticeVO ntGet(String ntNo);
	
	public int ntInsert(NoticeVO nv);
	
	public int ntUpdate(NoticeVO nv);
	
	public int ntDelete(String ntNo);
	
	public int ntHit(String ntNo);
	
	public List<NoticeVO> ntSearch(Map<String, Object> map);
	
	public int countList();
	
	public int countList2(String ntTit);
	
}
