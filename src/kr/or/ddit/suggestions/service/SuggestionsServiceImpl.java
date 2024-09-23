package kr.or.ddit.suggestions.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.suggestions.dao.ISuggestionsDao;
import kr.or.ddit.suggestions.dao.SuggestionsDaoImpl;
import kr.or.ddit.suggestions.vo.SuggestionsVO;

public class SuggestionsServiceImpl implements ISuggestionsService{
	private ISuggestionsDao sgDao;
	
	private static ISuggestionsService sgService = new SuggestionsServiceImpl();
	
	public SuggestionsServiceImpl() {
		sgDao = SuggestionsDaoImpl.getInstance();
	}
	
	public static ISuggestionsService getInstance() {
		return sgService;
	}

	@Override
	public List<SuggestionsVO> sgList(Map<String, Object> map) {
		return sgDao.sgList(map);
	}

	@Override
	public SuggestionsVO sgGet(String sgNo) {
		return sgDao.sgGet(sgNo);
	}

	@Override
	public int sgInsert(SuggestionsVO sv) {
		return sgDao.sgInsert(sv);
	}
	
	@Override
	public int sgInsertD(SuggestionsVO sv) {
		return sgDao.sgInsertD(sv);
	}

	@Override
	public int sgUpdate(SuggestionsVO sv) {
		return sgDao.sgUpdate(sv);
	}

	@Override
	public int sgDelete(String sgNo) {
		return sgDao.sgDelete(sgNo);
	}

	@Override
	public int sgHit(String sgNo) {
		return sgDao.sgHit(sgNo);
	}

	@Override
	public List<SuggestionsVO> sgSearch(String sgTit) {
		return sgDao.sgSearch(sgTit);
	}

	@Override
	public int countList() {
		return sgDao.countList();
	}

	@Override
	public int countList2(String sgTit) {
		return sgDao.countList2(sgTit);
	}
	
}
