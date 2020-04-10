package study.spring.ezen05.model;

import java.sql.Date;
import lombok.Data;

@Data
public class Comment {
	private int cmt_id;
	private int post_id;
	private int board_id;
	private String user_id;
	private String cmt_content;
	private Date cmt_regdate;
	private Date cmt_editdate;
	private String cmt_del;
	

	private static int offset;
	private static int listCount;
	public static int getOffset() {
		return offset;
	}
	public static void setOffset(int offset) {
		Comment.offset = offset;
	}
	public static int getListCount() {
		return listCount;
	}
	public static void setListCount(int listCount) {
		Comment.listCount = listCount;
	}


}
