package study.spring.ezen05.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import lombok.extern.slf4j.Slf4j;
import study.spring.ezen05.helper.RegexHelper;
import study.spring.ezen05.helper.WebHelper;
import study.spring.ezen05.model.TestScoreByWoo;
import study.spring.ezen05.service.Rank;


@Slf4j
@RestController
public class RankRestfulController {

	
	
	@Autowired WebHelper webHelper;
	
	
	
	/** RegexHelper 주입 */
	// --> import study.spring.ezen05.helper.RegexHelper;
	@Autowired RegexHelper regexHelper;
	
	
	
	/** Service 패턴 구현체 주입 */
	// --> import study.spring.ezen05.service.testScoreService;
	@Autowired Rank rank;

	
	
	
	
	/** 목록 페이지 */
	
	@RequestMapping(value = "/testScore", method = RequestMethod.GET)
	public Map<String, Object> get_list() {
		
		List<TestScoreByWoo> output = null;		// 조회 결과가 저장될 객체
		TestScoreByWoo input = new TestScoreByWoo();
	
		
		try {
			// 데이터 조회하기
			output = rank.getScore(input);
			System.out.println(output);

		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);
		
		System.out.println(data);
		return webHelper.getJsonData(data);
		
		}
	
	@RequestMapping(value = "/getgender/{gender}", method = RequestMethod.GET)
	public Map<String, Object> get_item(@PathVariable("gender") String gender) {
		
		
		if (gender == null) {
			return webHelper.getJsonError("조회할 성별이 존재하지 않습니다.");
		}
		// 데이터 조회하기
		TestScoreByWoo input = new TestScoreByWoo();
		input.setGender(gender);
		
		// 조회결과를 저장할 객체 생성
		List<TestScoreByWoo> output = null;		// 조회 결과가 저장될 객체
		
		try {
			// 데이터 조회
			output = rank.getGenderItem(input);
			log.debug("Json 데이터 조회에 성공하였습니다.");
		} catch (Exception e) {
			log.debug("Json 데이터조회에 실패했습니다.");
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3) JSON 출력하기 */	
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);
		
		System.out.println(data);
		return webHelper.getJsonData(data);
	}
	
	@RequestMapping(value = "/getage/{age1},{age2}", method = RequestMethod.GET)
	public Map<String, Object> get_age(@PathVariable("age1") int age1, @PathVariable("age2") int age2) {
		
		
		if (age1 == 0 || age2 == 0) {
			return webHelper.getJsonError("조회할 연령대가 존재하지 않습니다.");
		}
		
		System.out.println(age1);
		System.out.println(age2);
		// 데이터 조회하기
		TestScoreByWoo input = new TestScoreByWoo();
		input.setAge1(age1);
		input.setAge2(age2);
		
		// 조회결과를 저장할 객체 생성
		List<TestScoreByWoo> output = null;		// 조회 결과가 저장될 객체
		
		try {
			// 데이터 조회
			output = rank.getAgeItem(input);
			log.debug("Json 데이터 조회에 성공하였습니다.");
		} catch (Exception e) {
			log.debug("Json 데이터조회에 실패했습니다.");
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3) JSON 출력하기 */	
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);
		
		System.out.println(data);
		return webHelper.getJsonData(data);
	}	
}

