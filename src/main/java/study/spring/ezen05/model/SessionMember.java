package study.spring.ezen05.model;

import lombok.Data;

@Data
public class SessionMember {
	private String userId;
	private String userPw;
	private String email;
}
