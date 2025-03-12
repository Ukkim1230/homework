package com.web.service;

import java.util.List;

import com.web.dao.TestDAO;
import com.web.dto.TestDTO;

public class TestService {
	
	private TestDAO testDAO = new TestDAO();
	
	public List<TestDTO> selectTests(TestDTO test){
		return testDAO.selectTests(test);
	}
	public TestDTO selectTest(int tiNum) {
		return testDAO.selectTest(tiNum);
	}
	public int insertTest(TestDTO test) {
		return testDAO.insertTest(test);
	}
	public int updateTest(TestDTO test) {
		return testDAO.updateTest(test);
	}
	public int deleteTest(int tiNum) {
		return testDAO.deleteTest(tiNum);
	}

}