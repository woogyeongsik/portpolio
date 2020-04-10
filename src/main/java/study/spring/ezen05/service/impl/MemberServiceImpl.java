package study.spring.ezen05.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.ezen05.model.Member;
import study.spring.ezen05.service.MemberService;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {
	
	/** MyBatis */
	@Autowired
	SqlSession sqlSession;

	/** 회원 등록 하기 */
	@Override
	public int addMember(Member input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("MemberMapper.insertMem", input);
			
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

	/* 회원 정보 수정하기 */
	@Override
	public int editMember(Member input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("MemberMapper.editMem", input);
			
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
	
	@Override
	public Member getMember(Member input) throws Exception {
		Member result = null;
		
		try {
			result = sqlSession.selectOne("MemberMapper.selectMem", input);
			
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

	/** id 중복검사를 위한 갯수 조회 */
	@Override
	public int getCount(Member input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("MemberMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}	

	/** 비밀번호 확인을 위한 갯수 조회 */
	@Override
	public int getCount2(Member input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("MemberMapper.selectCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public List<Member> findId(Member input) throws Exception {
		List<Member> result = null;
		
		try {
			result = sqlSession.selectList("MemberMapper.selectId", input);
			
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
	public int editPw(Member input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("MemberMapper.editPw", input);
			
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

}
