
package study.spring.ezen05.service;

import java.util.List;

import study.spring.ezen05.model.Score;

/** 점수 데이터 관리 기능을 제공하기 위한 Service 계층. */
public interface ScoreService {
	
	/**
	 * 점수 데이터 상세 조회
	 * 
	 * @param Score 조회할 점수의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터 저장된 Beans
	 * @throws Exception
	 */
	public Score getScoreItem(Score input) throws Exception;

	/**
	 * 점수 데이터 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Score> getScoreList(Score input) throws Exception;
	
	public List<Score> getScoreJsonList(Score input) throws Exception;

	/**
	 * 점수 데이터 저장되어 있는 갯수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */
	public int getScoreCount(Score input) throws Exception;
	
	/**
	 * 평균점수 데이터 저장되어 있는 갯수 조회
	 * 
	 * @return float
	 * @throws Exception
	 */
	public float getScoreAvg(Score input) throws Exception;

	/** 입력, 수정, 삭제 */

	/**
	 * 점수 데이터 등록하기
	 * 
	 * @param Score 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public int addScore(Score input) throws Exception;

	/**
	 * 점수 데이터 수정하기
	 * 
	 * @param Score 수정할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public int editScore(Score input) throws Exception;

	/**
	 * 점수 데이터 삭제하기
	 * 
	 * @param Score 삭제할 점수의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	public int deleteScore(Score input) throws Exception;

}
