package study.spring.ezen05.model;



import lombok.Data;


@Data
public class TestScoreByWoo {
	
	private int score;
	private int pla_no;
	private String nm;
	private String user_id;
	private String name;
	private String gender;
	private String birthdate;
	private float avg;
	private int age1;
	private int age2;
	
	// 3) 페이지 구현을 위한 static 변수
	  
	  /** 페이지 구현이 필요한 경우 아래 속성들을 추가한다. (static) */
	  /** LIMIT 절에서 사용할 조회 시작 위치 */
	  private static int offset;			// LIMIT 절에서 사용할 검색 시작 위치
	  
	  /** LIMIT 절에서 사용할 조회할 데이터 수 */
	  private static int listCount;			// LIMIT 절에서 사용할 검색할 데이터 수
	
	public static int getOffset() {
		return offset;
	}
	public static void setOffset(int offset) {
		TestScoreByWoo.offset = offset;
	}
	public static int getListCount() {
		return listCount;
	}
	public static void setListCount(int listCount) {
		TestScoreByWoo.listCount = listCount;
	}	
}
