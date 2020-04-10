package study.spring.ezen05.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import study.spring.ezen05.helper.WebHelper;
import study.spring.ezen05.model.Member;
import study.spring.ezen05.service.MemberService;

@RestController
public class FindController {
	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	MemberService memberService;
	
	/** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public ModelAndView findId(Model model,
			@RequestParam(value="name", defaultValue="") String name,
			@RequestParam(value="email", defaultValue="") String email) {
				
		/** 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Member input = new Member();
		input.setName(name);
		input.setEmail(email);
		
		// 조회결과를 저장할 객체 선언
		List<Member> output = null;		
		
		try {
			output = memberService.findId(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}		
		
		/*
		if (output.size() > 1) {
			
		}*/
		
		/** View 처리 */
		// model.addAttribute("output", output);				
		//return new ModelAndView("login_join/join_edit");
		return null;
	}
	
}
