package study.spring.ezen05.service;

import java.util.List;
import study.spring.ezen05.model.Post;


/** 게시글 데이터 관리 기능을 제공하기 위한 Service 계층. */
public interface PostService {
	/**
	 * 게시글 데이터 상세 조회
	 * 
	 * @param Post 조회할 게시글의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터 저장된 Beans
	 * @throws Exception
	 */
	public Post getNoticeItem(Post input) throws Exception;

	/**
	 * 게시글 데이터 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Post> getNoticeList(Post input) throws Exception;

	/**
	 * 게시글 데이터 저장되어 있는 갯수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */
	public int getNoticeCount(Post input) throws Exception;

	/**
	 * 게시글 데이터 등록하기
	 * 
	 * @param Post 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public int addNotice(Post input) throws Exception;

	/**
	 * 게시글 데이터 수정하기
	 * 
	 * @param Post 수정할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public int editNotice(Post input) throws Exception;

	/**
	 * 게시글 데이터 삭제하기
	 * 
	 * @param Post 삭제할 게시글의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	public int deleteNotice(Post input) throws Exception;

}