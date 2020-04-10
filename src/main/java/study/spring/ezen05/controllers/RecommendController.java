package study.spring.ezen05.controllers;

import java.util.List;
import java.util.Locale;

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
import study.spring.ezen05.helper.WebHelper;
import study.spring.ezen05.model.RecommendPlace;
import study.spring.ezen05.model.SessionMember;
import study.spring.ezen05.service.RecommendPlaceService;

@Slf4j
@Controller
public class RecommendController {
	@Autowired
	WebHelper webHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	RecommendPlaceService recommendPlaceService;

	@Autowired
	SqlSession sqlSession;

	/** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	@RequestMapping(value = "/recommendPlace.do", method = RequestMethod.GET)
	public ModelAndView recommend(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();

		RecommendPlace input = new RecommendPlace();

		List<RecommendPlace> output = null; // 조회결과가 저장될 객체

		if (session.getAttribute("login_info") == null) {
			String redirectUrl = contextPath + "/login.do";
			return webHelper.redirect(redirectUrl, "로그인이 필요한 기능입니다.");
		}

		SessionMember login_info = (SessionMember) session.getAttribute("login_info");
		System.out.println("-------------login_info 확인 : " + login_info);

		String user_id = login_info.getUserId();
		System.out.println("----------user_id확인 :" + user_id);

		input.setUser_id(user_id);
		String real_user_id = input.getUser_id();
		System.out.println("----------real_user_id확인 :" + real_user_id);

		try {
			// 데이터 조회하기
			output = recommendPlaceService.getSelectList(input);

			if (output == null) {
				log.debug("output==null");
			}

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** View 처리 */
		model.addAttribute("output", output);

		return new ModelAndView("recmdPlace/recommendPlace");
	}
}
