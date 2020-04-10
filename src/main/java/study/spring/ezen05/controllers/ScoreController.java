package study.spring.ezen05.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.ezen05.helper.RegexHelper;
import study.spring.ezen05.helper.WebHelper;
import study.spring.ezen05.model.SessionMember;
import study.spring.ezen05.model.TestScoreByWoo;
import study.spring.ezen05.service.Rank;

@Slf4j
@Controller
public class ScoreController {

	@Autowired WebHelper webHelper;
	/** RegexHelper 주입 */
	// ---> import study.spring.ezen05.helper.RegexHelper;
	@Autowired RegexHelper regexHelper;
	
	@Autowired Rank rank;
	
	@Autowired SqlSession sqlSession;
	
	/** "/프로젝트 이름"에 해당하는 ContextPath 변수 주입 */
	// ---> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView Img(Model model,HttpServletRequest request) {
		// 데이터 조회하기
		TestScoreByWoo input = new TestScoreByWoo();
		// 조회결과가 저장될 객체 저장하기
		List<TestScoreByWoo> output = null;
		// 10대 조회결과
		List<TestScoreByWoo> output1 = null;
		// 남자 조회결과
		List<TestScoreByWoo> output2 = null;
		
		
		
		try {
		// 데이터 조회하기
		output = rank.getScore(input);
		output1 = rank.getScore_ten(input);
		output2 = rank.getScore_man(input);
		log.debug(">>>>>>>>>>>>>MyBatis가 정상적으로 실행되었습니다."+ output);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리하기 */
		model.addAttribute("output", output);
		model.addAttribute("output1", output1);
		model.addAttribute("output2", output2);
		
		return new ModelAndView("home");
	}
}
