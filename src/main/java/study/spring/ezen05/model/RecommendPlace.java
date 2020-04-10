package study.spring.ezen05.model;

import lombok.Data;

@Data
public class RecommendPlace {
	// 장소 이미지 경로
	private String path1;
	// 장소 이름
	private String nm;
	// 각 리뷰에 등록된 점수
	private String score;
	// 장소 번호
	private String pla_no;
	// 회원 아이디
	private String user_id;
	// 평균 리뷰 점수
	private float scoreAvg;
	// 리뷰 갯수
	private int countReview;
	// 위치한 지역(구)
	private String nm_gu;
	// 관심지역1
	private String area1;
	// 관심지역2
	private String area2;
	// 관심지역3
	private String area3;
}