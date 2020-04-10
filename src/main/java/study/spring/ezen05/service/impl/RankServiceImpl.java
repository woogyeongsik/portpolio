package study.spring.ezen05.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.ezen05.model.TestScoreByWoo;
import study.spring.ezen05.service.Rank;

@Service
@Slf4j
public class RankServiceImpl implements Rank {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	@Cacheable(value="zzim", key="#zzim")
	public List<TestScoreByWoo> getScore(TestScoreByWoo input) throws Exception {

		List<TestScoreByWoo> result = null;

		try {
			result = sqlSession.selectList("TestScoreByWooMapper.selectList", input);
			log.debug("정상적으로 실행되었습니다.");

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
	
	@Override
	@Cacheable(value="zzim", key="#zzim")
	public List<TestScoreByWoo> getScore_ten(TestScoreByWoo input) throws Exception {

		List<TestScoreByWoo> result = null;

		try {
			result = sqlSession.selectList("TestScoreByWooMapper.selectListTen", input);
			log.debug("Mapper가 정상적으로 실행 되었습니다.");
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
	@Cacheable(value="zzim", key="#zzim")
	public List<TestScoreByWoo> getScore_man(TestScoreByWoo input) throws Exception {

		List<TestScoreByWoo> result = null;

		try {
			result = sqlSession.selectList("TestScoreByWooMapper.selectListMan", input);
			log.debug("Mapper가 정상적으로 실행 되었습니다.");
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
	@Cacheable(value="zzim", key="#zzim")
	public List<TestScoreByWoo> getGenderItem(TestScoreByWoo input) throws Exception {
		
		List<TestScoreByWoo> result = null;
		
		try {
			result = sqlSession.selectList("TestScoreByWooMapper.selectItem", input);
			log.debug("Mapper가 정상적으로 실행되었습니다.");
			
			if (result == null) {
				throw new NullPointerException("result == null");
			}
			
		} catch (NullPointerException e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch(Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;

	}
	
	@Override
	@Cacheable(value="zzim", key="#zzim")
	public List<TestScoreByWoo> getAgeItem(TestScoreByWoo input) throws Exception {
		
		List<TestScoreByWoo> result = null;
		
		try {
			result = sqlSession.selectList("TestScoreByWooMapper.selectAge", input);
			log.debug("Mapper가 정상적으로 실행되었습니다.");
			
			if (result == null) {
				throw new NullPointerException("result == null");
			}
			
		} catch (NullPointerException e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch(Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
}
