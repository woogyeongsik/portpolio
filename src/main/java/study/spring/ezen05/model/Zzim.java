package study.spring.ezen05.model;

import lombok.Data;

@Data
public class Zzim {
	private int id;
	private String user_id;
	private int pla_no;
	private int zzim_ok_not;
	private String reg_date;
	private String edit_date;
	private String check_null;
	/** 장소테이블과 Join */
	private String nm;
    private String addr;
    
	/** 페이징에 필요한 변수들 */
	
	private static int offset;
	private static int listCount; 

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Zzim.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Zzim.listCount = listCount;
	}
}
