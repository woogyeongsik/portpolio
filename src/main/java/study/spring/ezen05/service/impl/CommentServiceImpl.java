package study.spring.ezen05.service.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import study.spring.ezen05.model.Comment;
import study.spring.ezen05.service.CommentService;

/** 댓글 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
// --> import org.springframework.stereotype.Service;
@Service
@Slf4j
public class CommentServiceImpl implements CommentService {
	
	/** MyBatis */
	@Autowired
	SqlSession sqlSession;
	
	
	/**
	 * 댓글 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Comment> getCommentList(Comment input) throws Exception {
		List<Comment> result = null;

		try {
			result = sqlSession.selectList("CommentMapper.selectList", input);

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
	 * 댓글 등록하기 
	 * @param Comment 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int addComment(Comment input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("CommentMapper.insertItem", input);
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
		 * 댓글 수정하기
		 * @param Comment 수정할 정보를 담고 있는 Beans
		 *@throws Exception
		 */
	@Override
	public int editComment(Comment input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("CommentMapper.updateItem", input);

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
	 * 댓글 삭제하기
	 * @param Comment 삭제할 정보를 담고 있는 Beans
	 *@throws Exception
	 */

	@Override
	public int deleteComment(Comment input) throws Exception {
		int result = 0;
		
		try {
			// 댓글 삭제 전 자신을 참조하는 학생들의 Comment_id컬럼을 null로 수정
			sqlSession.update("StudentMapper.unsetComment", input);
			
			result = sqlSession.delete("CommentMapper.deleteItem", input);

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