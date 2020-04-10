package study.spring.ezen05.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.ezen05.model.SearchPlace;
import study.spring.ezen05.service.SearchPlaceService;

@Service
@Slf4j
public class SearchPlaceServiceImpl implements SearchPlaceService {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<SearchPlace> getSelectList(SearchPlace input) throws Exception {
		List<SearchPlace> result = null;
		
		try {
			result = sqlSession.selectList("SearchPlaceMapper.selectList", input);

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
	public int getPageCount(SearchPlace input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("SearchPlaceMapper.selectCountAll", input);

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

}
