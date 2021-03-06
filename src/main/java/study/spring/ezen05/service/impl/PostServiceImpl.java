package study.spring.ezen05.service.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import study.spring.ezen05.model.Post;
import study.spring.ezen05.service.PostService;


/** 게시글 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
// --> import org.springframework.stereotype.Service;
@Service
@Slf4j
public class PostServiceImpl implements PostService {
	
	/** MyBatis */
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 게시글 데이터 상세 조회
	 * 
	 * @param Post 조회할 게시글의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Post getNoticeItem(Post input) throws Exception {
		Post result = null;

		try {
			result = sqlSession.selectOne("PostMapper.noticeSelectItem", input);

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
	 * 게시글 데이터 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Post> getNoticeList(Post input) throws Exception {
		List<Post> result = null;

		try {
			result = sqlSession.selectList("PostMapper.noticeSelectList", input);

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
	 * 게시글 데이터가 저장되어 있는 갯수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getNoticeCount(Post input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("PostMapper.noticeSelectCountAll", input);

		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	/**
	 * 게시글 데이터 등록하기 
	 * @param Post 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int addNotice(Post input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("PostMapper.noticeInsertItem", input);

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
	 * 게시글 데이터 수정하기 
	 * @param Post 수정할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int editNotice(Post input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("PostMapper.noticeUpdateItem", input);

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

	/** 게시글 데이터 삭제하기 
	 * @param Post 삭제할 게시글의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int deleteNotice(Post input) throws Exception {
		int result = 0;

		try {
			
			result = sqlSession.delete("PostMapper.noticeDeleteItem", input);

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
}
