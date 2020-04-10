package study.spring.ezen05.service;

import java.util.List;

import study.spring.ezen05.model.TestScoreByWoo;


public interface Rank {
	public List<TestScoreByWoo> getScore(TestScoreByWoo input) throws Exception;
	
	public List<TestScoreByWoo> getScore_ten(TestScoreByWoo input) throws Exception;
	
	public List<TestScoreByWoo> getScore_man(TestScoreByWoo input) throws Exception;
	
	public List<TestScoreByWoo> getGenderItem(TestScoreByWoo input) throws Exception;
	
	public List<TestScoreByWoo> getAgeItem(TestScoreByWoo input) throws Exception;
	
}
