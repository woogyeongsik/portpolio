
package study.spring.ezen05.service;

import java.util.List;

import study.spring.ezen05.model.Comment;

/** 댓글 데이터 관리 기능을 제공하기 위한 Service 계층. */

public interface CommentService{
	/**
	 * 댓글 데이터 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Comment> getCommentList(Comment input) throws Exception;


	/** 입력, 수정, 삭제 */

	/**
	 * 댓글 데이터 등록하기
	 * 
	 * @param Comment 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public int addComment(Comment input) throws Exception;

	/**
	 * 댓글 데이터 수정하기
	 * 
	 * @param Comment 수정할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public int editComment(Comment input) throws Exception;

	/**
	 * 댓글 데이터 삭제하기
	 * 
	 * @param Comment 삭제할 댓글의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	public int deleteComment(Comment input) throws Exception;

}
