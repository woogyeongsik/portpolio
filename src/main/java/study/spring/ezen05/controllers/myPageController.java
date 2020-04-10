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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.ezen05.helper.PageData;
import study.spring.ezen05.helper.RegexHelper;
import study.spring.ezen05.helper.WebHelper;
import study.spring.ezen05.model.Mypage;
import study.spring.ezen05.model.SessionMember;
import study.spring.ezen05.model.Zzim;
import study.spring.ezen05.service.ZzimService;
import study.spring.ezen05.service.myPage;


/**
 *
 * @author 우경식
 * @Description : This is controller of Mypage of us so that we can use the mypage.jsp via this page.
 *
 */

@Slf4j
@Controller
public class myPageController {

	@Autowired WebHelper webHelper;

	@Autowired RegexHelper regexHelper;

	@Autowired SqlSession sqlSession;

	@Autowired myPage mp;
	
	@Autowired ZzimService zzim_service;



	@Value("#{servletContext.contextPath}")
	String contextPath;


	@RequestMapping(value= "/commonMyPage.do" , method = RequestMethod.GET)
	public ModelAndView get_id(Model model,HttpServletRequest request) {

		Mypage input = new Mypage();

		HttpSession session = request.getSession();

		/** url을 통한 접속 방지 */
		if (session.getAttribute("login_info") == null) {
			String redirectUrl = contextPath + "/login.do";
			return webHelper.redirect(redirectUrl, "로그인이 필요한 기능입니다.");
		}

		SessionMember login_info = (SessionMember) session.getAttribute("login_info");
		System.out.println("-------------login_info 확인 : " + login_info);

		String user_id = login_info.getUserId();

		input.setUser_id(user_id);
		/** 결과를 담을 List */
		List<Mypage> output = null;

		/** 찜 리스트 */
		Zzim input2 = new Zzim();
		input2.setUser_id(user_id);
		List<Zzim> output2 = null;

		

		/** 페이징을 위한 변수 */
        int nowPage    = webHelper.getInt("pages", 1);       		    // 페이지 번호 (기본값 1)
        int nowPage2   = webHelper.getInt("page", 1);
        int totalCount = 0;												// 전체 게시글 수
        int totalCount1 = 0;											// 찜 전체 게시글 수
        int listCount  = 5;                          	          		// 한 페이지당 표시할 목록 수
        int pageCount  = 5;                                     		// 한 그룹당 표시할 페이지 번호 수

		PageData pageData = null;
		PageData pageData2 = null;

	try {
		/** 전체 페이지 번호 조회 */
		totalCount = mp.getPageCount(input);
        pageData = new PageData(nowPage, totalCount, listCount, pageCount);
		/** SQL의 리미트 절에서 사용할 필드 */
		Mypage.setOffset(pageData.getOffset());
		Mypage.setListCount(pageData.getListCount());

		/** 데이터 조회하기 */
		output = mp.getList_myPage(input);
		
		/** 찜 목록 조회하기 */
		totalCount1 = zzim_service.count_zzim(input2);
		pageData2 = new PageData(nowPage2, totalCount1, listCount, pageCount);
		Zzim.setOffset(pageData2.getOffset());
		Zzim.setListCount(pageData2.getListCount());
		
		/** 찜 목록 데이터 조회하기 */
		output2 = zzim_service.getZzimList(input2);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 찜 데이터 조회 결과"+ output2);

		if (output == null) {
			log.debug("output==null");
		}
		
		if (output2 == null) {
			log.debug("output2==null");
		}
		
		} catch (Exception e) {
			log.debug("데이터 처리에 실패했습니다.");
		}

		/** 3) View 처리하기 */
		model.addAttribute("output", output);
		model.addAttribute("output2", output2);
		model.addAttribute("pageData", pageData);
		model.addAttribute("pageData2", pageData2);



		return new ModelAndView("inc/commonMyPage");
	}


	/** MyQnA  목록 페이지 */
	@RequestMapping(value = "/myQnA.do", method = RequestMethod.GET)
	public ModelAndView mylist(Model model,HttpServletRequest request,
			@RequestParam(value = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(value = "page", defaultValue = "1", required = false) int nowPage) {

		HttpSession session = request.getSession();
		SessionMember login_info = (SessionMember) session.getAttribute("login_info");
		String userId = login_info.getUserId();


		// int nowPage = webHelper.getInt("page", 1);
		int totalCount = 0;
		int listCount = 10;
		int pageCount = 5;


		Mypage input = new Mypage();
		input.setSubject(keyword);
		input.setWriter(userId);

		List<Mypage> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = mp.getPageCount(input);
			// 페이지 번호 계산 --> 계산 결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Mypage.setOffset(pageData.getOffset());
			Mypage.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = mp.getMyQnAList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}


		model.addAttribute("output", output);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pageData", pageData);

		String viewPath = "/inc/commonMyPage";
		return new ModelAndView(viewPath);
	}
}


