
package study.spring.ezen05.service;

import java.util.List;

import study.spring.ezen05.model.Place;

/** 장소 데이터 관리 기능을 제공하기 위한 Service 계층. */
public interface PlaceService {
	
	/**
	 * 장소 데이터 상세 조회
	 * 
	 * @param Place 조회할 장소의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터 저장된 Beans
	 * @throws Exception
	 * 
	 */
	public Place getPlaceItem(Place input) throws Exception;

	/**
	 * 장소 데이터 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Place> getPlaceList(Place input) throws Exception;

	/**
	 * 장소 데이터 저장되어 있는 갯수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */
	public int getPlaceCount(Place input) throws Exception;
	
	

	/**
	 * 장소 데이터 등록하기
	 * 
	 * @param Place 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public int addPlace(Place input) throws Exception;

	/**
	 * 장소 데이터 수정하기
	 * 
	 * @param Place 수정할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public int editPlace(Place input) throws Exception;

	/**
	 * 장소 데이터 삭제하기
	 * 
	 * @param Place 삭제할 장소의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	public int deletePlace(Place input) throws Exception;

}
