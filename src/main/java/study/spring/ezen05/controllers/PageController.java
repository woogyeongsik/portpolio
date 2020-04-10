package study.spring.ezen05.controllers;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.ezen05.helper.MailHelper;
import study.spring.ezen05.helper.PageData;
import study.spring.ezen05.helper.RegexHelper;
import study.spring.ezen05.helper.RetrofitHelper;
import study.spring.ezen05.helper.WebHelper;
import study.spring.ezen05.model.Score;
import study.spring.ezen05.service.PlaceService;
import study.spring.ezen05.service.ScoreService;
import study.spring.ezen05.model.Place;

/**
 * Handles requests for the application home page.
 */

@Controller
public class PageController {

	// --> import study.spring.ezen05.helper.WebHelper;
	@Autowired
	WebHelper webHelper;

	// --> import study.spring.ezen05.helper.RegexHelper;
	@Autowired
	RegexHelper regexHelper;

	// --> import study.spring.ezen05.helper.MailHelper;
	@Autowired
	MailHelper mailHelper;

	@Autowired
	ScoreService scoreService;

	@Autowired
	PlaceService placeService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// -> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;



	/** 페이지  */
	@RequestMapping(value = "/page.do", method = RequestMethod.GET)
	public ModelAndView list(Model model,

			@RequestParam(value = "page", defaultValue = "1", required = false) int nowPage,
			@RequestParam(value = "nm", defaultValue = "경복궁", required = false) String nm) {

		if (nm == null) {
			return webHelper.redirect(null, "장소이름이 없습니다.");}

		/** 1) 필요한 변수값 생성 */

		int totalCount = 0;
		int listCount = 5;
		int pageCount = 5;

		float totalAvg = 0;

		/** 2) 데이터 조회하기 */
		Score input = new Score();
		input.setNm(nm);

		Place placeipt = new Place();
		placeipt.setNm(nm);


		Place placeotp = null;
		List<Score> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = scoreService.getScoreCount(input);
			totalAvg = scoreService.getScoreAvg(input);

			// 페이지 번호 계산 --> 계산 결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Score.setOffset(pageData.getOffset());
			Score.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = scoreService.getScoreList(input);
			placeotp = placeService.getPlaceItem(placeipt);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */

		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalAvg", totalAvg);
		model.addAttribute("output", output);
		model.addAttribute("placeotp", placeotp);

		model.addAttribute("pageData", pageData);

		return new ModelAndView("page/page");
	}

}
