package study.spring.ezen05.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.ezen05.model.Mypage;
import study.spring.ezen05.service.myPage;

@Slf4j
@Service
public class myPageImpl implements myPage {

	@Autowired
	SqlSession sqlSession;

	/**
	 * @author 우경식
	 * @Description : This is the class of implements of upper class of this.
	 * @input : saved of Beans Class
	 */

	@Override
	public List<Mypage> getList_myPage(Mypage input) throws Exception {

		List<Mypage> result = null;

		try {
			result = sqlSession.selectList("myPageMapper.selectList", input);

			if (result == null) {
				throw new NullPointerException("result == null");
			}

		} catch (NullPointerException e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int getPageCount(Mypage input) throws Exception {

		int result = 0;

		try {
			result = sqlSession.selectOne("myPageMapper.selectCountAll", input);

			if (result == 0) {
				throw new NullPointerException("result == null");
			}

		} catch (NullPointerException e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	
	
	
	@Override
	public List<Mypage> getMyQnAList(Mypage input) throws Exception {

		List<Mypage> result = null;

		try {
			result = sqlSession.selectList("myPageMapper.selectMyQnAList", input);

			if (result == null) {
				throw new NullPointerException("result == null");
			}

		} catch (NullPointerException e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
		
	}

}
