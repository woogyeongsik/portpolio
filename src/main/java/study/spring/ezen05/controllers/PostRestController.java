package study.spring.ezen05.controllers;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import study.spring.ezen05.helper.PageData;
import study.spring.ezen05.helper.RegexHelper;
import study.spring.ezen05.helper.WebHelper;
import study.spring.ezen05.model.Post;
import study.spring.ezen05.service.BoardService;

import study.spring.ezen05.service.PostService;

@RestController
public class PostRestController {

	/** WebHelper 주입 */
	// -> import org.springframework.beans.factory.annotation.Autowired;
	// -> import study.spring.springhelper.helper.WebHelper;
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	// -> import study.spring.springhelper.helper.RegexHelper;
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	// -> import study.spring.springhelper.service.PostService;
	@Autowired
	PostService postService;
	
	BoardService boardService;
	


	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// -> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 목록 페이지 */
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public Map<String, Object>get_list(
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
		Post input = new Post();
		input.setSubject(keyword);
		

		List<Post> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = postService.getNoticeCount(input);
			// 페이지 번호 계산 --> 계산 결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Post.setOffset(pageData.getOffset());
			Post.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = postService.getNoticeList(input);
		} catch (Exception e) {
			return webHelper.getJsonError( e.getLocalizedMessage());
		}

		/** 3) JSON 처리 */
		Map<String, Object>data = new HashMap<String,Object>();
		data.put("keyword", keyword);
		data.put("output", output);
		data.put("pageData", pageData);

		return webHelper.getJsonData(data);
	}

	/** 상세 페이지 */
	@RequestMapping(value = "/board/{post_id}", method = RequestMethod.GET)
	public Map<String, Object>get_item(@PathVariable("post_id") int post_id){
	
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능 하므로 반드시 필수값으로 처리해야 한다.
		if (post_id == 0) {
			return webHelper.getJsonWarning( "게시글 번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Post input = new Post();
		input.setPost_id(post_id);

		// 조회결과를 저장할 객체 선언
		Post output = null;

		try {
			// 데이터 조회
			output = postService.getNoticeItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError( e.getLocalizedMessage());
		}

		/** 3) JSON 출력하기 */
		Map<String,Object>data = new HashMap<String, Object>();
		data.put("item", output);
		
		return webHelper.getJsonData(data);
	}


	/** 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/board", method = RequestMethod.POST)
	public Map<String,Object> post(
			@RequestParam(value = "board_id", defaultValue = "", required = false) int board_id,
			@RequestParam(value = "user_id", defaultValue = "", required = false) String user_id,
			@RequestParam(value = "subject", defaultValue = "", required = false) String subject,
			@RequestParam(value = "content", defaultValue = "", required = false) String content,
			@RequestParam(value = "post_pw", defaultValue = "", required = false) String post_pw,
			@RequestParam(value = "is_secret", defaultValue = "Y", required = false) String is_secret,
			@RequestParam(value = "hit", defaultValue = "0", required = false) int hit,
			@RequestParam(value = "reply_cnt", defaultValue = "", required = false) Integer reply_cnt,
			@RequestParam(value = "reg_date", defaultValue = "", required = false) Date reg_date,
			@RequestParam(value = "edit_date", defaultValue = "", required = false) Date edit_date,
			@RequestParam(value = "ip", defaultValue = "", required = false) String ip,
			@RequestParam(value = "refer", defaultValue = "0", required = false) Integer refer,
			@RequestParam(value = "level", defaultValue = "0", required = false) Integer level,
			@RequestParam(value = "order", defaultValue = "0", required = false) Integer order,
			@RequestParam(value = "post_del", defaultValue = "N", required = false) String post_del
			) {

		/** 1) 사용자가 입력한 파라미터 수신 및 유효성 검사 */

		// 학과 이름은 필수항목이므로 입력 여부를 검사.
		// 위치는 미필수(null허용)이므로 입력 여부를 검사하지 않는다.
		
		if (board_id== 0) {
			return webHelper.getJsonWarning( "게시판 번호를 입력하세요.");
		}
	
		if (subject == null) {
				return webHelper.getJsonWarning( "게시글 제목을 입력하세요.");	
		}
		
		if (content == null) {
			return webHelper.getJsonWarning("게시글 내용을 입력하세요.");
		}
		
		if (post_pw == null) {
			return webHelper.getJsonWarning("비밀번호 입력하세요.");
		}
		
		if (is_secret == null) {
			return webHelper.getJsonWarning("비밀글 여부를 선택하세요.");
		}
	
		if (post_del == null) {
			return webHelper.getJsonWarning( "게시글 삭제 여부를 입력하세요.");
		}
		
		/** 2) 데이터 저장하기 */
		// 저장 할 값들을 Beans에 담는다.
		Post input = new Post();
		input.setBoard_id(board_id);
		input.setUser_id(user_id);
		input.setSubject(subject);
		input.setContent(content);
		input.setPost_pw(post_pw);
		input.setIs_secret(is_secret);
		input.setHit(hit);
		input.setReply_cnt(reply_cnt);
		input.setReg_date(reg_date);
		input.setEdit_date(edit_date);
		input.setIp(ip);
		input.setRefer(refer);
		input.setLevel(level);
		input.setOrder(order);
		input.setPost_del(post_del);
		

		Post output = null;
		
		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			postService.addNotice(input);
			
			
			//데이터 조회
			output = postService.getNoticeItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError( e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한  JSON 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		
		Map<String, Object>map=new HashMap<String,Object>();
		map.put("item",output);
		return webHelper.getJsonData(map);
	}

	/** 수정 폼에 대한 action 페이지 */
	@RequestMapping(value = "/board", method = RequestMethod.PUT)
	public Map<String , Object> put(
			@RequestParam(value = "post_id", defaultValue = "", required = false) int post_id,
			@RequestParam(value = "board_id", defaultValue = "", required = false) int board_id,
			@RequestParam(value = "user_id", defaultValue = "", required = false) String user_id,
			@RequestParam(value = "subject", defaultValue = "", required = false) String subject,
			@RequestParam(value = "content", defaultValue = "", required = false) String content,
			@RequestParam(value = "post_pw", defaultValue = "", required = false) String post_pw,
			@RequestParam(value = "is_secret", defaultValue = "Y", required = false) String is_secret,
			@RequestParam(value = "hit", defaultValue = "0", required = false) int hit,
			@RequestParam(value = "reply_cnt", defaultValue = "", required = false) Integer reply_cnt,
			@RequestParam(value = "reg_date", defaultValue = "", required = false) Date reg_date,
			@RequestParam(value = "edit_date", defaultValue = "", required = false) Date edit_date,
			@RequestParam(value = "ip", defaultValue = "", required = false) String ip,
			@RequestParam(value = "refer", defaultValue = "0", required = false) Integer refer,
			@RequestParam(value = "level", defaultValue = "0", required = false) Integer level,
			@RequestParam(value = "order", defaultValue = "0", required = false) Integer order,
			@RequestParam(value = "post_del", defaultValue = "N", required = false) String post_del
			) {

		if (post_id == 0) {
			return webHelper.getJsonWarning( "게시글 번호가 없습니다.");
		}

		if (board_id== 0) {
			return webHelper.getJsonWarning( "게시판 번호를 입력하세요.");
		}
	
		if (subject == null) {
				return webHelper.getJsonWarning( "게시글 제목을 입력하세요.");	
		}
		
		if (content == null) {
			return webHelper.getJsonWarning("게시글 내용을 입력하세요.");
		}
		
		if (post_pw == null) {
			return webHelper.getJsonWarning("비밀번호 입력하세요.");
		}
		
		if (is_secret == null) {
			return webHelper.getJsonWarning("비밀글 여부를 선택하세요.");
		}
	
		if (post_del == null) {
			return webHelper.getJsonWarning( "게시글 삭제 여부를 입력하세요.");
		}

		/** 2) 데이터 수정하기 */
		// 수정할 값들을 Beans에 담는다.
		Post input = new Post();
		input.setPost_id(post_id);
		input.setBoard_id(board_id);
		input.setUser_id(user_id);
		input.setSubject(subject);
		input.setContent(content);
		input.setPost_pw(post_pw);
		input.setIs_secret(is_secret);
		input.setHit(hit);
		input.setReply_cnt(reply_cnt);
		input.setReg_date(reg_date);
		input.setEdit_date(edit_date);
		input.setIp(ip);
		input.setRefer(refer);
		input.setLevel(level);
		input.setOrder(order);
		input.setPost_del(post_del);
		
		Post output = null;
		
		try {
			// 데이터 수정
			postService.editNotice(input);
			
			output =postService.getNoticeItem(input);
			
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 수정할 대상을 상세 페이지에 알려주기 위해서 PK값을 전달해야한다.
	Map<String,Object>map =new HashMap<String,Object>();
	map.put("item", output);
		return webHelper.getJsonData(map);
	}

	/** 삭제 action 페이지 */
	@RequestMapping(value = "/Post", method = RequestMethod.DELETE)
	public Map<String,Object> delete(
			@RequestParam(value = "post_id", defaultValue = "0", required = false) int post_id) {

		if (post_id == 0) {
			return webHelper.getJsonWarning("게시글 일련번호가 없습니다.");
		}

		

		/** 2) 데이터 삭제하기 */
		// 삭제할 값들을 Beans에 담는다.
		Post input = new Post();
		input.setBoard_id(post_id);
		
		try {
			// 데이터 삭제
			postService.deleteNotice(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
		
		return webHelper.getJsonData();
	}
}