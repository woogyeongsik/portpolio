package study.spring.ezen05.service;

import java.util.List;

import study.spring.ezen05.model.RecommendPlace;

public interface RecommendPlaceService {
	public List<RecommendPlace> getSelectList(RecommendPlace input) throws Exception;
}
