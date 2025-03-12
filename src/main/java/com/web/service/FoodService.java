package com.web.service;

import java.util.List;

import com.web.dao.FoodDAO;
import com.web.dto.FoodDTO;

public class FoodService {
	
	private FoodDAO foodDAO = new FoodDAO();
	
	public List<FoodDTO> selectFoods(FoodDTO food){
		return foodDAO.selectFoods(food);
	}
	public FoodDTO selectFood(int fiNum) {
		return foodDAO.selectFood(fiNum);
	}
	public int insertFood(FoodDTO food) {
		return foodDAO.insertFood(food);
	}
	public int updateFood(FoodDTO food) {
		return foodDAO.updateFood(food);
	}
	public int deleteFood(int fiNum) {
		return foodDAO.deleteFood(fiNum);
	}

}
