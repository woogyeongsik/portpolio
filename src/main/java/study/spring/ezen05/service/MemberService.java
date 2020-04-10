package study.spring.ezen05.service;

import java.util.List;

import study.spring.ezen05.model.Member;

public interface MemberService {
	/**
	 * 회원 등록하기
	 * 
	 * @param Member - 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public int addMember(Member input) throws Exception;

	/**
	 * 회원 수정하기
	 * 
	 * @param Member - 수정할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public int editMember(Member input) throws Exception;
	
	/**
	 * 회원정보 조회하기
	 */
	public Member getMember(Member input) throws Exception;
	
	/** 
	 * id 중복검사 위한 갯수 조회 
	 * @return int
	 * @throws Exception
	 */
	public int getCount(Member input) throws Exception;
	
	/** 
	 * 비밀번호 검사 위한 갯수 조회 
	 * @return int
	 * @throws Exception
	 */
	public int getCount2(Member input) throws Exception;
	
	/**
	 * id 조회하기
	 */
	public List<Member> findId(Member input) throws Exception;
	
	/**
	 * 비밀번호 재설정하기 
	 */
	public int editPw(Member input) throws Exception;
	
}
