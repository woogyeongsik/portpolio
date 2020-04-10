package study.spring.ezen05.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.ezen05.model.RecommendPlace;
import study.spring.ezen05.service.RecommendPlaceService;

@Service
@Slf4j
public class RecommendPlaceServiceImpl implements RecommendPlaceService {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<RecommendPlace> getSelectList(RecommendPlace input) throws Exception {
		List<RecommendPlace> result = null;

		try {
			result = sqlSession.selectList("RecommendMapper.selectList", input);

			if (result == null) {
				throw new NullPointerException("result == null");
			}

			log.debug("정상적으로 실행 되었습니다.");
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("로그인이 필요한 서비스입니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

}
