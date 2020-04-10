package study.spring.ezen05.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.ezen05.model.Score;

import study.spring.ezen05.service.ScoreService;

@Slf4j
@Service
public class ScoreServiceImpl implements ScoreService {
	
	/** MyBatis */
	// -->
	@Autowired
	SqlSession sqlSession;
	
	
	/**
	 * 상세조회
	 */
	@Override
	public Score getScoreItem(Score input) throws Exception {
		Score result = null;

		try {
			result = sqlSession.selectOne("ScoreMapper.selectItem", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	
	/**
	 * 목록조회
	 */
	@Override
	public List<Score> getScoreList(Score input) throws Exception {
		List<Score> result = null;

		try {
			result = sqlSession.selectList("ScoreMapper.selectList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	/**
	 * 갯수 조회
	 */
	@Override
	public int getScoreCount(Score input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("ScoreMapper.selectCountAll", input);

		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	
	/**
	 * 추가
	 */
	@Override
	public int addScore(Score input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("ScoreMapper.insertItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");

		}

		return result;
	}
	
	/** 
	 * 수정
	 */
	@Override
	public int editScore(Score input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("ScoreMapper.updateItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {

			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {

			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}

		return result;
	}
	
	/**
	 * 삭제
	 */
	@Override
	public int deleteScore(Score input) throws Exception {
		int result = 0;

		try {

			result = sqlSession.delete("ScoreMapper.deleteItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {

			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {

			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}

		return result;
	}


	@Override
	public float getScoreAvg(Score input) throws Exception {
		float result = 0;

		try {
			result = sqlSession.selectOne("ScoreMapper.selectCountAvg", input);

		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}


	@Override
	public List<Score> getScoreJsonList(Score input) throws Exception {
		List<Score> result = null;

		try {
			result = sqlSession.selectList("ScoreMapper.selectJsonList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
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
