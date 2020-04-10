package study.spring.ezen05.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.ezen05.model.SessionMember;
import study.spring.ezen05.service.SessionMemService;

@Slf4j
@Service
public class SessionMemServiceImpl implements SessionMemService {

	/** MyBatis */
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public SessionMember getSessionMemItem(SessionMember input) throws Exception {
		SessionMember result = null;
		
		try {
			result = sqlSession.selectOne("MemberMapper.selectSessionItem", input);
			
			if (result == null) {
				throw new NullPointerException("result = null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("아이디 또는 비밀번호가 일치하지 않습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
				
		return result;
	}

}
