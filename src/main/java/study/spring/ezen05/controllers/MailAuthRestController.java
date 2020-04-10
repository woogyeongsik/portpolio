package study.spring.ezen05.controllers;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.spring.ezen05.helper.MailHelper;
import study.spring.ezen05.helper.RegexHelper;
import study.spring.ezen05.helper.WebHelper;

@RestController
public class MailAuthRestController {
	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	RegexHelper regexHelper;
	
	@Autowired
	MailHelper mailHelper;
	
	/** 회원가입 이메일 인증번호 발송 */
	@RequestMapping(value="/sendAuth", method=RequestMethod.POST)
	public Map<String, Object> send(HttpServletRequest request,
			@RequestParam(value="email", defaultValue="") String to,
			String subject, String content) {
		
		/** 1) request 객체를 사용해서 세션 객체 만들기(인증번호 저장 위해) */
		HttpSession session = request.getSession();
		
		/** 입력여부 검사 후, 입력되지 않은 경우 이전 페이지로 보내기 */
		if(!regexHelper.isValue(to)) {
			return webHelper.getJsonWarning("이메일 주소를 입력하세요.");
		}
		
		if(!regexHelper.isEmail(to)) {
			return webHelper.getJsonWarning("올바른 이메일 주소가 아닙니다.");
		}		
		
		/** 난수번호 생성하기 */
		Random r = new Random();
		String authNum = "";
		for (int i = 0; i < 6; i++) {
			int num = r.nextInt(10);
			authNum += num;
		}		
		
		// 세션 생성 (세션에 인증번호 저장)
		session.setAttribute("auth", authNum);
		// 세션 유효시간 설정(3분)
		session.setMaxInactiveInterval(60 * 3);
		
		subject = "[헛둘, 헛둘] 이메일 인증번호";
		
		content = "<!doctype html>";
		content += "<html>";
		content += "<head>";
		content += "<meta charset='utf-8'>";
		content += "</head>";
		content += "<body>";
		content += "<div align='center' style='border:1px solid gray;'>";
		content += "<h2>인증번호 안내</h2>";		
		content += "<p>입력창에 아래의 인증번호를 입력해주세요.</p>";
		content += "<p>인증번호 : <strong>" + authNum + "</strong></p>";
		content += "</div>";
		content	+= "</body>";
		content += "</html>";
		
		/** 메일 발송 처리 */
		try {
			mailHelper.sendMail(to, subject, content);
			
		} catch (Exception e) {			
			e.printStackTrace();
			/*return webHelper.getJsonError("메일 발송에 실패했습니다.");*/
		}
		
		/** 결과처리 */
		return webHelper.getJsonData();
	}
	
	
	/* 인증번호 확인 */
	@RequestMapping(value="/checkAuth", method=RequestMethod.POST)
	public Map<String, Object> send(HttpServletRequest request,
			@RequestParam(value="emailAuth", defaultValue="") String emailAuth) {
		
		HttpSession session = request.getSession();
		
		if(!regexHelper.isValue(emailAuth)) {
			return webHelper.getJsonWarning("인증번호를 입력하세요.");
		}		

		// 인증번호 세션에 저장된 값 불러오기
		String checkNum = (String) session.getAttribute("auth");		
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("authCheck", checkNum);
		return webHelper.getJsonData(data);
		
	}
	
	
}
