package study.spring.ezen05.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Mypage {
	
	private int pla_no;
	
	private String user_id;
	
	private int sco_no;
	
	private int score;
	
	private String comment;
	
	private String com_date;

	private String nm;
	
	private String edit_date;
	
	
/** myQnA  */
	
	private int board_id;
	
	private int post_id;
	
	private String writer;
	
	private Date post_regdate;
	
	private String subject;
	
	private int  hit;
		
	/** 페이징에 필요한 변수들 */
	
		private static int offset;
		private static int listCount; 

		public static int getOffset() {
			return offset;
		}

		public static void setOffset(int offset) {
			Mypage.offset = offset;
		}

		public static int getListCount() {
			return listCount;
		}

		public static void setListCount(int listCount) {
			Mypage.listCount = listCount;
		}
}
