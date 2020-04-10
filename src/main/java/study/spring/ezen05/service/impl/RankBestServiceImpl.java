package study.spring.ezen05.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.ezen05.model.RankBest;
import study.spring.ezen05.service.RankBestService;

@Service
@Slf4j
public class RankBestServiceImpl implements RankBestService {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<RankBest> getTotalRankList(RankBest input) throws Exception {
		List<RankBest> result = null;

		try {
			result = sqlSession.selectList("RankBestMapper.selectListTotal", input);
			log.debug("정상적으로 실행 되었습니다.");
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	@Override
	public List<RankBest> getTenRankList(RankBest input) throws Exception {
		List<RankBest> result = null;

		try {
			result = sqlSession.selectList("RankBestMapper.selectListTen", input);
			log.debug("정상적으로 실행 되었습니다.");
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	@Override
	public List<RankBest> getTwentyRankList(RankBest input) throws Exception {
		List<RankBest> result = null;

		try {
			result = sqlSession.selectList("RankBestMapper.selectListTwenty", input);
			log.debug("정상적으로 실행 되었습니다.");
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	@Override
	public List<RankBest> getThirtyRankList(RankBest input) throws Exception {
		List<RankBest> result = null;

		try {
			result = sqlSession.selectList("RankBestMapper.selectListThiryty", input);
			log.debug("정상적으로 실행 되었습니다.");
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	@Override
	public List<RankBest> getFortyRankList(RankBest input) throws Exception {
		List<RankBest> result = null;

		try {
			result = sqlSession.selectList("RankBestMapper.selectListForty", input);
			log.debug("정상적으로 실행 되었습니다.");
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	@Override
	public List<RankBest> getFiftyRankList(RankBest input) throws Exception {
		List<RankBest> result = null;

		try {
			result = sqlSession.selectList("RankBestMapper.selectListFifty", input);
			log.debug("정상적으로 실행 되었습니다.");
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	@Override
	public List<RankBest> getSixtyRankList(RankBest input) throws Exception {
		List<RankBest> result = null;

		try {
			result = sqlSession.selectList("RankBestMapper.selectListSixty", input);
			log.debug("정상적으로 실행 되었습니다.");
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	@Override
	public List<RankBest> getFemaleRankList(RankBest input) throws Exception {
		List<RankBest> result = null;

		try {
			result = sqlSession.selectList("RankBestMapper.selectListFemale", input);
			log.debug("정상적으로 실행 되었습니다.");
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	@Override
	public List<RankBest> getMaleRankList(RankBest input) throws Exception {
		List<RankBest> result = null;

		try {
			result = sqlSession.selectList("RankBestMapper.selectListMale", input);
			log.debug("정상적으로 실행 되었습니다.");
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

}
