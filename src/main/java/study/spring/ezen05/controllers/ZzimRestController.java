package study.spring.ezen05.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import study.spring.ezen05.helper.RegexHelper;
import study.spring.ezen05.helper.WebHelper;
import study.spring.ezen05.model.SessionMember;
import study.spring.ezen05.model.Zzim;
import study.spring.ezen05.service.ZzimService;

@Slf4j
@RestController
public class ZzimRestController {

	@Autowired
	WebHelper webHelper;

	// --> import study.spring.ezen05.helper.RegexHelper;
	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** ZzimService 객체 주입 */
	@Autowired
	ZzimService zzimService;

	
	@RequestMapping(value = "/zzim_ok.do", method = RequestMethod.GET)
	public Map<String, Object> insert_zzim(HttpServletRequest request,
			@RequestParam(value = "ok", defaultValue = "1") int ok, @RequestParam(value = "nm") String nm)
			throws Exception {

		if (ok == 0) {
			return webHelper.getJsonError("찜할 데이터가 없습니다.");
		}

		if (nm == null) {
			return webHelper.getJsonError("조회할 장소가 없습니다.");
		}

		/** Login 세션 값 가져오기 */
		HttpSession session = request.getSession();
		SessionMember login_info = (SessionMember) session.getAttribute("login_info");

		/** 로그인한 user_id 값 가져오기 */
		String user_id = login_info.getUserId();
		log.info(">>>>>>>>>>>>>>>>>>>> 로그인한 아이디 : " + user_id);

		/** 최초 등록일자 설정 */
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String reg_date = format.format(date);
		log.info("현재 날짜 >>>>>>>>>>>>>>>>>>>" + reg_date);

		/** 모델 빈즈에 조회할 데이터 저장 */
		Zzim zzim = new Zzim();
		zzim.setZzim_ok_not(ok);
		zzim.setReg_date(reg_date);
		zzim.setEdit_date(reg_date);
		zzim.setNm(nm);
		zzim.setUser_id(user_id);
		/** pla_no 저장하기 */
		int pla_no = zzimService.find_pla_no(zzim);
		zzim.setPla_no(pla_no);

		try {
			zzimService.addZzim(zzim);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new NullPointerException("찜한 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		return webHelper.getJsonData();
	}

	
	@RequestMapping(value = "/zzim_update.do", method = RequestMethod.PUT)
	public Map<String, Object> update_zzim(HttpServletRequest request,
			@RequestParam(value = "nm") String nm) {

		if (nm == null) {
			return webHelper.getJsonError("조회할 장소가 없습니다.");
		}

		/** Login 세션 값 가져오기 */
		HttpSession session = request.getSession();
		SessionMember login_info = (SessionMember) session.getAttribute("login_info");

		/** 로그인한 user_id 값 가져오기 */
		String user_id = login_info.getUserId();
		log.info(">>>>>>>>>>>>>>>>>>>> 로그인한 아이디 : " + user_id);

		/** 최초 등록일자 설정 */
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String reg_date = format.format(date);
		log.info("현재 날짜 >>>>>>>>>>>>>>>>>>>" + reg_date);

		/** 모델 빈즈에 조회할 데이터 저장 */
		Zzim zzim = new Zzim();
		zzim.setNm(nm);
		zzim.setUser_id(user_id);
		
		
		/** pla_no 저장하기 */
		int pla_no = 0;
		try {
			pla_no = zzimService.find_pla_no(zzim);
		} catch (Exception e1) {
			e1.printStackTrace();
			log.error(e1.getLocalizedMessage());
		}
		zzim.setPla_no(pla_no);
		
		
		String exist_regdate = null;
		try {
			exist_regdate = zzimService.find_reg_date(zzim);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if (exist_regdate != null) {
			zzim.setEdit_date(reg_date);
		} else {
			zzim.setReg_date(reg_date);
			zzim.setEdit_date(reg_date);
		}
		
		int output=0;

		try {
			output = zzimService.updateZzim(zzim);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			return webHelper.getJsonError(e.getLocalizedMessage());
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("updatedCount", output);
		return webHelper.getJsonData(data);
	}

	
	@RequestMapping(value = "/zzim_count.do", method = RequestMethod.GET)
	public Map<String, Object> count_zzim(HttpServletRequest request) {

		/** Login 세션 값 가져오기 */
		HttpSession session = request.getSession();
		SessionMember login_info = (SessionMember) session.getAttribute("login_info");

		/** 로그인한 user_id 값 가져오기 */
		String user_id = login_info.getUserId();
		log.info(">>>>>>>>>>>>>>>>>>>> 로그인한 아이디 : " + user_id);


		/** 모델 빈즈에 조회할 데이터 저장 */
		Zzim zzim = new Zzim();
		zzim.setUser_id(user_id);
		
		

		int result = 0;


		try {
			result = zzimService.count_zzim(zzim);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			return webHelper.getJsonError(e.getLocalizedMessage());
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("count", result);
		return webHelper.getJsonData(data);
	}
	
	@RequestMapping(value = "/zzim_check.do", method = RequestMethod.GET)
	public Map<String, Object> check_zzim(HttpServletRequest request, 
		@RequestParam(value = "nm") String nm) {
		
		/** Login 세션 값 가져오기 */
		HttpSession session = request.getSession();
		SessionMember login_info = (SessionMember) session.getAttribute("login_info");
		
		/** 로그인한 user_id 값 가져오기 */
		String user_id = login_info.getUserId();
		log.info(">>>>>>>>>>>>>>>>>>>> 로그인한 아이디 : " + user_id);
		
		/** 최초 등록일자 설정 */
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String reg_date = format.format(date);
		log.info("현재 날짜 >>>>>>>>>>>>>>>>>>>" + reg_date);
		
		/** 모델 빈즈에 조회할 데이터 저장 */
		Zzim zzim = new Zzim();
		zzim.setUser_id(user_id);
		zzim.setNm(nm);
		zzim.setZzim_ok_not(1);
		zzim.setReg_date(reg_date);
		zzim.setEdit_date(reg_date);
		
		/** pla_no 저장하기 */
		int pla_no = 0;
		
		try {
			pla_no = zzimService.find_pla_no(zzim);
		} catch (Exception e1) {
			e1.printStackTrace();
			log.error(e1.getLocalizedMessage());
		}
		zzim.setPla_no(pla_no);
		
		Zzim output = null;
		
		try {
			output = zzimService.getZzim(zzim);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			return webHelper.getJsonError(e.getLocalizedMessage());
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", output);
		return webHelper.getJsonData(data);
	}
	
	
	/** 해당하는 아이디에 해당하는 장소가 DB에 있는지 조회 */
	@RequestMapping(value = "/zzim_find_place.do", method = RequestMethod.GET)
	public Map<String, Object> find_place(HttpServletRequest request, 
		@RequestParam(value = "nm") String nm) {
		
		/** Login 세션 값 가져오기 */
		HttpSession session = request.getSession();
		SessionMember login_info = (SessionMember) session.getAttribute("login_info");
		
		/** 로그인한 user_id 값 가져오기 */
		String user_id = login_info.getUserId();
		log.info(">>>>>>>>>>>>>>>>>>>> 로그인한 아이디 : " + user_id);
		
		
		/** 모델 빈즈에 조회할 데이터 저장 */
		Zzim zzim = new Zzim();
		zzim.setUser_id(user_id);
		zzim.setNm(nm);
		
		/** pla_no 저장하기 */
		int pla_no = 0;
		
		try {
			pla_no = zzimService.find_pla_no(zzim);
		} catch (Exception e1) {
			e1.printStackTrace();
			log.error(e1.getLocalizedMessage());
		}
		zzim.setPla_no(pla_no);
		
		Zzim output = null;
		String null_place = "null";
		
		try {
			output = zzimService.find_place(zzim);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			return webHelper.getJsonError(e.getLocalizedMessage());
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		
		Map<String, Object> data = new HashMap<String, Object>();
		
		if (output == null) {
			data.put("result", null_place);	
		} else if (output != null) {
			data.put("result", output);			
		}
		
		return webHelper.getJsonData(data);
	}
}
