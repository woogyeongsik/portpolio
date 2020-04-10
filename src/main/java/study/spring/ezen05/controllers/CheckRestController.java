package study.spring.ezen05.controllers;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.spring.ezen05.helper.RegexHelper;
import study.spring.ezen05.helper.WebHelper;
import study.spring.ezen05.model.Member;
import study.spring.ezen05.model.SessionMember;
import study.spring.ezen05.service.MemberService;

@RestController
public class CheckRestController {
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	RegexHelper regexHelper;
	
	@Autowired
	MemberService memberService;

	/** id 중복검사를 위한 action 페이지 */
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public Map<String, Object> id_check(
		@RequestParam(value="user_id", defaultValue="") String userId
		) {
		
		/** id 유효성 검사 */
		if(userId.equals("")) {
			return webHelper.getJsonWarning("아이디를 입력해주세요.");
		}
		
		if(!regexHelper.isEngNum(userId)) {
			return webHelper.getJsonWarning("아이디는 영어와 숫자로만 가능합니다.");
		}
		
		if(userId.length() < 4 || userId.length() > 20) {
			return webHelper.getJsonWarning("아이디는 4~20자까지만 가능합니다.");
		}
		
		Member input = new Member();
		
		input.setUserId(userId);
		
		// 조회 결과가 저장될 변수 선언
		int check = 0;
		
		try {
			check = memberService.getCount(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}		
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("count", check);
		return webHelper.getJsonData(data);
	}
	
	/** 회원정보 수정을 위한 비밀번호 확인 (세션값으로 확인) */
	@RequestMapping(value="/pwCheck", method=RequestMethod.POST)
	public Map<String, Object> pw_check(HttpServletRequest request,
		@RequestParam(value="user_pw", defaultValue="") String userPw
		) {
		
		HttpSession session = request.getSession();
		
		/** 유효성 검사 */
		if(userPw.equals("")) {
			return webHelper.getJsonWarning("비밀번호를 입력해주세요.");
		}
		
		// 인증번호 세션에 저장된 값 불러오기
		/**SessionMember pw = (SessionMember)session.getAttribute("login_info");
		
		String pwCheck = pw.getUserPw();		
				
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pwCheck", pwCheck);
		return webHelper.getJsonData(data); */
		
		// 세션 id + 사용자 입력 비밀번호 둘 다 일치하는게 있는 경우 수정 페이지로 넘어가게 하기
		// 비밀번호 암호화 되는 경우를 생각해서
		SessionMember get = (SessionMember)session.getAttribute("login_info");
		
		// 세션에 저장된 id 가져오기
		String checkId = get.getUserId();
		
		Member input = new Member();
		
		input.setUserId(checkId);
		input.setUserPw(userPw);	
		
		// 조회 결과가 저장될 변수 선언
		int pwCheck = 0;
		
		try {
			pwCheck = memberService.getCount2(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}		
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pwCheck", pwCheck);
		//data.put("sesId", checkId);
		return webHelper.getJsonData(data);	
		
	}
	
}
