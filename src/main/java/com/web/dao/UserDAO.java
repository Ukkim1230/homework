package com.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.web.common.DBCon;
import com.web.dto.UserDTO;

public class UserDAO {// Data Access Object
	public List<UserDTO> getUsers() {
		List<UserDTO> users = new ArrayList<>();
		String sql = "SELECT UI_NUM, UI_NAME, UI_ID, UI_PWD, UI_AGE, UI_PHONE, UI_ADDRESS, UI_TRANS";
		sql += " FROM USER_INFO";
		try (Connection con = DBCon.getCon();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();) {
			while (rs.next()) {
				UserDTO user = new UserDTO();
				user.setUiNum(rs.getInt("UI_NUM"));
				user.setUiName(rs.getString("UI_NAME"));
				user.setUiAge(rs.getInt("UI_AGE"));
				user.setUiPwd(rs.getString("UI_PWD"));
				user.setUiId(rs.getString("UI_ID"));
				user.setUiPhone(rs.getString("UI_PHONE"));
				user.setUiPhone(rs.getString("UI_PHONE"));
				user.setUiAddress(rs.getString("UI_ADDRESS"));
				user.setUiTrans(rs.getString("UI_TRANS"));
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}
	public UserDTO getUser(int uiNum) {
		
		String sql = "SELECT UI_NUM, UI_NAME, UI_ID, UI_PWD, UI_AGE, UI_PHONE, UI_ADDRESS, UI_TRANS";
			sql += " FROM USER_INFO";
			sql += " WHERE UI_NUM=?";
			try(Connection con = DBCon.getCon();
					PreparedStatement ps = con.prepareStatement(sql);){
				ps.setInt(1,uiNum);
				ResultSet rs = ps.executeQuery();
				if(rs.next()) {
					UserDTO user = new UserDTO();
					user.setUiNum(rs.getInt("UI_NUM"));
					user.setUiName(rs.getString("UI_NAME"));
					user.setUiAge(rs.getInt("UI_AGE"));
					user.setUiPwd(rs.getString("UI_PWD"));
					user.setUiId(rs.getString("UI_ID"));
					user.setUiPhone(rs.getString("UI_PHONE"));
					user.setUiPhone(rs.getString("UI_PHONE"));
					user.setUiAddress(rs.getString("UI_ADDRESS"));
					user.setUiTrans(rs.getString("UI_TRANS"));
					return user;
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return null;
	}
}