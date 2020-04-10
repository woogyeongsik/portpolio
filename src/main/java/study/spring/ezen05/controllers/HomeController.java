package study.spring.ezen05.controllers;


import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import study.spring.ezen05.helper.WebHelper;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
	
	@Autowired
	WebHelper webHelper;
	
	/** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * home(Locale locale, Model model) { return "home"; }
	 */

	/*
	 * @RequestMapping(value = "/searchPlace.do", method = RequestMethod.GET) public
	 * String searchPlace(Locale locale, Model model) { return
	 * "searchPlace/searchPlace"; }
	 */
	

	/*
	 * @RequestMapping(value = "/recommendPlace.do", method = RequestMethod.GET)
	 * public String recommend(Locale locale, Model model) { return
	 * "recmdPlace/recommendPlace"; }
	 */
	

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public ModelAndView login(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		/** 로그인 이전 페이지 정보 얻기 위해 referer 값 받아서 세션에 저장 */ 
		String referer = request.getHeader("referer");		
		session.setAttribute("prevPage", referer);
		
		// 세션 정보가 null이 아닐 때
		if (session.getAttribute("login_info") != null) {
			String redirectUrl = contextPath + "/";
			return webHelper.redirect(redirectUrl, "이미 로그인 된 상태입니다.");
		} else {
			return new ModelAndView ("login_join/login");
		}
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public ModelAndView join(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		// 세션 정보가 null이 아닐 때
		if (session.getAttribute("login_info") != null) {
			String redirectUrl = contextPath + "/";
			return webHelper.redirect(redirectUrl, "이미 로그인 된 상태입니다.");
		} else {
			return new ModelAndView ("login_join/join");
		}				
	}

	/**
	@RequestMapping(value = "/join_edit.do", method = RequestMethod.GET)
	public String joinEdit(Locale locale, Model model) {
		return "login_join/join_edit";
	}*/

	@RequestMapping(value = "/pw_check.do", method = RequestMethod.GET)
	public String pwCheck(Locale locale, Model model) {
		return "login_join/pw_check";
	}

	@RequestMapping(value = "/notice_list.do", method = RequestMethod.GET)
	public String noticeList(Locale locale, Model model) {
		return "notice/notice_list";
	}

	@RequestMapping(value = "/notice_view.do", method = RequestMethod.GET)
	public String noticeView(Locale locale, Model model) {
		return "notice/notice_view";
	}

	@RequestMapping(value = "/qna_list.do", method = RequestMethod.GET)
	public String qnaList(Locale locale, Model model) {
		return "qna/qna_list";
	}

	@RequestMapping(value = "/qna_add.do", method = RequestMethod.GET)
	public String qnaAdd(Locale locale, Model model) {
		return "qna/qna_add";
	}
	
	@RequestMapping(value = "/qna_add_ok.do", method = RequestMethod.POST)
	public String qnaAddOk(Locale locale, Model model) {
		return "qna/qna_add_ok";
	}
	
	@RequestMapping(value = "/qna_delete_ok.do", method = RequestMethod.POST)
	public String qnaDelete(Locale locale, Model model) {
		return "qna/qna_delete_ok";
	}
	
	@RequestMapping(value = "/qna_view.do", method = RequestMethod.GET)
	public String qnaView(Locale locale, Model model) {
		return "qna/qna_view";
	}
	
	@RequestMapping(value = "/qna_reply_view.do", method = RequestMethod.GET)
	public String qnaReply(Locale locale, Model model) {
		return "qna/qna_reply_view";
	}

	@RequestMapping(value = "/qna_edit.do", method = RequestMethod.GET)
	public String qnaEdit(Locale locale, Model model) {
		return "qna/qna_edit";
	}
	
	@RequestMapping(value = "/qna_edit_ok.do", method = RequestMethod.POST)
	public String qnaEditOk(Locale locale, Model model) {
		return "qna/qna_edit_ok";
	}

	@RequestMapping(value = "/findId.do", method = RequestMethod.GET)
	public String findId(Locale locale, Model model) {
		return "inc/findId";
	}

	@RequestMapping(value = "/findPw.do", method = RequestMethod.GET)
	public String findPw(Locale locale, Model model) {
		return "inc/findPw";
	}

	@RequestMapping(value = "/resetPw.do", method = RequestMethod.GET)
	public String resetPw(Locale locale, Model model) {
		return "inc/resetPw";
	}

	@RequestMapping(value = "/non_likePage.do", method = RequestMethod.GET)
	public String nonLikePage(Locale locale, Model model) {
		return "likePage/non-likePage";
	}

	@RequestMapping(value = "/my_qna.do", method = RequestMethod.GET)
	public String myQna(Locale locale, Model model) {
		return "myPage/my_qna";
	}

	@RequestMapping(value = "/nav_search.do", method = RequestMethod.GET)
	public String navSearch(Locale locale, Model model) {
		return "nav_search/nav_search";
	}

	@RequestMapping(value = "/nav_search_notice.do", method = RequestMethod.GET)
	public String navSearchNotice(Locale locale, Model model) {
		return "nav_search/nav_search_notice";
	}
	
	@RequestMapping(value = "/nav_search_place.do", method = RequestMethod.GET)
	public String navSearchPlace(Locale locale, Model model) {
		return "nav_search/nav_search_place";
	}
	
	@RequestMapping(value = "/nav_search_qna.do", method = RequestMethod.GET)
	public String navSearchQna(Locale locale, Model model) {
		return "nav_search/nav_search_qna";
	}

}
