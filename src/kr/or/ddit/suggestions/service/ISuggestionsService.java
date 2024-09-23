package kr.or.ddit.suggestions.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.suggestions.vo.SuggestionsVO;

public interface ISuggestionsService {
	public List<SuggestionsVO> sgList(Map<String, Object> map);
	
	public SuggestionsVO sgGet(String sgNo);
	
	public int sgInsert(SuggestionsVO sv);
	
	public int sgInsertD(SuggestionsVO sv);
	
	public int sgUpdate(SuggestionsVO sv);
	
	public int sgDelete(String sgNo);
	
	public int sgHit(String sgNo);
	
	public List<SuggestionsVO> sgSearch(String sgTit);
	
	public int countList();
	
	public int countList2(String sgTit);
}
