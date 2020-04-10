package study.spring.ezen05.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.ezen05.helper.RegexHelper;
import study.spring.ezen05.helper.WebHelper;
import study.spring.ezen05.model.Member;
import study.spring.ezen05.model.SessionMember;
import study.spring.ezen05.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	RegexHelper regexHelper;
	
	@Autowired
	MemberService memberService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;	
	
	/** 회원정보 저장 */
	@RequestMapping(value="/join_ok.do", method=RequestMethod.POST)
	public ModelAndView add_ok(Model model,
			@RequestParam(value="user_id", defaultValue="") String userId,
			@RequestParam(value="name", defaultValue="") String name,
			@RequestParam(value="user_pw", defaultValue="") String userPw,
			@RequestParam(value="email", defaultValue="") String email,
			@RequestParam(value="gender", defaultValue="") String gender,
			@RequestParam(value="birthdate", defaultValue="") String birthdate,
			@RequestParam(value="tel", defaultValue="") String tel,
			@RequestParam(value="postcode", defaultValue="") String postcode,
			@RequestParam(value="address1", defaultValue="") String address1,			
			@RequestParam(value="address3", defaultValue="") String address3,
			@RequestParam(value="area1", defaultValue="") String area1,
			@RequestParam(value="area2", defaultValue="") String area2,
			@RequestParam(value="area3", defaultValue="") String area3
			)  {
		
		/** 유효성 검사 */
		if(userId.equals("")) {
			return webHelper.redirect(null, "아이디를 입력해주세요.");
		}
		
		if(postcode.equals("")) {
			return webHelper.redirect(null, "우편번호를 입력해주세요.");
		}	
		
		Member input = new Member();
		
		input.setUserId(userId);
		input.setName(name);
		input.setUserPw(userPw);
		input.setEmail(email);
		input.setBirthdate(birthdate);
		input.setTel(tel);
		input.setGender(gender);
		input.setPostcode(postcode);
		input.setAddress1(address1);		
		input.setAddress3(address3);
		input.setArea1(area1);
		input.setArea2(area2);
		input.setArea3(area3);
		
		try {
			memberService.addMember(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String redirectUrl = contextPath + "/login.do";
		return webHelper.redirect(redirectUrl, "회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.");
		
	}	
	
	/** 회원정보 수정 */
	@RequestMapping(value = "/join_edit.do", method = RequestMethod.GET)
	public ModelAndView edit(Model model, HttpServletRequest request) {
		
		/** session에서 id 정보 가져오기 */
		HttpSession session = request.getSession();
		
		if (session.getAttribute("login_info") == null) {
			String redirectUrl = contextPath + "/login.do";
			return webHelper.redirect(redirectUrl, "로그인이 필요한 기능입니다.");
		}
		
		SessionMember login_info = (SessionMember) session.getAttribute("login_info");		
		
		String userId = login_info.getUserId();		
		
		/** 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Member input = new Member();
		input.setUserId(userId);
		
		// 조회결과를 저장할 객체 선언
		Member output = null;
		
		// 관심지역 선택을 위한 배열 생성
		String[] region = {"강남구", "강동구", "강서구", "강북구", "관악구", "광진구", "구로구", "금천구",
				"노원구", "동대문구", "도봉구", "동작구", "마포구", "서대문구", "성동구", "성북구", "서초구",
				"송파구", "영등포구", "용산구", "양천구", "은평구", "종로구", "중구", "중랑구"};
		
		try {
			output = memberService.getMember(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}		
		
		/** View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("region", region);		
		return new ModelAndView("login_join/join_edit");
	}
	
	/** 회원정보 수정 action 페이지 */
	@RequestMapping(value="/edit_ok.do", method=RequestMethod.POST)
	public ModelAndView edit_ok(Model model,
			@RequestParam(value="user_id", defaultValue="") String userId,
			@RequestParam(value="name", defaultValue="") String name,
			@RequestParam(value="user_pw", defaultValue="") String userPw,
			@RequestParam(value="email", defaultValue="") String email,
			@RequestParam(value="gender", defaultValue="") String gender,
			@RequestParam(value="birthdate", defaultValue="") String birthdate,
			@RequestParam(value="tel", defaultValue="") String tel,
			@RequestParam(value="postcode", defaultValue="") String postcode,
			@RequestParam(value="address1", defaultValue="") String address1,			
			@RequestParam(value="address3", defaultValue="") String address3,
			@RequestParam(value="area1", defaultValue="") String area1,
			@RequestParam(value="area2", defaultValue="") String area2,
			@RequestParam(value="area3", defaultValue="") String area3
			)  {
		
		/** 유효성 검사 */
		if(userPw.equals("")) {
			return webHelper.redirect(null, "비밀번호를 입력해주세요.");
		}
		
		if(postcode.equals("")) {
			return webHelper.redirect(null, "우편번호를 입력해주세요.");
		}	
		
		Member input = new Member();
		
		input.setUserId(userId);
		input.setName(name);
		input.setUserPw(userPw);
		input.setEmail(email);
		input.setBirthdate(birthdate);
		input.setTel(tel);
		input.setGender(gender);
		input.setPostcode(postcode);
		input.setAddress1(address1);		
		input.setAddress3(address3);
		input.setArea1(area1);
		input.setArea2(area2);
		input.setArea3(area3);
		
		try {
			memberService.editMember(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String redirectUrl = contextPath + "/";
		return webHelper.redirect(redirectUrl, "회원정보 수정이 완료되었습니다.");
		
	}	
}
