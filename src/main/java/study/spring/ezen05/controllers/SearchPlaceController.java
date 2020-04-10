package study.spring.ezen05.controllers;

import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import study.spring.ezen05.helper.RegexHelper;
import study.spring.ezen05.helper.WebHelper;

@Slf4j
@Controller
public class SearchPlaceController {

	@Autowired
	WebHelper webHelper;

	@Autowired
	RegexHelper regexHelper;

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/searchPlace.do", method = RequestMethod.GET)
	public String searchPlace(Locale locale, Model model) {
		return "searchPlace/searchPlace";
	}
}
