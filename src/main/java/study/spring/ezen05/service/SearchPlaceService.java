package study.spring.ezen05.service;

import java.util.List;

import study.spring.ezen05.model.SearchPlace;

public interface SearchPlaceService {
	public List<SearchPlace> getSelectList(SearchPlace input) throws Exception;
	
	public int getPageCount(SearchPlace input) throws Exception;
}
