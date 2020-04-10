package study.spring.ezen05.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.ezen05.model.Place;

import study.spring.ezen05.service.PlaceService;


@Slf4j
@Service
public class PlaceServiceImpl implements PlaceService {
	
	/** MyBatis **/
	// -->
	@Autowired
	SqlSession sqlSession;
	
	
	/**
	 * 상세조회
	 */
	@Override
	public Place getPlaceItem(Place input) throws Exception {
		Place result = null;

		try {
			result = sqlSession.selectOne("PlaceMapper.selectItem", input);

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
	 * 목록조회
	 */
	@Override
	public List<Place> getPlaceList(Place input) throws Exception {
		List<Place> result = null;

		try {
			result = sqlSession.selectList("PlaceMapper.selectList", input);

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
	 * 갯수 조회
	 */
	@Override
	public int getPlaceCount(Place input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("PlaceMapper.selectCountAll", input);

		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	
	/**
	 * 추가
	 */
	@Override
	public int addPlace(Place input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("PlaceMapper.insertItem", input);

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
	 * 수정
	 */
	@Override
	public int editPlace(Place input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("PlaceMapper.updateItem", input);

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
	 * 삭제
	 */
	@Override
	public int deletePlace(Place input) throws Exception {
		int result = 0;

		try {

			result = sqlSession.delete("PlaceMapper.deleteItem", input);

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
