package study.spring.ezen05.service;

import java.util.List;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.EnableCaching;

import study.spring.ezen05.model.RankBest;

public interface RankBestService {
	
	public List<RankBest> getTotalRankList(RankBest input) throws Exception;
	
	public List<RankBest> getTenRankList(RankBest input) throws Exception;
	
	public List<RankBest> getTwentyRankList(RankBest input) throws Exception;
	
	public List<RankBest> getThirtyRankList(RankBest input) throws Exception;
	
	public List<RankBest> getFortyRankList(RankBest input) throws Exception;
	
	public List<RankBest> getFiftyRankList(RankBest input) throws Exception;
	
	public List<RankBest> getSixtyRankList(RankBest input) throws Exception;
	
	public List<RankBest> getFemaleRankList(RankBest input) throws Exception;
	
	public List<RankBest> getMaleRankList(RankBest input) throws Exception;
}
