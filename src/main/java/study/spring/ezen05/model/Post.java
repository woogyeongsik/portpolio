package study.spring.ezen05.model;

import java.sql.Date;
import lombok.Data;

@Data
public class Post {
	private int board_id;
	private int post_id;
	private String user_id;
	private String subject;
	private String content;
	private String post_pw;
	private String is_secret;
	private int hit;
	private Integer reply_cnt;
	private Date reg_date;
	private Date edit_date;
	private String ip;
	private Integer refer;
	private Integer level;
	private Integer order;
	private String post_del;
	
	
	private String board_name;

	
	private static int offset;
	private static int listCount;
	public static int getOffset() {
		return offset;
	}
	public static void setOffset(int offset) {
		Post.offset = offset;
	}
	public static int getListCount() {
		return listCount;
	}
	public static void setListCount(int listCount) {
		Post.listCount = listCount;
	}

	
}