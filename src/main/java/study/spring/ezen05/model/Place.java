package study.spring.ezen05.model;



import lombok.Data;

/** Join문 구조에 맞춘 Java Beans 생성 */
@Data
public class Place {
	// 1) 기본 컬럼

	private String type_nm;
	private int pla_no;
	private String nm;
	private String nm_gu;
	private String addr;
	private String newAddr;
	private String phone;
	private String tag;
	private String lati;
	private String longi;

	// 3) 페이지 구현을 위한 static 변수
	/** 페이지 구현을 필요한 경우 아래 속성들을 추가한다. (static) */
	private static int offset; // LIMIT 절에서 사용할 검색 시작 위치
	private static int listCount; // LIMIT 절에서 사용할 검색할 데이터 수

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Place.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Place.listCount = listCount;
	}

}
