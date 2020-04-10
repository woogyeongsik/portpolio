

package study.spring.ezen05.model;



import java.sql.Date;

import lombok.Data;



/** Join문 구조에 맞춘 Java Beans 생성 */
@Data
public class Score {
    // 1) 기본 컬럼
	/** 스코어넘버 (PK) */
	private int sco_no;
	/** 아이디 */
    private String user_id;
    /** 장소넘버 */
    private int pla_no;
    /** 장소평가점수 */
    private int score;
    /** 장소평가글 */
    private String comment;
    private String nm;
    
    
    private Date com_date;
    private Date edit_date;
    
    
    
    
    
    
 // 3) 페이지 구현을 위한 static 변수 
    /** 페이지 구현을 필요한 경우 아래 속성들을 추가한다. (static) */
    private static int offset;		// LIMIT 절에서 사용할 검색 시작 위치 
    private static int listCount;	// LIMIT 절에서 사용할 검색할 데이터 수 
	
    public static int getOffset() {
		return offset;
	}
	public static void setOffset(int offset) {
		Score.offset = offset;
	}
	public static int getListCount() {
		return listCount;
	}
	public static void setListCount(int listCount) {
		Score.listCount = listCount;
	}
    
    
	
    
	
    
    
}
