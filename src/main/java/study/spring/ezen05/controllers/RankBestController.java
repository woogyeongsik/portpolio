package study.spring.ezen05.controllers;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import study.spring.ezen05.helper.RegexHelper;
import study.spring.ezen05.helper.WebHelper;

import study.spring.ezen05.model.RankBest;
import study.spring.ezen05.service.RankBestService;


@Controller
public class RankBestController {

	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	RankBestService rankBestService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// -> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	@RequestMapping(value = "/totalRank.do", method = RequestMethod.GET)
	public ModelAndView totalRank(Locale locale, Model model) {
		RankBest input = new RankBest();

		List<RankBest> output = null; // 조회결과가 저장될 객체

		try {
			// 데이터 조회하기
			output = rankBestService.getTotalRankList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** View 처리 */
		model.addAttribute("output", output);

		return new ModelAndView("rankBest/totalRank");
	}

	@RequestMapping(value = "/rankBest-10.do", method = RequestMethod.GET)
	public ModelAndView teenRank(Locale locale, Model model) {
		RankBest input = new RankBest();

		List<RankBest> output = null; // 조회결과가 저장될 객체

		try {
			// 데이터 조회하기
			output = rankBestService.getTenRankList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** View 처리 */
		model.addAttribute("output", output);

		return new ModelAndView("rankBest/rankBest-10");
	}

	@RequestMapping(value = "/rankBest-20.do", method = RequestMethod.GET)
	public ModelAndView twentyRank(Locale locale, Model model) {
		RankBest input = new RankBest();

		List<RankBest> output = null; // 조회결과가 저장될 객체

		try {
			// 데이터 조회하기
			output = rankBestService.getTwentyRankList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** View 처리 */
		model.addAttribute("output", output);

		return new ModelAndView("rankBest/rankBest-20");
	}

	@RequestMapping(value = "/rankBest-30.do", method = RequestMethod.GET)
	public ModelAndView thirtyRank(Locale locale, Model model) {
		RankBest input = new RankBest();

		List<RankBest> output = null; // 조회결과가 저장될 객체

		try {
			// 데이터 조회하기
			output = rankBestService.getThirtyRankList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** View 처리 */
		model.addAttribute("output", output);

		return new ModelAndView("rankBest/rankBest-30");
	}

	@RequestMapping(value = "/rankBest-40.do", method = RequestMethod.GET)
	public ModelAndView fourthRank(Locale locale, Model model) {
		RankBest input = new RankBest();

		List<RankBest> output = null; // 조회결과가 저장될 객체

		try {
			// 데이터 조회하기
			output = rankBestService.getFortyRankList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** View 처리 */
		model.addAttribute("output", output);

		return new ModelAndView("rankBest/rankBest-40");
	}

	@RequestMapping(value = "/rankBest-50.do", method = RequestMethod.GET)
	public ModelAndView fiftyRank(Locale locale, Model model) {
		RankBest input = new RankBest();

		List<RankBest> output = null; // 조회결과가 저장될 객체

		try {
			// 데이터 조회하기
			output = rankBestService.getFiftyRankList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** View 처리 */
		model.addAttribute("output", output);

		return new ModelAndView("rankBest/rankBest-50");
	}

	@RequestMapping(value = "/rankBest-60.do", method = RequestMethod.GET)
	public ModelAndView sixtyRank(Locale locale, Model model) {
		RankBest input = new RankBest();

		List<RankBest> output = null; // 조회결과가 저장될 객체

		try {
			// 데이터 조회하기
			output = rankBestService.getSixtyRankList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** View 처리 */
		model.addAttribute("output", output);

		return new ModelAndView("rankBest/rankBest-60");
	}

	@RequestMapping(value = "/rankBest-F.do", method = RequestMethod.GET)
	public ModelAndView femaleRank(Locale locale, Model model) {
		RankBest input = new RankBest();

		List<RankBest> output = null; // 조회결과가 저장될 객체

		try {
			// 데이터 조회하기
			output = rankBestService.getFemaleRankList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** View 처리 */
		model.addAttribute("output", output);

		return new ModelAndView("rankBest/rankBest-F");
	}

	@RequestMapping(value = "/rankBest-M.do", method = RequestMethod.GET)
	public ModelAndView maleRank(Locale locale, Model model) {
		RankBest input = new RankBest();

		List<RankBest> output = null; // 조회결과가 저장될 객체

		try {
			// 데이터 조회하기
			output = rankBestService.getMaleRankList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** View 처리 */
		model.addAttribute("output", output);

		return new ModelAndView("rankBest/rankBest-M");
	}
}
