package study.spring.ezen05.model;

import lombok.Data;

@Data
public class SearchPlace {
	private String path1;
	private String nm;
	private String pla_no;
	private int totalCount;
	private String nm_gu;
	private String tag;

	// 페이지 구현을 위한 static 변수
	private static int offset;
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		SearchPlace.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		SearchPlace.listCount = listCount;
	}
}