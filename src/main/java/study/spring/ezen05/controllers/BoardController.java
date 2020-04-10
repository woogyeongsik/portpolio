package study.spring.ezen05.controllers;

import java.sql.Date;
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
import study.spring.ezen05.model.Board;
import study.spring.ezen05.service.BoardService;

@Controller
public class BoardController {

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
	// -> import study.spring.springhelper.service.BoardService;
	@Autowired
	BoardService boardService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// -> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 목록 페이지 */
	@RequestMapping(value = "/board/manage_list.do", method = RequestMethod.GET)
	public ModelAndView list(Model model,
			@RequestParam(value = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(value = "page", defaultValue = "1", required = false) int nowPage
			
			) {

		/** 1) 필요한 변수값 생성 */
		// int nowPage = webHelper.getInt("page", 1);
		int totalCount = 0;
		int listCount = 10;
		int pageCount = 5;

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Board input = new Board();
		input.setBoard_name(keyword);

		List<Board> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = boardService.getBoardCount(input);
			// 페이지 번호 계산 --> 계산 결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Board.setOffset(pageData.getOffset());
			Board.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = boardService.getBoardList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		String viewPath = "board/manage_list";
		return new ModelAndView(viewPath);
	}

	/** 상세 페이지 */
	@RequestMapping(value = "/board/manage_view.do", method = RequestMethod.GET)
	public ModelAndView view(Model model,
			@RequestParam(value = "board_id", defaultValue = "0", required = false) int board_id) {

		/** 1) 필요한 대상에 대한 PK값 */

		// 이 값이 존재하지 않는다면 데이터 조회가 불가능 하므로 반드시 필수값으로 처리해야 한다.
		if (board_id == 0) {
			return webHelper.redirect(null, "게시판 일련번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Board input = new Board();
		input.setBoard_id(board_id);

		// 조회결과를 저장할 객체 선언
		Board output = null;

		try {
			// 데이터 조회
			output = boardService.getBoardItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("output", output);
		return new ModelAndView("board/manage_view");
	}

	/** 작성 폼 페이지 */
	@RequestMapping(value = "/board/manage_add.do", method = RequestMethod.GET)
	public ModelAndView add(Model model) {
		return new ModelAndView("board/manage_add");
	}

	/** 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/board/manage_add_ok.do", method = RequestMethod.POST)
	public ModelAndView add_ok(Model model,
			@RequestParam(value = "board_name", defaultValue = "", required = false) String board_name,
			@RequestParam(value = "board_desc", defaultValue = "", required = false) String board_desc,
			@RequestParam(value = "board_type", defaultValue = "", required = false) String board_type,
			@RequestParam(value = "secret", defaultValue = "", required = false) String secret,
			@RequestParam(value = "read_allow", defaultValue = "", required = false) String read_allow,
			@RequestParam(value = "write_allow", defaultValue = "", required = false) String write_allow,
			@RequestParam(value = "reply_allow", defaultValue = "", required = false) String reply_allow,
			@RequestParam(value = "reg_date", defaultValue = "", required = false) Date reg_date,
			@RequestParam(value = "edit_date", defaultValue = "", required = false) Date edit_date,
			@RequestParam(value = "board_del", defaultValue = "", required = false) String board_del) {

		/** 1) 사용자가 입력한 파라미터 수신 및 유효성 검사 */

		// 학과 이름은 필수항목이므로 입력 여부를 검사.
		// 위치는 미필수(null허용)이므로 입력 여부를 검사하지 않는다.
		if (board_name == null) {
			return webHelper.redirect(null, "게시판명을 입력하세요.");
		}

		if (board_type == null) {
			return webHelper.redirect(null, "게시글 작성 여부를 입력하세요.");
		}

		if (secret == null) {
			return webHelper.redirect(null, "게시판의 게시글 작성 여부를 입력하세요.");
		}

		if (read_allow == null) {
			return webHelper.redirect(null, "게시판의 게시글 작성 여부를 입력하세요.");
		}
		if (write_allow == null) {
			return webHelper.redirect(null, "게시판의 게시글 작성 여부를 입력하세요.");
		}
		if (reply_allow == null) {
			return webHelper.redirect(null, "게시판의 게시글 작성 여부를 입력하세요.");
		}

		if (reg_date == null) {
			return webHelper.redirect(null, "게시글 작성일자를 입력하세요.");
		}

		if (board_del == null) {
			return webHelper.redirect(null, "게시판 삭제 여부를 입력하세요.");
		}
		/** 2) 데이터 저장하기 */
		// 저장 할 값들을 Beans에 담는다.
		Board input = new Board();
		input.setBoard_name(board_name);
		input.setBoard_desc(board_desc);
		input.setBoard_type(board_type);
		input.setSecret(secret);
		input.setRead_allow(read_allow);
		input.setWrite_allow(write_allow);
		input.setReply_allow(reply_allow);
		input.setReg_date(reg_date);
		input.setEdit_date(edit_date);
		input.setBoard_del(board_del);

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			boardService.addBoard(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/board/manage_view.do?board_id=" + input.getBoard_id();
		return webHelper.redirect(redirectUrl, "게시판이 등록 되었습니다.");
	}

	/** 수정 폼 페이지 */
	@RequestMapping(value = "/board/board_edit.do", method = RequestMethod.GET)
	public ModelAndView edit(Model model,
			@RequestParam(value = "board_id", defaultValue = "0", required = false) int board_id) {

		// 이 값이 존재하지 않는다면 데이터 조회가 불가능 하므로 반드시 필수값으로 처리해야 한다.
		if (board_id == 0) {
			return webHelper.redirect(null, "게시판 일련번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Board input = new Board();
		input.setBoard_id(board_id);

		// 조회결과를 저장할 객체 선언
		Board output = null;

		try {
			output = boardService.getBoardItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) view 처리 */
		model.addAttribute("output", output);
		return new ModelAndView("board/manage_edit");
	}

	/** 수정 폼에 대한 action 페이지 */
	@RequestMapping(value = "/board/edit_ok.do", method = RequestMethod.POST)
	public ModelAndView edit_ok(Model model,
			@RequestParam(value = "board_id", defaultValue = "0", required = false) int board_id,
			@RequestParam(value = "board_name", defaultValue = "", required = false) String board_name,
			@RequestParam(value = "board_desc", defaultValue = "", required = false) String board_desc,
			@RequestParam(value = "board_type", defaultValue = "", required = false) String board_type,
			@RequestParam(value = "secret", defaultValue = "", required = false) String secret,
			@RequestParam(value = "read_allow", defaultValue = "", required = false) String read_allow,
			@RequestParam(value = "write_allow", defaultValue = "", required = false) String write_allow,
			@RequestParam(value = "reply_allow", defaultValue = "", required = false) String reply_allow,
			@RequestParam(value = "reg_date", defaultValue = "", required = false) Date reg_date,
			@RequestParam(value = "edit_date", defaultValue = "", required = false) Date edit_date,
			@RequestParam(value = "board_del", defaultValue = "", required = false) String board_del) {

		if (board_id == 0) {
			return webHelper.redirect(null, "게시판 일련번호가 없습니다.");
		}

		if (board_name == null) {
			return webHelper.redirect(null, "게시판명을 입력하세요.");
		}

		if (board_type == null) {
			return webHelper.redirect(null, "게시글 작성 여부를 입력하세요.");
		}

		if (secret == null) {
			return webHelper.redirect(null, "게시판의 게시글 작성 여부를 입력하세요.");
		}

		if (read_allow == null) {
			return webHelper.redirect(null, "게시판의 게시글 작성 여부를 입력하세요.");
		}
		if (write_allow == null) {
			return webHelper.redirect(null, "게시판의 게시글 작성 여부를 입력하세요.");
		}
		if (reply_allow == null) {
			return webHelper.redirect(null, "게시판의 게시글 작성 여부를 입력하세요.");
		}

		if (reg_date == null) {
			return webHelper.redirect(null, "게시글 작성일자를 입력하세요.");
		}

		if (board_del == null) {
			return webHelper.redirect(null, "게시판 삭제 여부를 입력하세요.");
		}
		/** 2) 데이터 수정하기 */
		// 수정할 값들을 Beans에 담는다.
		Board input = new Board();
		input.setBoard_id(board_id);
		input.setBoard_name(board_name);
		input.setBoard_desc(board_desc);
		input.setBoard_type(board_type);
		input.setSecret(secret);
		input.setRead_allow(read_allow);
		input.setWrite_allow(write_allow);
		input.setReply_allow(reply_allow);
		input.setReg_date(reg_date);
		input.setEdit_date(edit_date);
		input.setBoard_del(board_del);
		try {
			// 데이터 수정
			boardService.editBoard(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 수정할 대상을 상세 페이지에 알려주기 위해서 PK값을 전달해야한다.
		String redirectUrl = contextPath + "/board/view.do?board_id=" + input.getBoard_id();
		return webHelper.redirect(redirectUrl, "게시판 정보가 수정되었습니다.");
	}

	/** 삭제 action 페이지 */
	@RequestMapping(value = "/board/delete_ok.do", method = RequestMethod.GET)
	public ModelAndView delete_ok(Model model,
			@RequestParam(value = "board_id", defaultValue = "0", required = false) int board_id) {

		if (board_id == 0) {
			return webHelper.redirect(null, "게시판 일련번호가 없습니다.");
		}

		/** 2) 데이터 삭제하기 */
		// 삭제할 값들을 Beans에 담는다.
		Board input = new Board();
		input.setBoard_id(board_id);

		try {
			// 데이터 삭제
			boardService.deleteBoard(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동

		return webHelper.redirect(contextPath + "/board/list.do", "게시판이 삭제되었습니다.");
	}
}
