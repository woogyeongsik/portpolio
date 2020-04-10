package study.spring.ezen05.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Board {
	//1) 기본 컬럼
	private int board_id; 
	private String board_name;
	private String board_desc; 
	private String board_type;  
	private String secret; 
	private String read_allow;
	private String write_allow; 
	private String reply_allow;
	private Date reg_date;
	private Date edit_date;
	private String board_del;
	
	
	// 페이지 구현을 위한 static 변수
	private static int offset;
	private static int listCount;
	public static int getOffset() {
		return offset;
	}
	public static void setOffset(int offset) {
		Board.offset = offset;
	}
	public static int getListCount() {
		return listCount;
	}
	public static void setListCount(int listCount) {
		Board.listCount = listCount;
	}

	

}
