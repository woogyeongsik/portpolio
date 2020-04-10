package study.spring.ezen05.service;

import java.util.List;

import study.spring.ezen05.model.Mypage;

public interface myPage {
	
	/**
	 * @author 우경식 
	 * @Description : This was made to do working on the Controller page. 
	 * 			      This page contain some parameter of beans class 
	 * 				  So, If you want to get some items you must to send beans class to this.
	 * 
	 */
	
	 public List<Mypage> getList_myPage(Mypage input) throws Exception;
	 
	 
	 public int getPageCount(Mypage input) throws Exception;
	 
	 
	 public List<Mypage> getMyQnAList(Mypage input) throws Exception;
	 
	 
	
}
