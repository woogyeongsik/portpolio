package study.spring.ezen05.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.ezen05.helper.WebHelper;
import study.spring.ezen05.model.Zzim;
import study.spring.ezen05.service.ZzimService;

@Slf4j
@Service
public class ZzimServiceImpl implements ZzimService {

	/** DB 접속 객체 주입 */
	@Autowired SqlSession sqlSession;

	@Override
	@Cacheable(value="zzim", key="#zzim")
	public List<Zzim> getZzimList(Zzim input) throws Exception {
		List<Zzim> result = null;

		try {
			result = sqlSession.selectList("ZzimMapper.select_zzim_list", input);

			if (result == null) {
				log.debug("찜 목록 리스트 조회 결과 : null");
			}

		} catch (NullPointerException e) {
			log.debug(e.getLocalizedMessage());
			throw new NullPointerException("조회할 찜 목록이 없습니다.");
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("찜 목록 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * @author 우경식
	 * @description : 찜 버튼 클릭시 Zzim 테이블중 찜 확인 용 번호에 1추가
	 */
	@Override
	@Cacheable(value="zzim", key="#zzim")
	public int addZzim(Zzim input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("ZzimMapper.zzim_insert",input);

			if (result == 0) {
				log.info("ZzimService of addZzim >>>>>> result = 0");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new NullPointerException("찜을 저장할 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("찜 저장에 실패했습니다.");
		}
		return result;
	}
	/**
	 * 찜 해제 기능
	 */
	@Override
	@Cacheable(value="zzim", key="#zzim")
	public int updateZzim(Zzim input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("ZzimMapper.update_zzim", input);

			if (result == 0) {
				log.debug("updateZzim of ZzimService >>>>>>> result = 0");
				throw new Exception("result == 0");
			}
		} catch (NullPointerException e) {
		  log.error(e.getLocalizedMessage());
		  throw new NullPointerException("Update 할 데이터가 Null 입니다.");
		} catch (Exception e) {
		  log.error(e.getLocalizedMessage());
		  throw new Exception("데이터 업데이트에 실패했습니다.");
		}

		return result;
	}
	/**
	 * nm에 저장하기 위해서 pla_no를 확인하여 해당 장소 저장.
	 *
	 */
	@Override
	@Cacheable(value="zzim", key="#zzim")
	public int find_pla_no(Zzim input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("ZzimMapper.find_pla_no", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new NullPointerException("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	
	
	
	/** 한 장소에 대한 찜 데이터 조회 */
	@Override
	@Cacheable(value="zzim", key="#zzim")
	public Zzim getZzim(Zzim input) throws Exception {
		Zzim result = null;

		try {
			result = sqlSession.selectOne("ZzimMapper.get_zzim", input);

			if (result == null) {
				log.debug("getZzim==null");
				this.addZzim(input);
				result = sqlSession.selectOne("ZzimMapper.get_zzim", input);
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 데이터가 없습니다.");
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/** 해당 아이디에 대한 전체 찜 개수 조회 */
	@Override
	@Cacheable(value="zzim", key="#zzim")
	public int count_zzim(Zzim input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("ZzimMapper.count_zzim", input);

			if (result == 0) {
				log.info("찜 개수 >>>>>>>>>>>>>>>>> result == 0");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
		}
		return result;
	}

	@Override
	public String find_reg_date(Zzim input) throws Exception {
		String result = null;
		
		try {
			result = sqlSession.selectOne("ZzimMapper.find_reg_date", input);
			
			if (result == null) {
				log.debug("result==null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
		}
		
		return result;
	}

	@Override
	public Zzim find_place(Zzim input) throws Exception {
		Zzim result = null;
		try {
			result = sqlSession.selectOne("ZzimMapper.get_zzim", input);
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
		}
		
		return result;
	}
}
