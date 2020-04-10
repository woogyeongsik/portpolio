package study.spring.ezen05.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.ezen05.helper.PageData;
import study.spring.ezen05.helper.RegexHelper;
import study.spring.ezen05.helper.WebHelper;
import study.spring.ezen05.model.Place;
import study.spring.ezen05.service.PlaceService;
import study.spring.ezen05.service.PlaceService;

@Controller
public class PlaceController {

	/** WebHelper 주입 */
	// -> import org.springframework.beans.factory.annotation.Autowired;
	// -> import study.spring.ezen05.helper.WebHelper;
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	// -> import study.spring.ezen05.helper.RegexHelper;
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	// -> import study.spring.ezen05.service.PlaceService;
	@Autowired
	PlaceService placeService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// -> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 목록 페이지 **/
	@RequestMapping(value = "/place/list.do", method = RequestMethod.GET)
	public ModelAndView list(Model model,
			@RequestParam(value = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(value = "page", defaultValue = "1", required = false) int nowPage
			
			) {

		/** 1) 필요한 변수값 생성 */
		//int nowPage = webHelper.getInt("page", 1);
		int totalCount = 0;
		int listCount = 10;
		int pageCount = 5;

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Place input = new Place();
		

		List<Place> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = placeService.getPlaceCount(input);
			// 페이지 번호 계산 --> 계산 결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Place.setOffset(pageData.getOffset());
			Place.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = placeService.getPlaceList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		String viewPath = "place/list";
		return new ModelAndView(viewPath);
	}

	

	
}
