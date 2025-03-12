package com.web.service;

import java.util.List;

import com.web.dao.UserDAO;
import com.web.dto.UserDTO;

public class UserService {
	private UserDAO userDAO = new UserDAO();
	
	public List<UserDTO> getUsers() {
		return userDAO.getUsers();
	}
	
	public UserDTO getUser(int uiNum) {
		return userDAO.getUser(uiNum);
	}
}