 package study.spring.ezen05.controllers;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import study.spring.ezen05.helper.PageData;
import study.spring.ezen05.helper.RegexHelper;
import study.spring.ezen05.helper.WebHelper;

import study.spring.ezen05.model.Score;


import study.spring.ezen05.service.ScoreService;


@RestController
public class PageRestController {

	@Autowired
	WebHelper webHelper;

	@Autowired
	RegexHelper regexHelper;

	@Autowired
	ScoreService scoreService;

	/** 목록 페이지 */
	@RequestMapping(value = "/page", method = RequestMethod.GET)
	public Map<String, Object> get_list(
			@RequestParam(value = "nm", defaultValue = "", required = false) String nm,
			@RequestParam(value = "user_id", defaultValue = "", required = false) String user_id) {

		/** 데이터 조회하기 */
		Score input = new Score();
		input.setNm(nm);
		input.setUser_id(user_id);
		
		List<Score> output = null; // 조회결과가 저장될 객체
		

		try {
			// 데이터 조회하기
			output = scoreService.getScoreJsonList(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();

		data.put("item", output);
		
		return webHelper.getJsonData(data);
	}
	
	/** 상세 페이지 */
	@RequestMapping(value = "/page/{sco_no}", method = RequestMethod.GET)
	public Map<String, Object> get_item(@PathVariable("sco_no") int sco_no) {

		// 이 값이 존재하지 않는다면 데이터 조회가 불가능 하므로 반드시 필수값으로 처리해야 한다.
		if (sco_no == 0) {
			return webHelper.getJsonWarning("장소번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Score input = new Score();
		input.setSco_no(sco_no);

		// 조회결과를 저장할 객체 선언
		Score output = null;

		try {
			// 데이터 조회
			output = scoreService.getScoreItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);

		return webHelper.getJsonData(data);
	}
	
	/** 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/page", method = RequestMethod.POST)
	public Map<String, Object> post(
			@RequestParam(value = "user_id", defaultValue = "", required = false) String user_id,
			@RequestParam(value = "pla_no", defaultValue = "0", required = false) int pla_no,
			@RequestParam(value = "score", defaultValue = "0", required = false) int score,
			@RequestParam(value = "comment", defaultValue = "", required = false) String comment
			) {

		/** 1) 사용자가 입력한 파라미터 수신 및 유효성 검사 */

		// 교수 이름은 필수항목이므로 입력 여부를 검사.
		// 위치는 미필수(null허용)이므로 입력 여부를 검사하지 않는다.
		if (user_id == null) {
			return webHelper.getJsonWarning("아이디를 입력하세요.");
		}
		if (!regexHelper.isEngNum(user_id)) {
			return webHelper.getJsonWarning("아이디는  영어와 숫자로만 가능합니다.");
		}
		
		if (pla_no == 0) {
			return webHelper.getJsonWarning("장소 번호를 입력하세요.");
		}
		if (score == 0) {
			return webHelper.getJsonWarning("점수를 입력해주세요.");
		}
		if (comment == "" ) {
			return webHelper.getJsonWarning("장소에 대한 평가를 남겨주세요.");
		}
		
		/** 2) 데이터 저장하기 */
		// 저장 할 값들을 Beans에 담는다.
		Score input = new Score();
		
		input.setUser_id(user_id);
		input.setPla_no(pla_no);
		input.setScore(score);
		input.setComment(comment);
		

		// 저장된 결과를 조회하기 위한 객체
		Score output = null;

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			scoreService.addScore(input);

			// 데이터 조회
			output = scoreService.getScoreItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);

		return webHelper.getJsonData(map);

	}
	
	/** 수정 폼에 대한 action 페이지 */
	@RequestMapping(value = "/page", method = RequestMethod.PUT)
	public Map<String, Object> put(			
			@RequestParam(value = "sco_no", defaultValue = "0", required = false) int sco_no,
			@RequestParam(value = "score", defaultValue = "0", required = false) int score,
			@RequestParam(value = "comment", defaultValue = "", required = false) String comment) {

		/** 1) 사용자가 입력한 파라미터 수신 및 유효성 검사 */

		// 교수 이름은 필수항목이므로 입력 여부를 검사.
		// 위치는 미필수(null허용)이므로 입력 여부를 검사하지 않는다.
		if (sco_no == 0) {
			return webHelper.getJsonWarning("점수 번호가 없습니다..");
		}
		
		if (score == 0) {
			return webHelper.getJsonWarning("점수를 입력해주세요.");
		}
		if (comment == "") {
			return webHelper.getJsonWarning("장소평가를 입력하세요.");
		}

		/** 2) 데이터 저장하기 */
		// 저장 할 값들을 Beans에 담는다.
		Score input = new Score();
		
		input.setSco_no(sco_no);
		input.setScore(score);
		input.setComment(comment);
		
		

		Score output = null;

		try {
			// 데이터 수정
			scoreService.editScore(input);

			// 데이터 조회
			output = scoreService.getScoreItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		// 수정할 대상을 상세 페이지에 알려주기 위해서 PK값을 전달해야한다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);

		return webHelper.getJsonData(map);
	}

	/** 삭제 처리 */
	@RequestMapping(value = "/page", method = RequestMethod.DELETE)
	public Map<String, Object> delete(
			@RequestParam(value = "sco_no", defaultValue = "0", required = false) int sco_no) {
		
		if (sco_no == 0) {
			return webHelper.getJsonWarning("점수번호가 없습니다.");
		}

		/** 2) 데이터 삭제하기 */
		// 삭제할 값들을 Beans에 담는다.
		Score input = new Score();
		input.setSco_no(sco_no);

		try {
			// 데이터 삭제
			scoreService.deleteScore(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동

		return webHelper.getJsonData();
	}

}
