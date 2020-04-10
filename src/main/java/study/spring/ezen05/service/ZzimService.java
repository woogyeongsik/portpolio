package study.spring.ezen05.service;

import java.util.List;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.EnableCaching;

import study.spring.ezen05.model.Zzim;


public interface ZzimService {

	/** pla_no를 저장하기 위한 단일 조회 */
	@Cacheable(value="zzim", key="#input")
	public int find_pla_no(Zzim input) throws Exception;

	/** 찜 목록 조회 */
	@Cacheable(value="zzim", key="#input")
	public List<Zzim> getZzimList(Zzim input) throws Exception;

	/** 찜 확인 번호 추가 */
	@Cacheable(value="zzim", key="#input")
	public int addZzim(Zzim input) throws Exception;

	/** 찜 업데이트(찜 제거) */
	@Cacheable(value="zzim", key="#input")
	public int updateZzim(Zzim input) throws Exception;

	/** 찜 조회 후 없으면 추가 */
	@Cacheable(value="zzim", key="#input")
	public Zzim getZzim(Zzim input) throws Exception;

	/** 찜 수 조회 */
	@Cacheable(value="zzim", key="#input")
	public int count_zzim(Zzim input) throws Exception;
	
	/** 등록날짜 조회 */
	@Cacheable(value="zzim", key="#input")
	public String find_reg_date(Zzim input) throws Exception;
	
	/** 등록날짜 조회 */
	@Cacheable(value="zzim", key="#input")
	public Zzim find_place(Zzim input) throws Exception;
	
	
}
