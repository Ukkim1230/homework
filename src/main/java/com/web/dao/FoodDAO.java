package com.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.web.common.DBCon;
import com.web.dto.FoodDTO;

public class FoodDAO {
	public List<FoodDTO> selectFoods(FoodDTO food){
		List<FoodDTO> foods = new ArrayList<>();
		String sql ="SELECT FI_NUM, FI_NAME, FI_PRICE FROM FOOD_INFO";
		try(Connection con = DBCon.getCon();
				PreparedStatement ps = con.prepareStatement(sql)){
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				FoodDTO f = new FoodDTO();
				f.setFiNum(rs.getInt("FI_NUM"));
				f.setFiName(rs.getString("FI_NAME"));
				f.setFiPrice(rs.getInt("FI_PRICE"));
				foods.add(f);
			}
	} catch (SQLException e) {
		e.printStackTrace();
	}
		return foods;
	}
	public FoodDTO selectFood(int fiNum) {
		String sql = "SELECT FI_NUM, FI_NAME, FI_PRICE FROM FOOD_INFO";
		sql += " WHERE FI_NUM=?";
		try(Connection con = DBCon.getCon();
				PreparedStatement ps = con.prepareStatement(sql)){
			ps.setInt(1, fiNum);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				FoodDTO f = new FoodDTO();
				f.setFiNum(rs.getInt("FI_NUM"));
				f.setFiName(rs.getString("FI_NAME"));
				f.setFiPrice(rs.getInt("FI_PRICE"));
				return f;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public int insertFood(FoodDTO food) {
		String sql = "insert into FOOD_INFO(FI_NAME, FI_PRICE)\r\n"
				+ " VALUES(?,?)";
				
		try(Connection con = DBCon.getCon();
				PreparedStatement ps = con.prepareStatement(sql)){
			ps.setString(1, food.getFiName());
			ps.setInt(2, food.getFiPrice());
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	public int updateFood(FoodDTO food) {
		String sql = "update FOOD_INFO";
		sql += " SET FI_NAME=?,";
		sql += " FI_PRICE=?";
		sql += " WHERE FI_NUM=?";
		try(Connection con = DBCon.getCon();
				PreparedStatement ps = con.prepareStatement(sql)){
				ps.setString(1, food.getFiName());
				ps.setInt(2, food.getFiPrice());
				ps.setInt(3, food.getFiNum());
				return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	public int deleteFood(int fiNum) {
		String sql = "DELETE FROM FOOD_INFO WHERE FI_NUM=?";
		try(Connection con = DBCon.getCon();
				PreparedStatement ps = con.prepareStatement(sql)){
			ps.setInt(1,fiNum);
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	public static void main(String[] args) {
		FoodDAO foodDAO = new FoodDAO();
//		FoodDTO food = foodDAO.selectFood(41);
		List<FoodDTO> foods = foodDAO.selectFoods(null);
		FoodDTO food = new FoodDTO();
		food.setFiName("마약떡볶이");
		food.setFiPrice(7000);
		int result = 0;
		//result = foodDAO.insertFood(food);
		//System.out.println("입력갯수 "+result);
		food.setFiNum(87);
		result = foodDAO.updateFood(food);
		System.out.println("수정갯수 "+result);
		//System.out.print(food);
	}
	
}
