package study.spring.ezen05.controllers;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.ezen05.helper.WebHelper;
import study.spring.ezen05.model.SessionMember;
import study.spring.ezen05.service.SessionMemService;

@Slf4j
@RestController
public class SessionController {
	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	SessionMemService sessionMemService;
	
	/** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 세션을 저장하기 위한 action 페이지 */
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public Map<String, Object> sessionLogin(HttpServletRequest request,
			@RequestParam(value="user_id", defaultValue="") String userId,
			@RequestParam(value="user_pw", defaultValue="") String userPw) {
		
		/** 1) request 객체를 사용해서 세션 객체 만들기 & 유효성 검사 */
		HttpSession session = request.getSession();
		
		if (userId.equals("")) {
			return webHelper.getJsonWarning("아이디를 입력해주세요.");
		}
		
		if (userPw.equals("")) {
			return webHelper.getJsonWarning("비밀번호를 입력해주세요.");
		}
		
		/** 2) 세션 저장 */
		SessionMember input = new SessionMember();		
		
		// DB 이용하는 경우
		input.setUserId(userId);
		input.setUserPw(userPw);
		
		// 조회 결과를 저장할 객체 선언
		SessionMember output = null;
		
		try {
			// 데이터 조회
			output = sessionMemService.getSessionMemItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}			
		

		// 세션의 기록 정보를 로그로 남긴다.
		log.debug(String.format("(s) <-- %s = %s", "login_info", output));

		// 모든 조건을 충족할 경우 로그인 처리 -> 세션 생성
		session.setAttribute("login_info", output);
		// 세션 유효시간 설정(30분)
		session.setMaxInactiveInterval(60 * 30);				
		
		/* 세션에서 로그인 이전 페이지 값 받기 */ 
		String referer = (String) session.getAttribute("prevPage");		
		String directUrl = contextPath + "/";
		
		log.debug(referer);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("referer", referer);
		map.put("directUrl", directUrl);
		return webHelper.getJsonData(map);
	}
	
	/** 현재 사용자에 대한 모든 세션값을 일괄 삭제하기 위한 action 페이지 */
	@RequestMapping(value="/logout_ok.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request) {
		/** 1) request 객체를 사용해서 세션 객체 만들기 */
		HttpSession session = request.getSession();			
		
		/** 2) 세션 삭제 */		
		log.debug(String.format("(s) <-- delete all"));
		session.invalidate();
		
		String directUrl = contextPath + "/";
		return webHelper.redirect(directUrl, null);		
	}
	
}
